;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practica5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;----------------
;  Practica 5
;----------------


;contien-Marcos? : Contactos -> Boolean
;dada una lista de contactps, determina si "Marcos"
;es un elemento de la misma.

(check-expect (contiene-Marcos? empty) #false)
(check-expect (contiene-Marcos?(list "cami" "cami linda" "4")) #false)
(check-expect (contiene-Marcos? (list "Cami" "Marcos")) #true)
(check-expect (contiene-Marcos? (cons "hola" (cons "esto es una lista siempre" empty))) #false)

(define (contiene-Marcos? lista)
  (cond [(empty? lista) #false]
        ;da lo mismo poner "else" que "(cons? lista)" como condicion pa matchear
        [else (if (string=? (first lista) "Marcos")
                           #true
                           (contiene-Marcos? (rest lista)))]
        )
  )
(contiene-Marcos? empty)
(contiene-Marcos?(list "cami" "dani" "4"))
(contiene-Marcos? (list "Cami" "Marcos"))

;myStringMember? : Contactos String -> Boolean
;dado un nombre y una lista de contactos, etermina
;si este nombre pertenece a la lista de contactos
(check-expect (myStringMember? (list "hola") "CHAU") #false)
(check-expect (myStringMember? empty "hola") #false)
(check-expect (myStringMember? (list "cami" "ricardito") "ricardito") #true)
(define (myStringMember? lista nombre)
  (cond [(empty? lista) #false]
        [else (if (string=? (first lista) nombre)
                  #true
                  (myStringMember? (rest lista) nombre))
                  ]
        )
  )
(myStringMember? (list "Cami" "lucha" "riki") "cami")
(member? 1 (list 1 2 3))
(member? #true (list #false #false))

;-----------
;ej 7
;-----------
; una Lista-de-montos es:
; '()
; (cons NumeroPositivo Lista-de-montos)
; Lista-de-montos representa una lista con montos de dinero

;suma : Lista-de-montos -> Number
;toma una lista de montos de dinero y la acumula
;devolviendo el monto total de dinero.
(check-expect (suma (list 1 2 0 4)) 7)
(check-expect (suma empty) 0)
(check-expect (suma (list 2)) 2)
(define (suma lista)
  (cond [(empty? lista) 0]
        [else (+ (first lista) (suma (rest lista)))]
        )
  )


;-----------
;ej 8
;-----------

; una Lista-de-numeros es:
; '()
; (cons Numero Lista-de-numeros)

;pos? Lista-de-numeros -> Boolean
;toma una lista de numeros y devuelve #true si todos
;los valores de la lista son positivos. De lo contrario
;devuelve #false

(check-expect (pos? (list -1 1 2 3)) #false)
(check-expect (pos? empty) #true)
(check-expect (pos? (list 1 2 3)) #true)

(define (pos? lista)
  (cond [(empty? lista) #true]
        [else (if (< (first lista) 0)
                  #false
                  (pos? (rest lista)))]))

;checked-suma: Lista-de-numeros -> Number | String
;si la lista de numeros pertenece a Lista de montos
;devuelve la suma de los elementos.
;sino, devuelve un string indicando error
(check-expect (checked-suma (list -1 1 2)) "error")
(check-expect (checked-suma empty) 0)
(check-expect (checked-suma (list 1 2)) 3)

(define (checked-suma lista)
  (if (pos? lista)
      (suma lista)
      "error"))
;-----------
; ej 12
;-----------
;pares : Lista-de-numeros -> Lista-de-numeros
;filtra la lista dejando solo los numeros pares
(check-expect (pares (list 1 2 3 8 9 15 4)) (list 2 8 4))
(check-expect (pares  empty) empty)
(check-expect (pares  (list 1)) empty)
(define (pares lista)
  (cond [(empty? lista) empty]
        [else (if (even? (first lista))
                  (cons (first lista) (pares (rest lista)))
                  (pares (rest lista)))]))
;---------------
(check-expect (maximo (list 1 2 3 4 5)) 5)
(check-expect (maximo empty) 0)

(define (maximo lista)
  (cond [(empty? lista) 0]
        [else (if (> (first lista) (maximo (rest lista)))
                  (first lista)
                  (maximo (rest lista)))]))
(maximo (list 1 2 3 4))
(maximo (list 100 2 3 4))

;--------------------
(define (fold f c l)
(cond [(empty? l) c]
      [else (f (first l) (fold f c (rest l)))]))



(define CIRCULOS (list (circle 10 "solid" "blue")
(circle 20 "solid" "yellow")
(circle 30 "solid" "blue")
(circle 40 "solid" "yellow")
(circle 50 "solid" "blue")
(circle 60 "solid" "yellow")))
(define FONDO (empty-scene 200 200))

(foldr overlay FONDO CIRCULOS)

;--------------------
(check-expect (sumcuad (list 1 2 3)) (+ 1 4 9))
(define (sumcuad lista)
  (foldr + 0 (map sqr lista)))
;--------------------
(check-expect (sumdist (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) 22)
(check-expect (sumdist empty) 0)

(define (distancia posicion)
  (sqrt (+ (sqr (posn-x posicion)) (sqr (posn-y posicion)))))
(define (sumdist lista)
  (foldr + 0 (map distancia lista)))
;-------------------
(define (my_and x y)
  (and x y))
(define (my_or x y)
  (or x y))
;-------------------
(define (aux1 numero)
  (if (> numero 0) #true #false))
(define (aux2 lista)
  (foldr + 0 lista))
;algun-pos: List(List(Number))-> Boolean
(define (algun-pos lista)
 (foldr my_or #false (map aux1 (map aux2 lista))))
(algun-pos (list
            (list -1 -2 -4)
            (list -10)
            (list -10 1)
            ))

;-------------------
;uno: Any -> 1
(define (uno x) 1)
;contar: List -> Number
(define (contar lista)
  (foldl + 0 (map uno lista)))
;may-4: Number -> Boolean
(define (may-4 x)
  (if (> x 4) #true #false))
;long-lists List( List( Any)) -> Boolean
(define (long-lists lista)
  (foldl my_and #true (map may-4 (map contar lista))))
(check-expect (long-lists (list (list 1 2 3 4 5) (list 1 2 3 4 5 6) (list 87 73 78 83 33))) #true)
;----------------------

;todo-true: List(Any) -> Boolean
(define (todos-true lista)
  (foldl my_and #true (filter boolean? lista)))
(check-expect (todos-true (list 5 #true "abc" #true "def")) #true)
(check-expect (todos-true (list 1 #true (circle 10 "solid" "red") -12 #false)) #false)

;---------------------------------
(define-struct alumno [nombre nota faltas])
; alumno (String, Number, Natural). Interpretación
; - nombre representa el nombre del alumno.
; - nota representa la calificación obtenida por el alumno (entre 0 y 10).
; - faltas: número de clases a las el alumno no asistió.
(define (nombres alumno)
  (alumno-nombre alumno))
(define (nueves alumno)
  (if (> (alumno-nota alumno) 9) #true #false))
(define (destacados lista)
  (map nombres (filter nueves lista)))
(check-expect (destacados
               (list (make-alumno "Ada Lovelace" 10 20)
                     (make-alumno "Carlos Software" 3.5 12)))
              (list "Ada Lovelace"))
;-----------------
(define (separatista lista)
  (cond [(empty? lista) empty]
        [else (cons (list (first lista)) (separatista (rest lista)))]
        ))
(separatista (list 1 2 3))
(define (aux22 x y)
  (cons (list x) y))
(define (separar lista)
  (foldr aux22 empty lista))
(separar (list 1 2 3))