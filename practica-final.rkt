;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica-final) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;practica final

(define (multiplicarx3 n)
  (* n 3))

(define (sumar1 n)
  (+ 1 n))

(define (absoluto n)
  (if (< n 0) (- n) n))

(define (A lista)
  (map sumar1 (map abs (map multiplicarx3 lista))))

(A (list -8 4 1 3 0))

(define (positivo? n)
  (if (< n 0) #false #true))

(define (multiplicar a b)
  (* a b))

(define (B lista)
  (foldr multiplicar 1 (filter positivo? lista)))

(B (list 30 -54 -10 1 8 11))

(define (multiplicarx2 n)
  (* n 2))

(define (C lista)
  (map multiplicarx2 (map string-length lista)))

(C (list "Juan Alberto" "Ana María" "Dolores"))

(define (suma-sen lista)
  (cond [(empty? lista) 0]
        [(cons? lista) (+ (sin (first lista))
                          (suma-sen (rest lista)))]
        ))

(suma-sen (list pi 0 (/ pi 6) (- pi) (/ (* 3 pi) 2) ))
  

(define-struct registro [nro usuario tarifa min llamadas num-amigo])

(define (llamo? registro numero)
  (cond [(empty? (registro-llamadas registro)) #false]
        [else (if (= (first (registro-llamadas registro)) numero)
                  #true
                  (llamo? (make-registro
                           (registro-nro registro)
                           (registro-usuario registro)
                           (registro-tarifa registro)
                           (registro-min registro)
                           (rest (registro-llamadas registro))
                           (registro-num-amigo registro))
                          numero))]))
(define (cant-veces registro numero)
  (cond [(empty? (registro-llamadas registro)) 0]
        [else (if (= (first (registro-llamadas registro)) numero)
                  (+ 1 (cant-veces (make-registro
                           (registro-nro registro)
                           (registro-usuario registro)
                           (registro-tarifa registro)
                           (registro-min registro)
                           (rest (registro-llamadas registro))
                           (registro-num-amigo registro))
                          numero))
                  (cant-veces (make-registro
                           (registro-nro registro)
                           (registro-usuario registro)
                           (registro-tarifa registro)
                           (registro-min registro)
                           (rest (registro-llamadas registro))
                           (registro-num-amigo registro))
                          numero))]))


(define (eliminar lista nro)
  (cond [(empty? list) '() ]
        [else (if (= (first lista) nro)
                   (cons '() (eliminar (rest lista) nro))
                   (cons (first lista) (eliminar (rest lista) nro)))]))

(define (elim-amigo reg nro)
  (make-registro
   (registro-nro reg)
   (registro-usuario reg)
   (registro-tarifa reg)
   (registro-min reg)
   (eliminar (registro-llamadas reg) (registro-num-amigo reg))
   (registro-num-amigo reg)))

(define ESTADO1 "rojo")

(define (interpretar-imagen e)
  (cond [(string=? "rojo" e) (place-image (circle 100 "solid" "red")
                                          250 250 (empty-scene 500 500))
                             ]
        [(string=? "verde" e) (place-image (square 400 "outline" "green")
                           250 250 (empty-scene 500 500))]
        [(string=? "chau" e) (place-image (text "Chau" 30 "white")
                                          250 250
                                          (empty-scene 500 500 "black"))]))

(define (interpretar-mouse e x y evento)
  (cond [(string=? "rojo" e)
         (if (and (and (and (> x 150) (< x 400)) (and (< y 400) (> y 150)))
             (string=? "button-down" evento))
             "chau" e)]
        [else (if (and (and (and (> x 50) (< x 300)) (and (< y 300) (> y 50)))
             (string=? "button-down" evento))
             "chau"
             e)]))

(define (interpretar-reloj e)
  (cond [(string=? "rojo" e) "verde"]
        [else "rojo"]))

(define (interpretar-teclado e tecla)
  (cond [(key=? tecla "up") "chau"]
        [(key=? tecla "g") "rojo"]
        [(string=? tecla "left") "verde"])) ;dicen que lo haga con key pero con string funciona
  
(define (terminar? e)
  (string=? "chau" e))

(big-bang ESTADO1
  [to-draw interpretar-imagen]
  [on-mouse interpretar-mouse]
  [on-key interpretar-teclado]
  [on-tick interpretar-reloj 1]
  [stop-when terminar? interpretar-imagen]
  )

  
  




  

