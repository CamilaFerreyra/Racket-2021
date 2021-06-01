;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practica3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|EJ 1|#
;definiciones de la escena
(define ANCHO 350)
(define ALTO 150)
(define ESCENA (empty-scene ANCHO ALTO))

; interpretar: Estado -> Image
; dado un estado, devuelve una imagen a mostrar por el programa.
(define
  (interpretar estado)
  (place-image (circle 20 "solid" estado)
               (* ANCHO 1/2) (* ALTO 1/2) ESCENA)
  )

; manejarTeclado : Estado String -> Estado
; dado un  estado y un string, cambia el estado.
; a : azul
; v : verde
; r : rojo
; espacio : negro
; flecha hacia arriba : vuelve al estado incial
(define (manejarTeclado estado tecla)(cond
                             [(key=? tecla "a") "blue"]
                             [(key=? tecla "r") "red"]
                             [(key=? tecla "v") "green"]
                             [(key=? tecla "up") ESTADO_INICIAL]
                             [(key=? tecla " ") "black"]
                             [else estado]
                             )
)

(define ESTADO_INICIAL "yellow") ; estado incial

(big-bang ESTADO_INICIAL      ;estado inicial
  
  [to-draw interpretar]       ;dibuja en pantalla el circulo incial
  
  [on-key manejarTeclado]     ;se invoca cuando se presiona una tecla
                              ;maneja el evento. Cambia el estado.
  
  )

#|EJ 2|#

