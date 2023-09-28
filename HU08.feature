Feature: Visualización de ejercicios

    Como usuario, deseo visualizar los ejercicios del 
    tratamiento para que comprenda fácilmente como deben 
    ser realizados.

Criterio de aceptación #1
    Scenario: Usuario no inscrito en tratamiento
    Given que el usuario se encuentra en la vista de un tratamiento 
    When selecciona "Enroll" 
        And aún no se ha inscrito 
    Then Se empieza desde la primera sesión

Criterio de aceptación #2
    Scenario: Usuario inscrito en tratamiento  
    Given que el usuario se encuentra en la vista de un tratamiento 
    When selecciona "Enroll" 
        And ya se ha inscrito 
    Then Se empieza desde la número de session <Number>

Examples: 
    | Number |      
    |   1    | 
