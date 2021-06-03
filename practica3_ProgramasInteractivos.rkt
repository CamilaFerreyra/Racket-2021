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
(define ANCHO 250)  ;ancho nde la escena
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

#|
(big-bang ESTADO_INICIAL
     [on-draw interpretar]
     [on-key manejarTeclado]
     )
|#

;***********
;   EJ 2
;***********
#|Escriba un programa que dibuje un círculo color azul
de radio 100 el cual vaya disminuyendo su tamaño
con el paso del tiempo (es decir, con cada tick del reloj).|#

;el estado del programa será el radio del circulo
;el estado es un numero
;---------
;Estado es Number
;---------

;------------------------------------------------
;dibujarCirculo2 Number String -> Image
;recibe radio y color de un circulo
;delvuelve un circulo de ese radio y color
(define (dibujarCirculo2 radio color)
  (circle radio "solid" color))

;------------------------------------------------
;interpretar2 Estado -> Image
;recibe el radio de un circulo y
;devuelve un circulo azul con ese radio
;en el medio de una escena
(define (interpretar2 estado)
  (place-image (dibujarCirculo2 estado "blue")
               (* ANCHO 1/2) (* ALTO 1/2)
               ESCENA))

;------------------------------------------------
;disminuir Estado -> Estado
;recibe un radio del circulo
;devuelve un radio menor
;si el radio es 0, devuelve el radio incial
;por ende, su minimo radio es 0
(define (disminuir estado)
  (if (= estado 0)
      ESTADO_INICIAL2 (- estado 1)))

;------------------------------------------------

;manejadorMouse Estado Number Number String -> Estado
;recibe el radio del circulo,
;las posiciones x e y del mouse
;y que clase de evento que se produjo
; cuando se preciona el click dentro de la escena,
; el radio del circulo toma el valor de la coordenada y
; de la posicion donde se hizo click
(define (manejadorMouse radio x y evento)
         (cond [(string=? evento "button-down") y]
               [else radio]
               )
         )
;------------------------------------------------


(define ESTADO_INICIAL2 100)    ;radio inicial

(big-bang ESTADO_INICIAL2
  [on-draw interpretar2]
  [on-tick disminuir]
  [on-mouse manejadorMouse])