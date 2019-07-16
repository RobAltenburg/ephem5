;;; ephem-julian-day
;;; Chicken scheme wrapper for libnova
;;; 
;;; see: libnova.sourceforge.net
;;;
;;; Rob Altenburg - 2016
;;; 

;;; Module Definition {{{1
(module ephem-julian-day
        (get-date
          get-date-string
          jd->seconds
          date->jd)

        (import scheme
                (chicken base) 
                (chicken foreign)
                (chicken time posix)
                ephem-common)

        (define UNIX-EPOCH-JD 2440587.5)
        ;;; }}}

        ;;; Julian Day {{{1
        (define (date->jd seconds minutes hours day month year #!optional (tz 0.0) (dstflag #f))
          (let* ((my-date (list->vector
                            (list seconds
                                  minutes
                                  hours
                                  day
                                  (- month 1)
                                  (- year 1900) 
                                  0
                                  0 
                                  dstflag
                                  tz))))
            (exact->inexact (+ UNIX-EPOCH-JD (/ (utc-time->seconds my-date) 86400)))))


        (define (get-date jd)
          (seconds->utc-time (jd->seconds jd)))

        (define (get-date-string jd)
          (time->string (seconds->utc-time (jd->seconds jd))))

        (define (jd->seconds jd)
          (inexact->exact (floor (* 86400 (- jd UNIX-EPOCH-JD)))))

        )

