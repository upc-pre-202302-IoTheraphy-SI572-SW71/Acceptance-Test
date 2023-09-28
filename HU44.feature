Feature: Agregación de diagnóstico

    Como developer,  
    deseo poder insertar un diagnóstico en la tabla de diagnósticos de la base de datos
    para que los usuarios fisioterapistas puedan visualizarlo desde la aplicación.

Criterio de aceptación #1
    Scenario: Almacenamiento correcto del archivo
    Given que el servicio de agregación de diagnóstico está disponible en el URL:” http://theraphy.com/user/{user_id}/add-diagnostic/”
    When el developer envía un request para insertar los datos de un diagnostico
    Then se añade en la tabla Diagnósticos de la base de datos de Theraphy.
    And se presenta el mensaje que indica “200(OK)”.


Examples: 
    |            Message               |           
    |            200(OK)               |  

Criterio de aceptación #2
    Scenario: Almacenamiento incorrecto del archivo
    Then el sistema envía el diagnostico al paciente.
    Given que el servicio de agregación de diagnóstico está disponible en el URL:” http://theraphy.com/user/{user_id}/add-diagnostic/”
    When se envían los datos y el protocolo HTPP no logra encontrar a la base de datos
    Then sale un mensaje que indica “error 404(Not Found)”.


Examples: 
    |            Message               |           
    |         404(Not Found)           | 
