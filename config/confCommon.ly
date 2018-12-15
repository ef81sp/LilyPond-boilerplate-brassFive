\version "2.18.2"

% 始めのページのタイトル
confCommonBookTitleMarkup = \markup {
  \override #'(baseline-skip . 3.5)
  \column {
    \fill-line { \fromproperty #'header:dedication }
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line {
        \large \bold
        \fromproperty #'header:instrument
        \null
        \null
      }
      \fill-line {
        " "
      }
      \fill-line {
        \fontsize #7 \bold
        \fromproperty #'header:title
      }
      \fill-line {
        \huge \large \bold
        \fromproperty #'header:subtitle
      }
      \fill-line {
        \large \bold
        \null
        \null
        \fromproperty #'header:composer
      }
      \fill-line {
        \smaller \bold
        \fromproperty #'header:subsubtitle
      }
      \fill-line {
        \null
        \fromproperty #'header:poet
        \null
      }
      \fill-line {
        \fromproperty #'header:meter
        \fromproperty #'header:arranger
      }
    }
  }
}

% =========================================================
% =========================================================
%% Book first page and last page predicates
#(define (book-first-page? layout props)
   "Return #t iff the current page number, got from @code{props}, is the
book first one."
   (define (ancestor layout)
   "Return the topmost layout ancestor"
   (let ((parent (ly:output-def-parent layout)))
     (if (not (ly:output-def? parent))
       layout
       (ancestor parent))))
   (= (chain-assoc-get 'page:page-number props -1)
    (ly:output-def-lookup (ancestor layout) 'first-page-number)))

#(define (book-last-page? layout props)
   "Return #t iff the current page number, got from @code{props}, is the
book last one."
   (and (chain-assoc-get 'page:is-bookpart-last-page props #f)
    (chain-assoc-get 'page:is-last-bookpart props #f)))

#(define (first-page layout props arg)
  (if (book-first-page? layout props)
    (interpret-markup layout props arg)
    empty-stencil))

#(define (last-page layout props arg)
  (if (book-last-page? layout props)
    (interpret-markup layout props arg)
    empty-stencil))

#(define (not-first-page layout props arg)
  (if (not (book-first-page? layout props))
    (interpret-markup layout props arg)
    empty-stencil))

#(define ((on-page nmbr) layout props arg)
 (if (= (chain-assoc-get 'page:page-number props -1) nmbr)
   (interpret-markup layout props arg)
   empty-stencil))

%% Bookpart first page and last page predicates
#(define (part-first-page? layout props)
  (= (chain-assoc-get 'page:page-number props -1)
   (ly:output-def-lookup layout 'first-page-number)))

#(define (part-last-page? layout props)
  (chain-assoc-get 'page:is-bookpart-last-page props #f))

#(define (part-first-page layout props arg)
  (if (part-first-page? layout props)
    (interpret-markup layout props arg)
    empty-stencil))

#(define (not-part-first-page layout props arg)
  (if (not (part-first-page? layout props))
    (interpret-markup layout props arg)
    empty-stencil))

#(define (part-last-page layout props arg)
  (if (part-last-page? layout props)
    (interpret-markup layout props arg)
    empty-stencil))

%% unused
#(define (not-single-page layout props arg)
  (if (not (and (= (chain-assoc-get 'page:page-number props -1)
           (ly:output-def-lookup layout 'first-page-number))
         (chain-assoc-get 'page:last? props -1)))
   (interpret-markup layout props arg)
   empty-stencil))

#(define (create-page-number-stencil layout props arg)
  (if (eq? (ly:output-def-lookup layout 'print-page-number) #t)
   (interpret-markup layout props arg)
   empty-stencil))

#(define (print-page-number-check-first layout props arg)
  (if (or (not (book-first-page? layout props))
      (eq? (ly:output-def-lookup layout 'print-first-page-number) #t))
   (create-page-number-stencil layout props arg)
   empty-stencil))
% =========================================================
% =========================================================

confCommonOddHeaderMarkup = \markup
\fill-line {
  %% force the header to take some space, otherwise the page layout becomes a complete mess.
  \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  \on-the-fly #not-part-first-page \fromproperty #'header:instrument
  \null
}

%% evenHeaderMarkup would inherit the value of oddHeaderMarkup if it were not defined here
confCommonEvenHeaderMarkup = \markup
\fill-line {
  \null
  \on-the-fly #not-part-first-page \fromproperty #'header:instrument
  \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
}

confCommonOddFooterMarkup = \markup {
  \column {
    \fill-line {
      %% Copyright header field only on first page in each bookpart.
      \fontsize #-2
        \on-the-fly #part-first-page \fromproperty #'header:copyright
      \fontsize #-2
        \on-the-fly #not-first-page \fromproperty #'header:tagline
      \null
    }
  }
}

% evenFooterMarkupCustom = \markup {
%   \fill-line {
%     " "
%     %% Tagline header field only on last page in the book.
%     \on-the-fly #last-page \fromproperty #'header:tagline
%     \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
%   }
% }
