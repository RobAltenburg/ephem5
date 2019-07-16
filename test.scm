(import fmt ephem
        (chicken time posix))

; mayhill lnlat -105.5287 32.903
; harrisburg lnlat -76.8867 40.2732 
; b33 radec 5.683 -2.4583
;(define now (exact->inexact (date->julian-day (current-date (* 3600 -5)))))

(define dd (date->jd 0 0 12 14 7 2019))
(define my-ecl (make-ecl -76.8867 40.2732))
(define my-equ (make-equ 20.97 -23.18))

;(define rst (lunar-rst dd my-ecl))
(define rst (solar-rst-horizon dd my-ecl 0))
(define rstb (body-rst-horizon dd my-ecl 'sun 0)) 
(define aber (equ-aberration my-equ dd)) 

(fmt #t nl (fix 5 dd) nl
     "object: " (get-date-string (rst-rise rst)) " -- " (get-date-string (rst-set rst)) nl
     "object: " (get-date-string (rst-rise rstb)) " -- " (get-date-string (rst-transit rstb)) nl
     "const:  " (constellation my-equ) nl)

