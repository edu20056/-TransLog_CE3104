% Logic.pl
:- encoding(utf8).
% --------- DEFINICIONES Y VALIDACIONES ----------
es_delimitador_oracion('.').
es_delimitador_oracion('!').
es_delimitador_oracion('?').


es_sustantivo(Palabra) :- sustantivo(Palabra, _, _, _, _).
es_sustantivo(Palabra) :- sustantivo(_, Palabra, _, _, _).

es_interjeccion(Palabra) :- interjeccion(Palabra, _).
es_interjeccion(Palabra) :- interjeccion(_, Palabra).

es_verbo(Palabra) :- verbo(_, Palabra, _, _).
es_verbo(Palabra) :- verbo(Palabra, _, _, _).
es_verbo(Palabra) :- verbo(_, _, Conjugaciones, _), member(Palabra, Conjugaciones).
es_verbo(Palabra) :- verbo(_, _, _, Conjugaciones), member(Palabra, Conjugaciones).

es_adjetivo(Palabra) :- adjetivo(Palabra, _, _, _).
es_adjetivo(Palabra) :- adjetivo(_, Palabra, _, _).

es_determinante(Palabra) :- determinante(Palabra, _, _, _, _).
es_determinante(Palabra) :- determinante(_, Palabra, _, _, _).

es_pronombre(Palabra) :- pronombre(Palabra, _, _, _).
es_pronombre(Palabra) :- pronombre(_, Palabra, _, _).

es_preposicion(Palabra) :- preposicion(Palabra, _).
es_preposicion(Palabra) :- preposicion(_, Palabra).

es_adverbio(Palabra) :- adverbio(Palabra, _).
es_adverbio(Palabra) :- adverbio(_, Palabra).

es_conjuncion(Palabra) :- conjuncion(Palabra, _).
es_conjuncion(Palabra) :- conjuncion(_, Palabra).

% -------- TOKENIZACIÓN ---------

% tokenizar_entrada/2: Convierte texto de entrada en lista de tokens
% @param Entrada: Texto original del usuario
% @param Tokens: Lista de tokens resultante
% Proceso: minúsculas -> división por espacios -> separación puntuación -> filtrado
tokenizar_entrada(Entrada, Tokens) :-
    downcase_atom(Entrada, LineaMinusculas),              		% Normaliza a minúsculas
    atomic_list_concat(AtomosPalabras, ' ', LineaMinusculas), 		% Divide por espacios
    maplist(separar_puntuacion, AtomosPalabras, ListasPalabras), 	% Procesa cada palabra
    flatten(ListasPalabras, TokensFiltrados),             		% Aplana lista de listas
    excluir(=(''), TokensFiltrados, Tokens).              		% Elimina tokens vacíos

% excluir/3: Filtra elementos de una lista según un predicado
% @param Predicado: Predicado a evaluar para cada elemento
% @param Lista: Lista original a filtrar
% @param Filtrada: Lista resultante después del filtrado
excluir(_, [], []).
excluir(Predicado, [X|Xs], Filtrada) :-
    (call(Predicado, X) ->
        excluir(Predicado, Xs, Filtrada)
    ;
        Filtrada = [X|FiltradaResto],
        excluir(Predicado, Xs, FiltradaResto)
    ).

% separar_puntuacion/2: Separa signos de puntuación de las palabras
% @param Palabra: Palabra original a procesar
% @param Tokens: Lista de tokens resultante (palabra + puntuación separados)
separar_puntuacion(Palabra, Tokens) :-
    atom_chars(Palabra, Caracteres),                      		% Convierte a lista de caracteres
    separar_caracteres(Caracteres, [], Tokens).           		% Procesa caracteres individualmente

% separar_caracteres/3: Procesa recursivamente caracteres para separar puntuación
% @param Caracteres: Lista de caracteres a procesar
% @param PalabraActual: Acumulador de caracteres de la palabra actual
% @param Tokens: Lista resultante de tokens
% Maneja tres casos: palabra sola, puntuación sola, palabra con puntuación
separar_caracteres([], PalabraActual, [PalabraFinal]) :-
    (PalabraActual = [] -> 
        PalabraFinal = ''                                 		% Caso: no hay palabra acumulada
    ; 
        atom_chars(PalabraFinal, PalabraActual)           		% Convierte caracteres a átomo
    ).

% Caso: caracter actual es puntuación
separar_caracteres([Caracter|Resto], PalabraActual, Tokens) :-
    (es_puntuacion(Caracter) ->
        (PalabraActual = [] ->
            % Puntuación sola: crea token de puntuación
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPuntuacion|TokensRestantes]
        ;
            % Palabra + puntuación: crea ambos tokens
            atom_chars(TokenPalabra, PalabraActual),
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPalabra, TokenPuntuacion|TokensRestantes]
        )
    ;
        % Caracter normal: añade a palabra actual
        append(PalabraActual, [Caracter], NuevaPalabra),
        separar_caracteres(Resto, NuevaPalabra, Tokens)
    ).

% es_puntuacion/1: Define qué caracteres se consideran signos de puntuación
% @param Caracter: Caracter a verificar
es_puntuacion(Caracter) :-
    member(Caracter, [',', '.', ';', ':', '!', '?', '¿', '¡', '(', ')', '[', ']', '{', '}']).

% --------- SEGMENTACIÓN DE ORACIONES -----------

% dividir_por_delimitadores/2: Divide tokens usando delimitadores de oración
% @param Tokens: Lista completa de tokens
% @param Oraciones: Lista de listas, cada sublista es una oración
% Cada oración incluye su delimitador final
dividir_por_delimitadores([], []).
dividir_por_delimitadores(Tokens, [Oracion|OracionesRestantes]) :-
    tomar_oracion_completa(Tokens, Oracion, TokensRestantes),
    dividir_por_delimitadores(TokensRestantes, OracionesRestantes).

% tomar_oracion_completa/3: Extrae una oración completa hasta encontrar delimitador
% @param Tokens: Lista de tokens completa
% @param Oracion: Primera oración encontrada
% @param TokensRestantes: Tokens que quedan después de la oración
% Incluye el delimitador como parte de la oración
tomar_oracion_completa([], [], []).
tomar_oracion_completa([Token|Resto], Oracion, TokensRestantes) :-
    (es_delimitador_oracion(Token) ->
        % Encontró delimitador: termina oración con este token
        Oracion = [Token],
        TokensRestantes = Resto
    ;
        % No es delimitador: continúa construyendo oración
        Oracion = [Token|OracionResto],
        tomar_oracion_completa(Resto, OracionResto, TokensRestantes)
    ).

% --------- TRADUCCIÓN DE ORACIONES ----------

% traducir_lista_oraciones/3: Traduce lista de oraciones individualmente
% @param Oraciones: Lista de oraciones (cada una es lista de tokens)
% @param Modo: Dirección de traducción (ei/ie)
% @param Traducidas: Lista de oraciones traducidas
traducir_lista_oraciones([], _, []).
traducir_lista_oraciones([Oracion|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_oracion_individual(Oracion, Modo, Traducida),
    traducir_lista_oraciones(Resto, Modo, RestoTrad).

% traducir_oracion_individual/3: Traduce una oración usando múltiples estrategias
% @param Oracion: Lista de tokens de la oración
% @param Modo: Dirección de traducción (ei/ie)
% @param Traducida: Lista de tokens traducidos
traducir_oracion_individual(Oracion, Modo, Traducida) :-
    (traducir_con_conjugacion(Oracion, Modo, Traducida)
    ; 
    traduccion_simple(Oracion, Modo, Traducida)
    ).

% unir_oraciones_traducidas/2: Combina oraciones traducidas en texto completo
% @param Oraciones: Lista de oraciones traducidas (cada una es lista de tokens)
% @param Texto: Texto completo unido
% Convierte cada lista de tokens a string y los une con espacios
unir_oraciones_traducidas(Oraciones, Texto) :-
    maplist(atomic_list_concat_space, Oraciones, OracionesStrings),
    atomic_list_concat(OracionesStrings, ' ', Texto).

% atomic_list_concat_space/2: Une lista de átomos/tokens en string con espacios
% @param Lista: Lista de tokens a unir
% @param Texto: Texto resultante
atomic_list_concat_space(Lista, Texto) :-
    atomic_list_concat(Lista, ' ', Texto).

% --------- ANÁLISIS DE SUJETOS ---------- 

% es_sustantivo_sujeto/1: Verifica si sustantivo puede funcionar como sujeto
% @param Sustantivo: Sustantivo a verificar
% Un sustantivo puede ser sujeto si tiene persona gramatical definida
es_sustantivo_sujeto(Sustantivo) :-
    (sustantivo(Sustantivo, _, Persona, _, _) ;
     sustantivo(_, Sustantivo, Persona, _, _)),
    member(Persona, ['primera', 'segunda', 'tercera']).

% persona_numero_sujeto/3: Detecta persona y número gramatical del sujeto
% @param Sujeto: Sujeto a analizar (simple o compuesto)
% @param Persona: Persona gramatical detectada (primera/segunda/tercera)
% @param Numero: Número gramatical detectado (singular/plural)
persona_numero_sujeto(Sujeto, Persona, Numero) :-
    atom(Sujeto),
    (   sustantivo(Sujeto, _, Persona, Numero, _)
    ;   sustantivo(_, Sujeto, Persona, Numero, _)
    ), !.

% Sujetos compuestos: "el gato"
persona_numero_sujeto(SujetoCompuesto, 'tercera', Numero) :-
    atomic_list_concat([Determinante, Sustantivo], ' ', SujetoCompuesto),
    es_determinante(Determinante),
    es_sustantivo(Sustantivo),
    (   sustantivo(Sustantivo, _, _, Numero, _)
    ;   sustantivo(_, Sustantivo, _, Numero, _)
    ), !.

% es_sujeto_valido/1: Determina si un token puede funcionar como sujeto
% @param Sujeto: Token o estructura a verificar
% Sujetos válidos: sustantivos con persona o estructuras determinante+sustantivo
es_sujeto_valido(Palabra) :-
    atom(Palabra),
    (   sustantivo(Palabra, _, Persona, _, _)
    ;   sustantivo(_, Palabra, Persona, _, _)
    ),
    member(Persona, ['primera', 'segunda', 'tercera']), !.

es_sujeto_valido(SujetoCompuesto) :-
    atomic_list_concat([Determinante, Sustantivo], ' ', SujetoCompuesto),
    es_determinante(Determinante),
    es_sustantivo_sujeto(Sustantivo), !.

% --------- TRADUCCIÓN DE SUJETOS ---------

% traducir_sujeto/3: Traduce un sujeto según el modo de traducción
% @param Sujeto: Sujeto original a traducir
% @param Modo: Dirección de traducción (ei/ie)
% @param Traducido: Sujeto traducido

% Traducción de sujetos simples 
traducir_sujeto(Sujeto, ei, Ingles) :-
    atom(Sujeto),
    sustantivo(Sujeto, Ingles, _, _, _), !.

traducir_sujeto(Sujeto, ie, Espanol) :-
    atom(Sujeto),
    sustantivo(Espanol, Sujeto, _, _, _), !.

% Traducción de sujetos compuestos
traducir_sujeto(SujetoCompuesto, ei, InglesCompuesto) :-
    atomic_list_concat([DetEsp, SustEsp], ' ', SujetoCompuesto),
    determinante(DetEsp, DetIng, Numero, _, _),
    sustantivo(SustEsp, SustIng, _, Numero, _),
    atomic_list_concat([DetIng, SustIng], ' ', InglesCompuesto), !.

traducir_sujeto(SujetoCompuesto, ie, EspanolCompuesto) :-
    atomic_list_concat([DetIng, SustIng], ' ', SujetoCompuesto),
    determinante(DetEsp, DetIng, Numero, _, _),
    sustantivo(SustEsp, SustIng, _, Numero, _),
    atomic_list_concat([DetEsp, SustEsp], ' ', EspanolCompuesto), !.

traducir_sujeto(Sujeto, _, Sujeto).

% --------- CONJUGACIÓN VERBAL ---------

% indice_conjugacion/3: Mapea persona y número a índice de conjugación
indice_conjugacion('primera', 'singular', 1).
indice_conjugacion('segunda', 'singular', 2).
indice_conjugacion('tercera', 'singular', 3).
indice_conjugacion('primera', 'plural', 4).
indice_conjugacion('segunda', 'plural', 5).
indice_conjugacion('tercera', 'plural', 6).

% conjugar_es_en/4: Conjuga verbo español a inglés según persona y número
% @param VerboEsp: Verbo en español (infinitivo o conjugado)
% @param Persona: Persona gramatical del sujeto
% @param Numero: Número gramatical del sujeto
% @param VerboIng: Verbo conjugado en inglés
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(_, InfinitivoIng, ConjEsp, ConjIng),
    (member(VerboEsp, ConjEsp) ; VerboEsp = InfinitivoIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng).

% conjugar_en_es/4: Conjuga verbo inglés a español según persona y número
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(InfinitivoEsp, _, ConjEsp, ConjIng),
    (member(VerboIng, ConjIng) ; VerboIng = InfinitivoEsp),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp).

% ---------- TRADUCCIÓN CON CONJUGACIÓN ----------

% traducir_con_conjugacion/3: Traducción inteligente con análisis sintáctico
% @param Tokens: Lista de tokens de la oración
% @param Modo: Dirección de traducción (ei/ie)
% @param Traduccion: Lista de tokens traducidos
% Proceso: identifica sujeto-verbo -> analiza persona/número -> conjuga -> traduce resto
traducir_con_conjugacion(Tokens, Modo, Traduccion) :-
    analizar_sujeto_verbo(Tokens, Sujeto, Verbo, Resto),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    traducir_sujeto(Sujeto, Modo, SujetoTraducido),
    traducir_verbo_conjugado(Verbo, Persona, Numero, Modo, VerboTraducido),
    traduccion_simple(Resto, Modo, RestoTraducido),
    append([SujetoTraducido, VerboTraducido], RestoTraducido, Traduccion).

% analizar_sujeto_verbo/4: Identifica estructuras sujeto-verbo en tokens
% @param Tokens: Lista completa de tokens
% @param Sujeto: Sujeto identificado
% @param Verbo: Verbo identificado
% @param Resto: Tokens restantes después del verbo

% Patrón 1: [Sujeto, Verbo, ...] - sujetos simples
analizar_sujeto_verbo([Sujeto, Verbo|Resto], Sujeto, Verbo, Resto) :-
    es_sujeto_valido(Sujeto),
    es_verbo(Verbo).

% Patrón 2: [Determinante, Sustantivo, Verbo, ...] - sujetos compuestos
analizar_sujeto_verbo([Det, Sustantivo, Verbo|Resto], Sujeto, Verbo, Resto) :-
    es_determinante(Det),
    es_sustantivo(Sustantivo),
    es_verbo(Verbo),
    atomic_list_concat([Det, Sustantivo], ' ', Sujeto),
    es_sustantivo_sujeto(Sustantivo).

% traducir_verbo_conjugado/5: Traduce y conjuga verbos según modo
% @param Verbo: Verbo original a traducir
% @param Persona: Persona gramatical del sujeto
% @param Numero: Número gramatical del sujeto
% @param Modo: Dirección de traducción (ei/ie)
% @param Traduccion: Verbo traducido y conjugado
traducir_verbo_conjugado(Verbo, Persona, Numero, ei, Traduccion) :-
    conjugar_es_en(Verbo, Persona, Numero, Traduccion), !.

traducir_verbo_conjugado(Verbo, Persona, Numero, ie, Traduccion) :-
    conjugar_en_es(Verbo, Persona, Numero, Traduccion), !.

traducir_verbo_conjugado(Verbo, _, _, Modo, Traduccion) :-
    traducir_palabra(Verbo, Modo, Traduccion).

% ---------- TRADUCCIÓN SIMPLE ----------

% traduccion_simple/3: Traducción palabra por palabra
% @param Tokens: Lista de tokens a traducir
% @param Modo: Dirección de traducción (ei/ie)
% @param Traduccion: Lista de tokens traducidos
% Traduce cada token individualmente sin análisis gramatical
traduccion_simple([], _, []).
traduccion_simple([Token|Resto], Modo, [Traduccion|RestoTraducido]) :-
    traducir_palabra(Token, Modo, Traduccion),
    traduccion_simple(Resto, Modo, RestoTraducido).

% traducir_palabra/3: Busca traducción en base de datos por categorías
% @param Palabra: Palabra original a traducir
% @param Modo: Dirección de traducción (ei/ie)
% @param Traduccion: Palabra traducida
traducir_palabra(Palabra, ei, Ingles) :-
    interjeccion(Palabra, Ingles), !.
traducir_palabra(Palabra, ei, Ingles) :-
    sustantivo(Palabra, Ingles, _, _, _), !.
traducir_palabra(Palabra, ei, Ingles) :-
    verbo(Palabra, InfinitivoIng, _, _),
    Ingles = InfinitivoIng, !.
traducir_palabra(Palabra, ei, Ingles) :-
    verbo(_, InfinitivoIng, ConjEsp, _),
    member(Palabra, ConjEsp),
    Ingles = InfinitivoIng, !.
traducir_palabra(Palabra, ei, Ingles) :-
    adjetivo(Palabra, Ingles, _, _), !.
traducir_palabra(Palabra, ei, Ingles) :-
    determinante(Palabra, Ingles, _, _, _), !.
traducir_palabra(Palabra, ei, Ingles) :-
    pronombre(Palabra, Ingles, _, _), !.
traducir_palabra(Palabra, ei, Ingles) :-
    preposicion(Palabra, Ingles), !.
traducir_palabra(Palabra, ei, Ingles) :-
    adverbio(Palabra, Ingles), !.
traducir_palabra(Palabra, ei, Ingles) :-
    conjuncion(Palabra, Ingles), !.

traducir_palabra(Palabra, ie, Espanol) :-
    interjeccion(Espanol, Palabra), !.
traducir_palabra(Palabra, ie, Espanol) :-
    sustantivo(Espanol, Palabra, _, _, _), !.
traducir_palabra(Palabra, ie, Espanol) :-
    verbo(InfinitivoEsp, Palabra, _, _),
    Espanol = InfinitivoEsp, !.
traducir_palabra(Palabra, ie, Espanol) :-
    verbo(InfinitivoEsp, _, _, ConjIng),
    member(Palabra, ConjIng),
    Espanol = InfinitivoEsp, !.
traducir_palabra(Palabra, ie, Espanol) :-
    adjetivo(Espanol, Palabra, _, _), !.
traducir_palabra(Palabra, ie, Espanol) :-
    determinante(Espanol, Palabra, _, _, _), !.
traducir_palabra(Palabra, ie, Espanol) :-
    pronombre(Espanol, Palabra, _, _), !.
traducir_palabra(Palabra, ie, Espanol) :-
    preposicion(Espanol, Palabra), !.
traducir_palabra(Palabra, ie, Espanol) :-
    adverbio(Espanol, Palabra), !.
traducir_palabra(Palabra, ie, Espanol) :-
    conjuncion(Espanol, Palabra), !.

traducir_palabra(Palabra, _, Palabra).




% ============================================================
% DETECCIÓN DE FRASES IDIOMÁTICAS - CON DEBUG
% ============================================================

% ------------------------------------------------------------
% PREDICADOS PARA FRASES IDIOMÁTICAS
% ------------------------------------------------------------

% Español -> Inglés
detectar_frase_idiomatica(Tokens, ei, Traduccion) :-
    writeln('=== BUSCANDO FRASE IDIOMÁTICA ES->EN ==='),
    writeln('Tokens recibidos:'), writeln(Tokens),
    
    % REMOVER DELIMITADORES antes de buscar (usando tus definiciones)
    remover_delimitadores(Tokens, TokensLimpios),
    writeln('Tokens limpios:'), writeln(TokensLimpios),
    
    atomic_list_concat(TokensLimpios, ' ', FraseCompleta),
    downcase_atom(FraseCompleta, FraseLower),
    writeln('Frase a buscar:'), writeln(FraseLower),
    
    (frase_idiomatica(FraseLower, Ingles) -> 
        writeln('Encontrado en frase_idiomatica:'), writeln(Ingles)
    ; 
        (frase_idiomatica_verbo(FraseLower, Ingles) ->
            writeln('Encontrado en frase_idiomatica_verbo:'), writeln(Ingles)
        ;
            writeln('NO ENCONTRADO'), fail
        )
    ),
    
    atom_to_tokens(Ingles, TraduccionLimpia),
    writeln('Traduccion limpia:'), writeln(TraduccionLimpia),
    
    % Mantener los delimitadores originales en la traducción
    agregar_delimitadores(TraduccionLimpia, Tokens, Traduccion),
    writeln('Traduccion final con delimitadores:'), writeln(Traduccion),
    !.

% Inglés -> Español  
detectar_frase_idiomatica(Tokens, ie, Traduccion) :-
    writeln('=== BUSCANDO FRASE IDIOMÁTICA EN->ES ==='),
    writeln('Tokens recibidos:'), writeln(Tokens),
    
    % REMOVER DELIMITADORES antes de buscar (usando tus definiciones)
    remover_delimitadores(Tokens, TokensLimpios),
    writeln('Tokens limpios:'), writeln(TokensLimpios),
    
    atomic_list_concat(TokensLimpios, ' ', FraseCompleta),
    downcase_atom(FraseCompleta, FraseLower),
    writeln('Frase a buscar:'), writeln(FraseLower),
    
    (frase_idiomatica(Espanol, FraseLower) -> 
        writeln('Encontrado en frase_idiomatica:'), writeln(Espanol)
    ; 
        (frase_idiomatica_verbo(Espanol, FraseLower) ->
            writeln('Encontrado en frase_idiomatica_verbo:'), writeln(Espanol)
        ;
            writeln('NO ENCONTRADO'), fail
        )
    ),
    
    atom_to_tokens(Espanol, TraduccionLimpia),
    writeln('Traduccion limpia:'), writeln(TraduccionLimpia),
    
    % Mantener los delimitadores originales en la traducción
    agregar_delimitadores(TraduccionLimpia, Tokens, Traduccion),
    writeln('Traduccion final con delimitadores:'), writeln(Traduccion),
    !.

% ------------------------------------------------------------
% AUXILIARES PARA MANEJO DE DELIMITADORES (usando tus definiciones)
% ------------------------------------------------------------

% Remover delimitadores finales
remover_delimitadores(Tokens, TokensLimpios) :-
    (append(TokensLimpios, [Delim], Tokens), es_delimitador_oracion(Delim) ->
        true
    ;
        TokensLimpios = Tokens
    ).

% Agregar delimitadores a la traducción
agregar_delimitadores(TraduccionLimpia, TokensOriginal, Traduccion) :-
    (append(_, [Delim], TokensOriginal), es_delimitador_oracion(Delim) ->
        append(TraduccionLimpia, [Delim], Traduccion)
    ;
        Traduccion = TraduccionLimpia
    ).

% ------------------------------------------------------------
% SOBREESCRIBIR traducir_oracion_individual PARA PRIORIDAD
% ------------------------------------------------------------

:- abolish(traducir_oracion_individual/3).
traducir_oracion_individual(Tokens, Modo, Traduccion) :-
    writeln('=== traducir_oracion_individual INICIADO ==='),
    
    % PRIMERO buscar frases idiomáticas
    (detectar_frase_idiomatica(Tokens, Modo, Traduccion) ->
        writeln('*** USANDO FRASE IDIOMÁTICA ***')
    ;
        writeln('--- No es frase idiomática, usando traducción normal ---'),
        % Si no encuentra, usar sistema normal
        (traducir_con_conjugacion(Tokens, Modo, Traduccion)
        ; 
        traduccion_simple(Tokens, Modo, Traduccion))
    ).

% ------------------------------------------------------------
% AUXILIAR
% ------------------------------------------------------------

atom_to_tokens(Atom, Tokens) :-
    atomic_list_concat(Tokens, ' ', Atom).