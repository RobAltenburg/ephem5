;;; ephem-heliocentric
;;; Chicken scheme wrapper for libnova
;;; 
;;; see: libnova.sourceforge.net
;;;
;;; Rob Altenburg - 2016
;;; 

;;; Module Definition {{{1
(module ephem-heliocentric
        (heliocentric-time-diff)

         (import scheme
                (chicken base) 
                (chicken foreign)
                ephem-common)
       
        (foreign-declare "#include <libnova/heliocentric_time.h>")

; }}}

;;; Heliocentric {{{1

    ;; takes jd equ-in
    (define heliocentric-time-diff
      (foreign-lambda double "ln_get_heliocentric_time_diff" double nonnull-c-pointer))

;;; }}}

)



