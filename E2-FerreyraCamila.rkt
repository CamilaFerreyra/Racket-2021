;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname E2-FerreyraCamila) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;E2-FerreyraCamila
;primer parcial prog1-2021
;-------------------------------------------------
;El Estado del programa sera el angulo de rotacion y el color
;del satelite que seran representados mediante una estructura
(define-struct sysSatelite [ang color])
;sysSatelite es Number String
;interpretacion: el primer elemento, ang, es un numero que
;representa el angulo de rotacion
;el segundo elemento, color, es una palabra que
;representa el color del satelite
;---------
;Estado es sysSatelite
;---------

(define ANCHO 500)
(define ALTO 250)
(define COLOR-ESCENA "black")
(define ESCENA (empty-scene ANCHO ALTO COLOR-ESCENA))
;centro de la escena
(define CX (* 1/2 ANCHO)) ;coordenada x del centro de la escena
(define CY (* 1/2 ALTO))  ;coordenada y del centro de la escena

(define RADIO-C1 20)         ; radio del circulo central
(define COLOR-C1 "yellow")   ; color del circulo central

(define RADIO-SATELITE 10)

(define RADIO-TRAYECTORIA 100)
(define COLOR-TRAYECTORIA "red")

(define C1 (circle RADIO-C1 "solid" COLOR-C1))

(define TRAYECTORIA (circle RADIO-TRAYECTORIA "outline" COLOR-TRAYECTORIA))

(define DELTA 0.05)   ;desplazamiento del satelite

;-------------------------------------------------

;pos-ang-X Number -> Number
;dado un angulo de rotacion
;determina una poscision x
(define (pos-ang-X a)
  (+ (* RADIO-TRAYECTORIA (cos a)) CX))

;pos-ang-X Number -> Number
;dado un angulo de rotacion
;determina una poscision y
(define (pos-ang-Y a)
  (+ (* RADIO-TRAYECTORIA (sin a)) CY))
;-------------------------------------------------

;interpretar Estado -> Image
;dada una estructura del tipo sysSatelite
;devuelve una escena,con un circulo central,
;una trayectoria y un satelite determinando
;su posicion y color por el estado
(define (interpretar estado)
  (place-image (circle RADIO-SATELITE "solid" (sysSatelite-color estado))
               (pos-ang-X (sysSatelite-ang estado))
               (pos-ang-Y (sysSatelite-ang estado))
               (place-image TRAYECTORIA CX CY
                            (place-image C1 CX CY ESCENA ))))
               
  
;-------------------------------------------------

;manejarMouse Estado Number Number String -> Estado
;si se presiona la tecla del mouse dentro del circulo de la trayectoria,
;el satelite cambia de color:
;verde->rojo->gris->verde....
;si se presiona la tecla del mouse por fuera de la trayectoria o
;si se presiona exactamente la trayectoria,
;el satelite alcanzara el angulo 0 y terminara su ejecucion
;(define (manejarMouse x y evento)
;  )
;-------------------------------------------------
;manjearReloj Estado -> Estado
;cuando pasa el tiempo,
;cambia el color del satelite
#|(check-expect ((manejarReloj (make-sysSatelite 0 "verde"))
              (make-sysSatelite 0.05 "verde")))
(check-expect ((manejarReloj (make-sysSatelite 0.05 "rojo"))
              (make-sysSatelite 0.1 "verde")))  
|#
(define (manejarReloj estado)
  (make-sysSatelite (+ (sysSatelite-ang estado) DELTA)
                    (sysSatelite-color estado)))
;-------------------------------------------------

;terminar? Estado -> Boolean
;es un predicado que devuelve true si
;la posicion angular llego a 0
(define (terminar? estado)
  (if (= (sysSatelite-ang estado) 0) #true #false))
;-------------------------------------------------
(define ESTADO-INICIAL (make-sysSatelite 3.14 "gray"))
(big-bang ESTADO-INICIAL
  [on-draw interpretar]
  [on-tick manejarReloj]
  #|[on-mouse manejarMouse]|#
  [stop-when terminar?])



  
  
  