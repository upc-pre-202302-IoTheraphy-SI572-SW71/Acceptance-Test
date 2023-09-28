Feature: Publicación de videos de ejercicios

    Como fisioterapeuta, deseo subir videos de rutinas 
    de ejercicios para ayudar a mis pacientes a comprender
     como se deben realizar los ejercicios. 

Criterio de aceptación #1
    Scenario: Usuario sube correctamente el video
    Given que el usuario se encuentra en "Treatments"
    When selecciona "Add Session"
        And sube su video en el campo <Video>
        And este es compatible
    Then se presenta un mensaje de confirmación <Message>

Examples: 
    |                       Video                        |                  Message               |   
    |   "https://www.youtube.com/watch?v=W5QR1e6M28Q"    | "Se ha subido corrrectamente el video" |

Criterio de aceptación #2
    Scenario: Usuario sube incorrectamente el video
    Given que el usuario se encuentra en "Treatments"
    When selecciona "Add Session"
        And sube su video en el campo <Video>
        And este no es encontrado
    Then se presenta un mensaje de error <Message>

Examples: 
    |                       Video                        |                 Message               |   
    |   "https://www.youtcom/watch?v=W5QR1e6M28Qfdrl"    | "No se ha podido encontrar el video." |
