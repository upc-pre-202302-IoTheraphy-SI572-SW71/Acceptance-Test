Feature: Visualización de los resultados de la consulta 

    Como usuario, deseo poder ver el diagnóstico 
    y las recomendaciones del fisioterapeuta 
    para recordar fácilmente los resultados de 
    la consulta.

Criterio de aceptación #1
    Scenario: Usuario visualiza los resultados de su consulta
    Given que el usuario se encuentra en la sección "Mis consultas médicas"
    And el sistema presenta los <consultas medicas> que ha realizado
    When selecciona una <consulta medica> de la lista
    Then el sistema presenta las <observaciones> y la <prescripcion> de la consulta médica.


Examples: 
    |                      consulta medica                             |              observaciones           |        prescription        |   
    |  "Dra. Valentina Velarde", "Physiotherapy", "Friday 3 , January" |  "Back pain and shortness of breath" | "Penicilin and derivatives" | 


Criterio de aceptación #2
    Scenario: Usuario no ha realizado consultas médicas
    Given que el usuario cuenta con una sesión iniciada 
    And el usuario no ha realizado consultas médicas
    When ingresa a la sección "Mis consultas médicas"
    Then se presenta el mensaje: "Todavía no ha tenido consultas médicas", en pantalla.
