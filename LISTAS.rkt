;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname LISTAS) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (contiene-Cami? lista)
  (cond [(empty? lista) #false]
        [(cons? lista) (if (string=? (first lista-1) "Cami")
                           #true
                           (contiene-Cami? (rest lista-1)))])
  )

(check-expect (contiene-Cami? '()) #false)
(check-expect (contiene-Cami? (list "culo" "Dañel")) #false)
(check-expect (contiene-Cami? (list "Roberto" "dani" "Cami")) #true) 
             
(define lista-1 (cons "Camila"
                      (cons "Roberto"
                            (cons "Nacho" '())))
  )
(define lista-2 (list "cami" "roberto" "holaaaa"))

(contiene-Cami? lista-1)
(contiene-Cami? lista-2)