;;; ephem-sidereal
;;; Chicken scheme wrapper for libnova
;;; 
;;; see: libnova.sourceforge.net
;;;
;;; Rob Altenburg - 2016
;;; 

;;; Module Definition {{{1
(module ephem-sidereal
        (gmst gast lmst last)

         (import scheme
                (chicken base) 
                (chicken foreign)
                ephem-common)

       (foreign-declare "#include <libnova/sidereal_time.h>")
        ;;; }}}

        ;;; Sidereal Time {{{1
        (define (gmst jd)
          (range-hours
            ((foreign-lambda double "ln_get_mean_sidereal_time" double) jd)))
        (define (gast jd)
          (range-hours
            ((foreign-lambda double "ln_get_apparent_sidereal_time" double) jd)))
        (define (lmst jd lng)
          (range-hours (+ (gmst jd) (* 24 (/ lng 360)))))
        (define (last jd lng)
          (range-hours (+ (gast jd) (* 24 (/ lng 360)))))
        ;;; }}}


        )              


