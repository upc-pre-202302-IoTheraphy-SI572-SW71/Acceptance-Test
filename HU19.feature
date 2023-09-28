Feature: Visualización de horario de consultas 

    Como fisioterapeuta, deseo visualizar 
    los días y las horas exactas en las 
    que tengo agendadas consultas médicas 
    para llevar un control adecuado.

Criterio de aceptación #1
    Scenario: Usuario cuenta con citas agendadas
    Given que el usuario cuenta con una sesión iniciada con el rol de fisioterapeuta
    And presenta consultas médicas agendadas
    When abre la sección "Consultas Médicas"
    Then se presenta la lista de consultas agendadas con los siguientes datos:
        <foto_perfil_paciente>, <nombre_del_paciente>,<tipo_de_terapia> y <fecha>

Examples: 
    |   foto_perfil_paciente  | nombre_del_paciente | tipo_de_terapia |        fecha         |  
    | marianoprofilephoto.jpg | "Mariano Velasquez" |    "Obesity"    | "Friday 3 , January" |


Criterio de aceptación #2
    Scenario: Usuario no presenta ninguna cita
    Given que el usuario cuenta con una sesión iniciada con el rol de fisioterapeuta
    And no presenta consultas médicas agendadas
    When abre la sección "Calendario de consultas"
    Then se presenta el mensaje: "Todavía no ha tenido consultas médicas", en pantalla.Feature: Visualización de horario de consultas 

    Como fisioterapeuta, deseo visualizar 
    los días y las horas exactas en las 
    que tengo agendadas consultas médicas 
    para llevar un control adecuado.

Criterio de aceptación #1
    Scenario: Usuario cuenta con citas agendadas
    Given que el usuario cuenta con una sesión iniciada con el rol de fisioterapeuta
    And presenta consultas médicas agendadas
    When abre la sección "Consultas Médicas"
    Then se presenta la lista de consultas agendadas con los siguientes datos:
        <foto_perfil_paciente>, <nombre_del_paciente>,<tipo_de_terapia> y <fecha>

Examples: 
    |   foto_perfil_paciente  | nombre_del_paciente | tipo_de_terapia |        fecha         |  
    | marianoprofilephoto.jpg | "Mariano Velasquez" |    "Obesity"    | "Friday 3 , January" |


Criterio de aceptación #2
    Scenario: Usuario no presenta ninguna cita
    Given que el usuario cuenta con una sesión iniciada con el rol de fisioterapeuta
    And no presenta consultas médicas agendadas
    When abre la sección "Calendario de consultas"
    Then se presenta el mensaje: "Todavía no ha tenido consultas médicas", en pantalla.
