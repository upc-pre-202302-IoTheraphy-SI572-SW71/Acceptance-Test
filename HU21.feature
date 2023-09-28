Feature: Calificación de fisioterapeutas
    
    Como usuario, deseo ingresar una
     calificación al fisioterapeuta 
     por la consulta realizada para
     dar a conocer mi nivel de 
     satisfacción con la consulta. 

Criterio de aceptación #1
    Scenario: Usuario califica al fisioterapeuta
    Given el usuario se encuentra en los detalles de una consulta médica
    When selecciona la opción “Calificar servicio”
    Then se presenta el formulario para la redacción de la reseña.

Criterio de aceptación #2
    Scenario: Usuario rellena el formulario para reseña
    Given el usuario se encuentra en el formulario para la redacción de la reseña
    When redacta ingrese el <texto> dentro de la casilla de la reseña
    And selecciona la <cantidad_de_estrellas> con las que califica al profesional
    Then se registra la calificación dentro del sistema.

Examples:
    |               texto                 | cantidad_de_estrellas |
    | "The best service I had in my life" |           5           |
