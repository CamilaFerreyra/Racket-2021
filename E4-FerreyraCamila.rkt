;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname E4-FerreyraCamila) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;-----------------
;-  EJERCICIO 4  -
;-----------------

;Ferreyra Camila Anahí
;segundo parcial - 1ro julio 2021

;-----------------
;-  EJERCICIO 4  -
;-----------------


(define-struct alumno [nombre parcial1 parcial2])
;alumno (String Number Number).
;alumno representa a un alumno de una materia. Interpretacion:
; - nombre: representa el nombre de un alumno
; - parcial1: representa la nota que obtuvo el alumno en el 1er parcial
; - parcial2: representa la nota que obtuvo el alumno en el 2do parcial

;-----------------------------------------------------

;defino algunos alumnos para casos de prueba
(define CAMILA (make-alumno "Camila" 5.5 6))
(define DANIEL (make-alumno "Daniel" 10 10))
(define ALDANA (make-alumno "Aldana" 6 6))

;defino algunas listas de alumnos para casos de prueba
(define CURSO1 (list CAMILA DANIEL ALDANA))
(define CURSO2 empty)
(define CURSO3 (list CAMILA))
(define CURSO4 (list DANIEL))

;-----------------------------------------------------

;a)

;promedio: alumno -> Number
;calcula el promedio de un unico alumno

(check-expect (promedio CAMILA) 5.75)
(check-expect (promedio DANIEL) 10)
(check-expect (promedio ALDANA) 6)

(define (promedio alumno)
  (/ (+ (alumno-parcial1 alumno) (alumno-parcial2 alumno)) 2))

;-----------------------------------------------------

;b)

;promedioClase: List(alumno) -> Number
;calcula el promedio de toda la clase,
;el promedio de los promedios
;si la lista esta vacia devuelve 0.

(check-expect (promedioClase CURSO1) 7.25)
(check-expect (promedioClase CURSO2) 0)
(check-expect (promedioClase CURSO3) 5.75)
(check-expect (promedioClase CURSO4) 10)

(define (promedioClase lista)
  (cond [(empty? lista) 0]
        [else (/ (foldl + 0 (map promedio lista)) (length lista))]))

;-----------------------------------------------------

;c)

;filtroAprobados: List(alumno) -> List(alumno)
;toma una lista de alumnos y devuelve una lista
;con los alumnos que hayan aprobado AMBOS parciales
; - parcial aprobado sii nota >= 6

(check-expect (filtroAprobados CURSO1) (list DANIEL ALDANA))
(check-expect (filtroAprobados CURSO2) empty)
(check-expect (filtroAprobados CURSO3) empty)
(check-expect (filtroAprobados CURSO2) CURSO2)

(define (filtroAprobados lista)
  (cond [(empty? lista) empty]
        [else (if(and
               (>= (alumno-parcial1(first lista)) 6)
               (>= (alumno-parcial2(first lista)) 6))
                 (cons (first lista) (filtroAprobados (rest lista)))
                 (filtroAprobados (rest lista)))]))

;---------
;suma: List(Number) -> Number
;acumula todos los elementos de una lista de numeros

(check-expect (suma (list 1 2 3)) 6)
(check-expect (suma empty) 0)

(define (suma lista)
  (cond [(empty? lista) 0]
        [else (+ (first lista) (suma (rest lista)))]))

;---------
;aux: List(Alumno) -> List(Number)
;toma una lista de alumnos. Devuelve una lista de promedios de alumnos

(check-expect (aux CURSO1) (list 5.75 10 6))
(check-expect (aux CURSO2) empty)

(define (aux lista)
  (cond [(empty? lista) empty]
        [else (cons (promedio (first lista)) (aux (rest lista)))]))
;---------

;promedioClase_2: List(alumno) -> Number
;calcula el promedio de toda la clase,
;el promedio de los promedios
;si la lista esta vacia devuelve 0.
; NO UTILIZA MAP, FILTER NI FOLD

(check-expect (promedioClase_2 CURSO1) 7.25)
(check-expect (promedioClase_2 CURSO2) 0)
(check-expect (promedioClase_2 CURSO3) 5.75)
(check-expect (promedioClase_2 CURSO4) 10)

(define (promedioClase_2 lista)
  (cond [(empty? lista) 0]
        [else (/ (suma (aux lista)) length(lista))]))
   
;---------
;promedioAprobados: List(alumno) -> Number
;calcula el promedio de los alumnos que aprobaron AMBOS parciales
; - parcial aprobado sii su nota es mayor o igual a 6.

(check-expect (promedioAprobados CURSO1) 8)
(check-expect (promedioAprobados CURSO2) 0)
(check-expect (promedioAprobados CURSO3) 0)
(check-expect (promedioAprobados CURSO4) 10)

(define (promedioAprobados lista)
  (promedioClase_2(filtroAprobados lista)))
