% BNF.pl

% Configuración de codificación e importación
:- encoding(utf8).
:- consult('Logic.pl').
:- consult('BD.pl').

% ---------- INTERFAZ PRINCIPAL ----------

% tranlog_ie/0: Inicia modo traducción inglés -> español
tranlog_ie :-
    nl,
    writeln('TranLogIE___________________________________________'),
    writeln('[ English -> Spanish ]'),
    writeln('Type text in english (empty line to end)'),
    iniciar_modo_traduccion(ie).

% tranlog_ei/0: Inicia modo traducción español -> inglés  
tranlog_ei :-
    nl,
    writeln('TranLogEI___________________________________________'),
    writeln('[ Español -> Inglés ]'),
    writeln('Escriba texto en español (línea vacía para terminar)'),
    iniciar_modo_traduccion(ei).

% ---------- MODO DE TRADUCCIÓN ----------

% iniciar_modo_traduccion/1: Ciclo de traducción
% @param Modo: ei (español -> inglés) / ie (inglés -> español)
iniciar_modo_traduccion(Modo) :-
    nl,
    mostrar_prompt(Modo),
    leer_entrada(Entrada),
    procesar_entrada_traduccion(Entrada, Modo).

mostrar_prompt(ei) :- writeln('ES > ').
mostrar_prompt(ie) :- writeln('EN > ').

% leer_entrada/1: Lee entrada del usuario
% @param Entrada: Texto ingresado por el usuario
% Convierte los códigos de caracteres a un átomo Prolog
% -Propuesto por AI, para flexibilidad en el manejo de Inputs-
leer_entrada(Entrada) :-
    read_line_to_codes(user_input, Codigos),
    atom_codes(Entrada, Codigos).

% procesar_entrada_traduccion/2: Procesa la entrada del usuario
% @param Entrada: Texto a procesar
% @param Modo: Dirección de traducción

% Salir en caso de linea vacia. 
procesar_entrada_traduccion('', Modo) :-
    ( Modo = ei -> writeln('Gracias por usar TranLogEI')
    ; Modo = ie -> writeln('Thanks for using TranLogIE')
    ),
    nl, halt.

procesar_entrada_traduccion(Entrada, Modo) :-
	tokenizar_entrada(Entrada, Tokens), % Entrada -> Tokens
    nl,
    resultados_traduccion(Entrada, Tokens, Modo),  % Muestra resultados
    iniciar_modo_traduccion(Modo).  % Vuelve al inicio

% ---------- OUTPUT ----------

% resultados_traduccion/3: Divide en oraciones y traduce cada una
% @param Entrada: Texto original
% @param Tokens: Lista de tokens completa  
% @param Modo: Dirección de traducción
resultados_traduccion(_, Tokens, Modo) :-
    % Dividir lista de tokens en oraciones individuales
    % de acuerdo con delimitadores
    dividir_por_delimitadores(Tokens, Oraciones),
    
    % Traducido de cada oración individualmente
    traducir_lista_oraciones(Oraciones, Modo, OracionesTraducidas),

    % Union de oraciones traducidas. 
    traduccion_completa(OracionesTraducidas, Modo).

% traduccion_completa/2: Muestra la traducción completa unida
% @param OracionesTraducidas: Lista de oraciones traducidas
% @param Modo: Dirección de traducción  
% Une todas las traducciones en un solo texto final
traduccion_completa(OracionesTraducidas, Modo) :-
    unir_oraciones_traducidas(OracionesTraducidas, TextoCompleto),
    (Modo = ei ->
	writeln('EN >'),
        format('~w~n', [TextoCompleto])
    ;
    	writeln('ES >'),
        format('~w~n', [TextoCompleto])
    ).
