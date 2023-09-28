Feature: Búsqueda de tratamientos   

    Como usuario, deseo encontrar tratamientos 
    de terapia física que pueda realizar desde mi 
    casa para mejorar mi condición física.

Criterio de aceptación #1
    Scenario: Usuario ingresa a la sección “Tratamientos”
    Given que el usuario cuenta con una sesión iniciada 
    When abre la sección "Tratamientos"
    Then el sistema muestra una lista de tratamientos de terapia física con los siguientes datos:
        <imagen_tratamiento>, <nombre_de_tratamiento> y <cantidad_de_sesiones>
    And se presenta la sección “Buscar” en la parte superior de la pantalla.

Examples: 
   |   imagen_tratamiento | nombre_de_tratamiento | cantidad_de_sesiones |  
   | obesitytreatment.jpg |        "Obesity"      |          28          |


Criterio de aceptación #2
    Scenario: Usuario busca un tratamiento por nombre
    Given que el usuario se encuentra en la sección "Tratamientos"
    And el sistema presenta la sección "Buscar" en la parte superior de la pantalla 
    When ingresa el <nombre_del_tratamiento> en el campo "Buscar"
    Then el sistema presenta los tratamientos que coinciden con el nombre del tratamiento ingresado.

Examples: 
    | nombre_de_tratamiento |
    |        "Knees"        |


Criterio de aceptación #2
    Scenario: Usuario no encuentra resultados que coincidan con la búsqueda
    Given que el usuario se encuentra en la sección "Tratamientos"
    And el sistema presenta la sección "Buscar" en la parte superior de la pantalla  
    When ingresa el <nombre_del_tratamiento> en el campo "Buscar"
    And no existen tratamientos que concuerden con el nombre ingresado
    Then se presenta el mensaje: "No se encontraron resultados", en pantalla.

Examples: 
    | nombre_de_tratamiento |
    |        "Karate"       |
