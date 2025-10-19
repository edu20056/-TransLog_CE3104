% BNF.pl

% Configuración de codificación e importación
:- encoding(utf8).
:- consult('Logic.pl').
:- consult('BD.pl').

% ---------- INTERFAZ PRINCIPAL ----------

% tranlog_ie/0: Inicia modo traducción inglés → español
tranlog_ie :-
    nl,
    writeln('TranLogIE___________________________________________'),
    writeln('[ English -> Spanish ]'),
    writeln('Type text in english (empty line to end)'),
    nl,
    iniciar_modo_traduccion(ie).

% tranlog_ei/0: Inicia modo traducción español → inglés
tranlog_ei :-
    nl,
    writeln('TranLogEI___________________________________________'),
    writeln('[ Español -> Inglés ]'),
    writeln('Escriba texto en español (línea vacía para terminar)'),
    iniciar_modo_traduccion(ei).

% ---------- MODO DE TRADUCCIÓN ----------

% iniciar_modo_traduccion/1: Controla el ciclo de traducción
% @param Modo: ei (español→inglés) o ie (inglés→español)
iniciar_modo_traduccion(Modo) :-
    nl,
    mostrar_prompt(Modo),
    leer_entrada(Entrada),
    procesar_entrada_traduccion(Entrada, Modo).

% mostrar_prompt/1: Muestra el prompt según el modo
mostrar_prompt(ei) :- writeln('ES >').
mostrar_prompt(ie) :- writeln('EN >').

% leer_entrada/1: Lee entrada del usuario
% @param Entrada: Texto ingresado por el usuario
leer_entrada(Entrada) :-
    read_line_to_codes(user_input, Codigos),
    atom_codes(Entrada, Codigos).

% procesar_entrada_traduccion/2: Procesa la entrada del usuario
% @param Entrada: Texto a procesar
% @param Modo: Dirección de traducción
procesar_entrada_traduccion('', Modo) :-
    ( Modo = ei -> writeln('Gracias por usar TranLogEI')
    ; Modo = ie -> writeln('Thanks for using TranLogIE')
    ),
    nl, halt.

procesar_entrada_traduccion(Entrada, Modo) :-
    tokenizar_entrada(Entrada, Tokens),
    nl,
    mostrar_resultados(Entrada, Tokens, Modo),
    iniciar_modo_traduccion(Modo).

% ---------- MOSTRAR RESULTADOS ----------

% mostrar_resultados/3: Muestra resultados de la traducción
% @param Entrada: Texto original
% @param Tokens: Lista de tokens
% @param Modo: Dirección de traducción
mostrar_resultados(Entrada, Tokens, ei) :-
    format('Entrada: ~w~n', [Entrada]),
    format('Tokens: ~w~n', [Tokens]),
    (   traducir_con_conjugacion(Tokens, ei, Traduccion)
    ->  atomic_list_concat(Traduccion, ' ', Texto),
        format('Análisis: Conjugación aplicada~n'),
        format('Traducción: ~w~n', [Texto])
    ;   analizar_y_traducir(Tokens, ei, Traduccion)
    ->  atomic_list_concat(Traduccion, ' ', Texto),
        format('Análisis: Estructura gramatical reconocida~n'),
        format('Traducción: ~w~n', [Texto])
    ;   traducir_tokens_ei(Tokens, Traduccion),
        atomic_list_concat(Traduccion, ' ', Texto),
        format('Análisis: Traducción palabra por palabra~n'),
        format('Traducción: ~w~n', [Texto])
    ).

mostrar_resultados(Entrada, Tokens, ie) :-
    format('Input: ~w~n', [Entrada]),
    format('Tokens: ~w~n', [Tokens]),
    (   traducir_con_conjugacion(Tokens, ie, Traduccion)
    ->  atomic_list_concat(Traduccion, ' ', Texto),
        format('Analysis: Conjugation applied~n'),
        format('Translation: ~w~n', [Texto])
    ;   analizar_y_traducir(Tokens, ie, Traduccion)
    ->  atomic_list_concat(Traduccion, ' ', Texto),
        format('Analysis: Grammatical structure recognized~n'),
        format('Translation: ~w~n', [Texto])
    ;   traducir_tokens_ie(Tokens, Traduccion),
        atomic_list_concat(Traduccion, ' ', Texto),
        format('Analysis: Word-by-word translation~n'),
        format('Translation: ~w~n', [Texto])
    ).

% ---------- PREDICADOS AUXILIARES ----------

% traducir_tokens_ei/2: Traducción palabra por palabra español→inglés
traducir_tokens_ei([], []).
traducir_tokens_ei([Token|Resto], [Traduccion|RestoTraducido]) :-
    traducir_palabra(Token, ei, Traduccion),
    traducir_tokens_ei(Resto, RestoTraducido).

% traducir_tokens_ie/2: Traducción palabra por palabra inglés→español
traducir_tokens_ie([], []).
traducir_tokens_ie([Token|Resto], [Traduccion|RestoTraducido]) :-
    traducir_palabra(Token, ie, Traduccion),
    traducir_tokens_ie(Resto, RestoTraducido).
