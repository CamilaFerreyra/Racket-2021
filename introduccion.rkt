;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname introduccion) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;racket trabaja con notacion polaca
(- 15 5)
;funciones con strings
(string-append "hola " "yo soy kmi")
(string->number "r")
(number->string 4)
(substring "hola" 1)
; funciones con imagenes
#|En lenguaje racket, las imagenes son un
 tipo de dato|#
(circle 2 "solid" "red")
(image-height (rectangle 20 30 "outline" "blue"))
(overlay (rectangle 30 60 "solid" "orange")
         (ellipse 60 30 "solid" "yellow")
         (ellipse 60 30 "outline" "black"))

(place-image(rectangle 30 60 "solid" "orange")
            0 0
            (ellipse 160 130 "solid" "yellow"))
(place-image(rectangle 30 60 "solid" "orange")
            100 50
            (circle 50 "solid" "red"))
(modulo 4 2)