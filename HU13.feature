Feature: Reserva de consulta médica 

    Como usuario, deseo enviar una solicitud de consulta 
    al fisioterapeuta que he seleccionado para reservar 
    una cita con él.

Criterio de aceptación #1
    Scenario: El fisioterapeuta tiene habilitado recibir solicitudes de consulta
    Given el usuario se encuentra en la sección "Physiotherapists"
        And selecciona un fisioterapeuta
    When selecciona la opción "Schedule Appointment"
    Then el sistema envía la consulta médica al fisioterapeuta con los campos <Patient> y <Date>. 

Examples: 
    |          Patient            |       Date        |   
    | "Juan Alberto Flores Arias" |     05/07/22      |

Criterio de aceptación #2
    Scenario: El fisioterapeuta tiene habilitado recibir solicitudes de consulta
    Given que el usuario se encuentra en la sección "Physiotherapists" 
        And selecciona un fisioterapeuta 
    When selecciona la opción "Schedule Appointment" 
    Then el sistema envía un mensaje <Message>. 

Examples: 
    |                               Message                              |      
    | "el fisioterapeuta no cuenta con espacio en su agenda actualmente" | 
