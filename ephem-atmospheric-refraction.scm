;;; ephem-atmospheric-refraction
;;; Chicken scheme wrapper for libnova
;;; 
;;; see: libnova.sourceforge.net
;;;
;;; Rob Altenburg - 2016
;;; 

;;; Module Definition {{{1
(module ephem-atmospheric-refraction
        (refraction-adj)

        (import scheme
                (chicken base) 
                (chicken foreign)
                ephem-common)

        (foreign-declare "#include <libnova/refraction.h>")
        ;;; }}}

        ;;; Atmospheric Refraction {{{1
        (define refraction-adj
          (foreign-lambda double "ln_get_refraction_adj" double double double))
        ;;; }}}


        )              


