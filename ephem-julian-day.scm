;;; ephem-julian-day
;;; Chicken scheme wrapper for libnova
;;; 
;;; see: libnova.sourceforge.net
;;;
;;; Rob Altenburg - 2016
;;; 

;;; Module Definition {{{1
(module ephem-julian-day
        ( get-julian-day
          get-julian-from-sys
          get-date-from-sys
          get-date
          )

        (import scheme
                (chicken base) 
                (chicken foreign)
                (chicken time posix)
                ephem-common)

        (foreign-declare "#include <libnova/julian_day.h>")

        ;;; }}}

        ;;; Julian Day {{{1
       (define (get-julian-day date)
          ((foreign-lambda double "ln_get_julian_day"
                          nonnull-c-pointer)
            date))

       (define (get-julian-from-sys)
          ((foreign-lambda double "ln_get_julian_from_sys")))

         (define (get-date-from-sys)
          (let ((date (make-date)))
            ((foreign-lambda void "ln_get_date_from_sys"
                             nonnull-c-pointer)
             date)
            date))

       (define (get-date jd)
          (let ((date (make-date)))
            ((foreign-lambda void "ln_get_date"
                             double
                             nonnull-c-pointer)
             jd
             date)
            date))

)
