;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practica3_ProgramasInteractivos) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;***********
;   EJ 1
;***********

;el estado del programa sera el color del circulo
;el estado es una palabra.
;---------
;Estado es string
;---------

;definiciones de escena
(define ANCHO 500)  ;ancho nde la escena
(define ALTO 250)   ;alto de la escena
(define ESCENA (empty-scene ANCHO ALTO))  ;escena

;definiciones circulo
(define RADIO 20)    ;radio del circulo

;------------------------------------------------
;dibujarCirculo String -> Imagen
;recibe un color y decuelve
;un circulo de ese color
(define (dibujarCirculo color)
  (circle RADIO "solid" color))

;------------------------------------------------
;interpretar Estado -> Imagen
;recibe un color y devuelve un circulo 
;de ese color, pocisionado en el centro
;de una escena
(define (interpretar estado)
  (place-image (dibujarCirculo estado)
               (* ANCHO 1/2)(* ALTO 1/2) ESCENA))

;------------------------------------------------
;manejarTeclado Estado String -> Estado
;recibe un color y una tecla presionada
;modifica el color en base a la tecla que recibe:
  ;r : rojo
  ;v : verde
  ;a : azul
  ;espacio : negro
  ;flecha hacia arriba : vuelve al estado incial
(define (manejarTeclado estado tecla)
  (cond [(key=? tecla "r") "red"]
        [(key=? tecla "v") "green"]
        [(key=? tecla "a") "blue"]
        [(key=? tecla " ") "black"]
        [(key=? tecla "up") ESTADO_INICIAL]
        [else estado]))
  
;------------------------------------------------
(define ESTADO_INICIAL "red")  ;estado inicial del programa

(big-bang ESTADO_INICIAL
     [on-draw interpretar]
     [on-key manejarTeclado]
     )

;***********
;   EJ 2
;***********