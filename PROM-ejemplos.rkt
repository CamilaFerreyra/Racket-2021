;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname PROM-ejemplos) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;auxxxxxxxxxxxxxxxxxxxxxxxxxxxx
(define (promedio lista)
  (cond [(empty? lista) 0]
        [else (+ (/ (first lista) (length lista)) (promedio (rest lista)))]))
;n cambia en el tiempo. MAL

;-------------------------------------------------------------
(define (promedio2 lista) (aux lista (length lista))) 
(define (aux lista n) ;n se mantiene en el tiempo. BIEN
  (cond [(empty? lista) 0]
        [else (+ (/ (first lista) n) (aux (rest lista) n))]))
;-------------------------------------------------------------

(promedio (list 1 2 3))
(promedio2 (list 1 2 3))