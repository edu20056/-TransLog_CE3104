% Logic.pl - REORGANIZADO POR FLUJO DE DATOS

% Configuración de codificación para caracteres UTF-8
:- encoding(utf8).

% -------- TOKENIZACIÓN ---------

% tokenizar_entrada/2: Convierte texto en lista de tokens
% @param Entrada: Texto original como átomo
% @param Tokens: Lista de tokens resultante
% 
% PROCESO:
% 1. Convertir a minúsculas
% 2. Dividir por espacios
% 3. Separar puntuación de palabras
% 4. Filtrar tokens vacíos
tokenizar_entrada(Entrada, Tokens) :-
    downcase_atom(Entrada, LineaMinusculas),
    atomic_list_concat(AtomosPalabras, ' ', LineaMinusculas),
    maplist(separar_puntuacion, AtomosPalabras, ListasPalabras),
    flatten(ListasPalabras, TokensFiltrados),
    excluir(=(''), TokensFiltrados, Tokens).

% excluir/3: Filtra elementos de una lista según predicado
% @param Predicado: Condición para excluir elementos
% @param Lista: Lista original a filtrar
% @param Filtrada: Lista resultante después del filtro
excluir(_, [], []).  % Caso base: lista vacía
excluir(Predicado, [X|Xs], Filtrada) :-
    (call(Predicado, X) ->
        excluir(Predicado, Xs, Filtrada)
    ;
        Filtrada = [X|FiltradaResto],
        excluir(Predicado, Xs, FiltradaResto)
    ).

% separar_puntuacion/2: Separa signos de puntuación de las palabras
% @param Palabra: Palabra potencialmente con puntuación
% @param Tokens: Lista de tokens separados
separar_puntuacion(Palabra, Tokens) :-
    atom_chars(Palabra, Caracteres),
    separar_caracteres(Caracteres, [], Tokens).

% separar_caracteres/3: Procesa recursivamente lista de caracteres
% @param Caracteres: Lista de caracteres a procesar
% @param PalabraActual: Acumulador de caracteres de la palabra actual
% @param Tokens: Lista de tokens resultante
separar_caracteres([], PalabraActual, [PalabraFinal]) :-
    (PalabraActual = [] -> 
        PalabraFinal = ''
    ; 
        atom_chars(PalabraFinal, PalabraActual)
    ).

separar_caracteres([Caracter|Resto], PalabraActual, Tokens) :-
    (es_puntuacion(Caracter) ->  % Si el carácter es signo de puntuación
        (PalabraActual = [] ->   % Caso: signo sin palabra anterior
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPuntuacion|TokensRestantes]
        ;
            % Caso: palabra + signo de puntuación
            atom_chars(TokenPalabra, PalabraActual),
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPalabra, TokenPuntuacion|TokensRestantes]
        )
    ;
        % Carácter normal, agregar a palabra actual
        append(PalabraActual, [Caracter], NuevaPalabra),
        separar_caracteres(Resto, NuevaPalabra, Tokens)
    ).

% es_puntuacion/1: Verifica si un carácter es signo de puntuación
% @param Caracter: Carácter a verificar
es_puntuacion(Caracter) :-
    member(Caracter, [',', '.', ';', ':', '!', '?', '¿', '¡', '(', ')', '[', ']', '{', '}']).

% --------- SEGMENTACIÓN DE ORACIONES -----------

% dividir_por_delimitadores/2: Divide lista de tokens en lista de oraciones
% @param Tokens: Lista completa de tokens
% @param Oraciones: Lista de listas, cada una es una oración
dividir_por_delimitadores([], []).
dividir_por_delimitadores(Tokens, [Oracion|OracionesRestantes]) :-
    tomar_oracion_completa(Tokens, Oracion, TokensRestantes),
    dividir_por_delimitadores(TokensRestantes, OracionesRestantes).

% tomar_oracion_completa/3: Extrae una oración completa de la lista de tokens
% @param Tokens: Lista de tokens de entrada
% @param Oracion: Oración extraída
% @param TokensRestantes: Tokens restantes después de la oración
tomar_oracion_completa([], [], []).  % Caso base: no hay tokens
tomar_oracion_completa([Token|Resto], Oracion, TokensRestantes) :-
    (es_delimitador_oracion(Token) ->  % Si token es delimitador de oración
        Oracion = [Token],              % Oración es solo el delimitador
        TokensRestantes = Resto         % Resto de tokens después
    ;
        Oracion = [Token|OracionResto],  % Agregar token a oración
        tomar_oracion_completa(Resto, OracionResto, TokensRestantes)  % Continuar
    ).


% --------- DEFINICIONES GRAMATICALES ----------

% es_delimitador_oracion/1: Identifica tokens que delimitan oraciones
es_delimitador_oracion('.').
es_delimitador_oracion(Token) :- es_conjuncion(Token).
es_delimitador_oracion(Token) :- es_signo(Token).

% Predicados de categorías gramaticales (consultan BD.pl)
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
es_signo(Palabra) :- signo(Palabra, _).
es_signo(Palabra) :- signo(_, Palabra).

% --------- SINTAGMA PREPOSICIONAL (SP) ---------

% sp/3: Analiza sintagma preposicional (preposición + sintagma nominal)
% @param Tokens: Lista de tokens a analizar
% @param sp(Prep, SN): Estructura del sintagma preposicional
% @param Resto: Tokens restantes después del análisis
sp(Tokens, sp(Prep, SN), Resto) :-
    Tokens = [Prep|RestoTokens],
    es_preposicion(Prep),
    sn(RestoTokens, SN, Resto), !.

% --------- SINTAGMA NOMINAL (SN) ---------

% sn/3: Analiza sintagma nominal con múltiples estrategias (en orden de preferencia)
sn(Tokens, SN, Resto) :- sn_completo(Tokens, SN, Resto), !.
sn(Tokens, SN, Resto) :- sn_con_adjetivos(Tokens, SN, Resto), !.
sn(Tokens, SN, Resto) :- sn_con_det(Tokens, SN, Resto), !.
sn(Tokens, SN, Resto) :- sn_simple(Tokens, SN, Resto), !.

% SN Completo: Det + Adjetivos + Sustantivo + SP
sn_completo(Tokens, sn(Det, Adjs, Nucleo, SPs), Resto) :-
    Tokens = [Det|T1],
    es_determinante(Det),
    tomar_adjetivos(T1, Adjs, T2),
    Adjs \= [],
    T2 = [Nucleo|T3],
    es_sustantivo_valido(Nucleo),
    tomar_sps(T3, SPs, Resto), !.

% SN con Adjetivos: Det + Adjetivos + Sustantivo
sn_con_adjetivos(Tokens, sn(Det, Adjs, Nucleo), Resto) :-
    Tokens = [Det|T1],
    es_determinante(Det),
    tomar_adjetivos(T1, Adjs, T2),
    Adjs \= [],
    T2 = [Nucleo|Resto],
    es_sustantivo_valido(Nucleo), !.

% SN con Determinante: Det + Sustantivo
sn_con_det([Det, Sust|Resto], sn(Det, Sust), Resto) :-
    es_determinante(Det),
    es_sustantivo_valido(Sust), !.

% SN Simple: Solo sustantivo (o pronombre)
sn_simple([Token|Resto], sn(Token), Resto) :-
    (es_sustantivo_valido(Token) ; es_pronombre(Token)), !.

tomar_adjetivos(Tokens, [Adj|Adjs], Resto) :-
    Tokens = [Adj|T1],
    es_adjetivo(Adj),
    tomar_adjetivos(T1, Adjs, Resto), !.
tomar_adjetivos(Tokens, [], Tokens).

tomar_sps(Tokens, [SP|SPs], Resto) :-
    sp(Tokens, SP, T1),
    tomar_sps(T1, SPs, Resto), !.
tomar_sps(Tokens, [], Tokens).

% --------- SINTAGMA VERBAL (SV) ---------

% sv/5: Analiza sintagma verbal con múltiples estrategias
% @param Tokens: Tokens a analizar
% @param Sujeto: Sujeto para concordancia
% @param Modo: Modo de traducción para conjugación
% @param SV: Estructura del sintagma verbal
% @param Resto: Tokens restantes
sv(Tokens, Sujeto, Modo, SV, Resto) :- sv_con_cd_ci(Tokens, Sujeto, Modo, SV, Resto), !.
sv(Tokens, Sujeto, Modo, SV, Resto) :- sv_con_adverbio(Tokens, Sujeto, Modo, SV, Resto), !.
sv(Tokens, Sujeto, Modo, SV, Resto) :- sv_con_adjetivo(Tokens, Sujeto, Modo, SV, Resto), !.
sv(Tokens, Sujeto, Modo, SV, Resto) :- sv_simple(Tokens, Sujeto, Modo, SV, Resto), !.

sv_con_cd_ci([Verbo|RestoTokens], Sujeto, Modo, sv(VerboConj, CD, CI), RestoFinal) :-
    es_verbo(Verbo),
    sn(RestoTokens, CD, T1),
    sp(T1, CI, RestoFinal),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% SV con Adverbio: Verbo + Adverbio
sv_con_adverbio([Verbo, Adv|Resto], Sujeto, Modo, sv(VerboConj, adv(Adv)), Resto) :-
    es_verbo(Verbo),
    es_adverbio(Adv),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% SV con Adjetivo Predicativo
sv_con_adjetivo([Verbo, Adj|Resto], Sujeto, Modo, sv(VerboConj, pred(AdjConc)), Resto) :-
    es_verbo(Verbo),
    es_adjetivo(Adj),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj),
    obtener_genero_numero_sujeto(Sujeto, Genero, NumeroAdj),
    traducir_adjetivo_concordancia(Adj, Genero, NumeroAdj, AdjConc), !.

% SV Simple: Solo verbo
sv_simple([Verbo|Resto], Sujeto, Modo, sv(VerboConj), Resto) :-
    es_verbo(Verbo),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% --------- ANÁLISIS DE ORACIÓN ---------

% analizar_oracion/5: Analiza estructura completa de oración (Sujeto + Predicado)
% @param Tokens: Tokens de la oración
% @param Modo: Modo de traducción
% @param Sujeto: Sujeto extraído
% @param SV: Sintagma verbal extraído
% @param Resto: Tokens restantes no analizados
analizar_oracion(Tokens, Modo, Sujeto, SV, Resto) :-
    sn(Tokens, Sujeto, TokensDespuesSN),
    sv(TokensDespuesSN, Sujeto, Modo, SV, Resto).


% --------- CONJUGACIÓN VERBAL ---------

% Mapeo de persona y número a índices de conjugación
indice_conjugacion('primera', 'singular', 1).
indice_conjugacion('segunda', 'singular', 2).
indice_conjugacion('tercera', 'singular', 3).
indice_conjugacion('primera', 'plural', 4).
indice_conjugacion('segunda', 'plural', 5).
indice_conjugacion('tercera', 'plural', 6).

% Conjugación Español --> Inglés
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(VerboEsp, _, _, ConjIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng), !.
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(_, _, ConjEsp, ConjIng),
    member(VerboEsp, ConjEsp),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng), !.
conjugar_es_en(VerboEsp, _, _, VerboEsp). % Fallback: devolver verbo original

% Conjugación Inglés --> Español
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(_, VerboIng, ConjEsp, _),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp), !.
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(_, _, ConjEsp, ConjIng),
    member(VerboIng, ConjIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp), !.
conjugar_en_es(VerboIng, _, _, VerboIng). % Fallback

% Función principal que considera el modo de traducción
conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConjugado) :-
    (Modo = ei -> 
        conjugar_es_en(Verbo, Persona, Numero, VerboConjugado)
    ; Modo = ie -> 
        conjugar_en_es(Verbo, Persona, Numero, VerboConjugado)
    ; 
        VerboConjugado = Verbo
    ).

% Detección de idioma del verbo
es_verbo_espanol(Verbo) :- verbo(Verbo, _, _, _), !.
es_verbo_espanol(Verbo) :- verbo(_, _, ConjEsp, _), member(Verbo, ConjEsp), !.
es_verbo_ingles(Verbo) :- verbo(_, Verbo, _, _), !.
es_verbo_ingles(Verbo) :- verbo(_, _, _, ConjIng), member(Verbo, ConjIng), !.

% --------- DETECCIÓN DE GÉNERO Y NÚMERO ---------

% obtener_genero_numero_sujeto/3: Obtiene género y número del sujeto
% Maneja diferentes estructuras de sintagma nominal
obtener_genero_numero_sujeto(sn(Nucleo), Genero, Numero) :-
    !, obtener_genero_numero_sustantivo(Nucleo, Genero, Numero).
obtener_genero_numero_sujeto(sn(_, Nucleo), Genero, Numero) :-
    !, obtener_genero_numero_sustantivo(Nucleo, Genero, Numero).
obtener_genero_numero_sujeto(sn(_, _, Nucleo), Genero, Numero) :-
    !, obtener_genero_numero_sustantivo(Nucleo, Genero, Numero).
obtener_genero_numero_sujeto(sn(_, _, Nucleo, _), Genero, Numero) :-
    !, obtener_genero_numero_sustantivo(Nucleo, Genero, Numero).
obtener_genero_numero_sujeto(Sustantivo, Genero, Numero) :-
    obtener_genero_numero_sustantivo(Sustantivo, Genero, Numero).

% obtener_genero_numero_sustantivo/3: Obtiene género y número de un sustantivo
obtener_genero_numero_sustantivo(Sustantivo, Genero, Numero) :-
    atom(Sustantivo),
    (sustantivo(Sustantivo, _, _, Numero, Genero) ; sustantivo(_, Sustantivo, _, Numero, Genero)), !.
obtener_genero_numero_sustantivo(SujetoCompuesto, Genero, Numero) :-
    atomic_list_concat([_, Sustantivo], ' ', SujetoCompuesto),  % Ej: "el gato"
    obtener_genero_numero_sustantivo(Sustantivo, Genero, Numero), !.
obtener_genero_numero_sustantivo(_, masculino, singular).  % Valor por defecto

% Concordancia de adjetivos: aplica género y número al adjetivo traducido
traducir_adjetivo_concordancia(AdjIngles, Genero, Numero, AdjEspanol) :-
    adjetivo(AdjEspanol, AdjIngles, Genero, Numero), !.  % Buscar con concordancia
traducir_adjetivo_concordancia(AdjIngles, _, _, AdjEspanol) :-
    adjetivo(AdjEspanol, AdjIngles, _, _), !.  % Buscar sin concordancia

% --------- DETECCIÓN DE PERSONA Y NÚMERO ---------

% persona_numero_sujeto/3: Obtiene persona y número gramatical del sujeto
persona_numero_sujeto(sn(Nucleo), Persona, Numero) :-
    !, persona_numero_sustantivo(Nucleo, Persona, Numero).
persona_numero_sujeto(sn(_, Nucleo), Persona, Numero) :-
    !, persona_numero_sustantivo(Nucleo, Persona, Numero).
persona_numero_sujeto(sn(_, _, Nucleo), Persona, Numero) :-
    !, persona_numero_sustantivo(Nucleo, Persona, Numero).
persona_numero_sujeto(sn(_, _, Nucleo, _), Persona, Numero) :-
    !, persona_numero_sustantivo(Nucleo, Persona, Numero).
persona_numero_sujeto(Pronombre, Persona, Numero) :-
    es_pronombre(Pronombre),
    pronombre(_, Pronombre, Persona, Numero), !.
persona_numero_sujeto(Sujeto, Persona, Numero) :-
    persona_numero_sustantivo(Sujeto, Persona, Numero).

% persona_numero_sustantivo/3: Obtiene persona y número de sustantivos/pronombres
persona_numero_sustantivo(Sujeto, Persona, Numero) :-
    atom(Sujeto),
    (sustantivo(Sujeto, _, Persona, Numero, _) ; sustantivo(_, Sujeto, Persona, Numero, _)), !.

persona_numero_sustantivo(SujetoCompuesto, 'tercera', Numero) :-
    atomic_list_concat([_, Sustantivo], ' ', SujetoCompuesto),
    (sustantivo(Sustantivo, _, _, Numero, _) ; sustantivo(_, Sustantivo, _, Numero, _)), !.

persona_numero_sustantivo(_, 'primera', 'singular'). % Valor por defecto

% Validación de sustantivos: verifica que sea sustantivo válido
es_sustantivo_valido(Token) :-
    (sustantivo(_, Token, _, _, _) ; sustantivo(Token, _, _, _, _)),
    \+ es_determinante(Token),
    \+ es_preposicion(Token),
    \+ es_adverbio(Token).

% --------- TRADUCCIÓN DE ORACIONES ---------

% traducir_lista_oraciones/3: Traduce lista de oraciones
% @param Oraciones: Lista de oraciones a traducir
% @param Modo: Modo de traducción
% @param Traducida: Lista de oraciones traducidas
traducir_lista_oraciones([], _, []).
traducir_lista_oraciones([Oracion|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_oracion_individual(Oracion, Modo, Traducida),
    traducir_lista_oraciones(Resto, Modo, RestoTrad).

% Estrategias de traducción (en orden de preferencia)
traducir_oracion_individual(Oracion, Modo, Traducida) :-
    (traducir_por_sintagmas(Oracion, Modo, Traducida)    % Análisis completo
     ;
     traducir_solo_sintagma(Oracion, Modo, Traducida)    % Solo SN
     ;
     traduccion_simple(Oracion, Modo, Traducida)         % Simple (fallback)
    ).

% 1. Traducción por análisis sintáctico completo
traducir_por_sintagmas(Tokens, Modo, Traducida) :-
    analizar_oracion(Tokens, Modo, Sujeto, SV, Resto),           % Análisis completo
    traducir_sn_estructura(Sujeto, Modo, SujetoTraducido),      % Traducir sujeto
    traducir_sv_estructura(SV, Modo, SVTraducido),              % Traducir predicado
    traduccion_simple(Resto, Modo, RestoTraducido),             % Traducir resto
    combinar_traducciones([SujetoTraducido, SVTraducido|RestoTraducido], Traducida).  % Unir

% 2. Traducción de solo sintagma nominal (para oraciones sin verbo)
traducir_solo_sintagma(Tokens, Modo, Traducida) :-
    sn(Tokens, SN, []),                                         % Solo hay SN
    traducir_sn_estructura(SN, Modo, Traducida), !.            % Traducir SN
traducir_solo_sintagma(Tokens, Modo, Traducida) :-
    append(SNTokens, [Puntuacion], Tokens),                     % SN + puntuación
    sn(SNTokens, SN, []),
    es_delimitador_oracion(Puntuacion),
    traducir_sn_estructura(SN, Modo, SNTraducido),
    atomic_list_concat([SNTraducido, Puntuacion], ' ', Traducida), !.

% 3. Traducción simple (fallback cuando el análisis falla)
traduccion_simple([], _, []).
traduccion_simple([Token|Resto], Modo, [Traduccion|RestoTraducido]) :-
    (es_verbo(Token) ->  % Si es verbo, intentar conjugar
        (obtener_persona_numero_contexto(Token, Resto, Persona, Numero) ->
            conjugar_verbo(Token, Persona, Numero, Modo, Traduccion)  % Verbo conjugado
        ;
            traducir_palabra(Token, Modo, Traduccion)  % Verbo sin conjugar
        )
    ;
        traducir_palabra(Token, Modo, Traduccion)  % Palabra normal
    ),
    traduccion_simple(Resto, Modo, RestoTraducido).  % Procesar resto

% --------- TRADUCCIÓN DE ESTRUCTURAS SINTÁCTICAS ---------

% Traducir Sintagma Nominal con diferentes estructuras
traducir_sn_estructura(sn(Nucleo), Modo, Traduccion) :-
    !, traducir_palabra(Nucleo, Modo, Traduccion).  % SN simple: solo núcleo

% SN: Det + Nucleo (Inglés -> Español)
traducir_sn_estructura(sn(Det, Nucleo), ie, Traduccion) :-
    !,
    (obtener_genero_numero_sustantivo(Nucleo, Genero, Numero) ->  % Obtener género/número
        obtener_traduccion_determinante(Det, Genero, Numero, DetTrad)  % Traducir det con concordancia
    ;
        obtener_traduccion_determinante(Det, masculino, singular, DetTrad)  % Por defecto
    ),
    traducir_palabra(Nucleo, ie, NucleoTrad),
    atomic_list_concat([DetTrad, NucleoTrad], ' ', Traduccion).

% SN: Det + Nucleo (Español -> Inglés)
traducir_sn_estructura(sn(Det, Nucleo), ei, Traduccion) :-
    !,
    traducir_palabra(Det, ei, DetTrad),
    traducir_palabra(Nucleo, ei, NucleoTrad),
    atomic_list_concat([DetTrad, NucleoTrad], ' ', Traduccion).

% SN: Det + Adjs + Nucleo (Inglés -> Español)
traducir_sn_estructura(sn(Det, Adjs, Nucleo), ie, Traduccion) :-
    !,
    obtener_genero_numero_sustantivo(Nucleo, Genero, Numero),
    obtener_traduccion_determinante(Det, Genero, Numero, DetTrad),
    traducir_palabra(Nucleo, ie, NucleoTrad),
    traducir_adjetivos_concordados(Adjs, Genero, Numero, AdjsTrad),
    atomic_list_concat([DetTrad, NucleoTrad|AdjsTrad], ' ', Traduccion).

% SN: Det + Adjs + Nucleo (Español -> Inglés) - adjetivos antes del sustantivo
traducir_sn_estructura(sn(Det, Adjs, Nucleo), ei, Traduccion) :-
    !,
    traducir_palabra(Det, ei, DetTrad),
    traducir_lista_palabras_simple(Adjs, ei, AdjsTrad),
    traducir_palabra(Nucleo, ei, NucleoTrad),
    atomic_list_concat([DetTrad|AdjsTrad], ' ', ParteAdjs),
    atomic_list_concat([ParteAdjs, NucleoTrad], ' ', Traduccion).

% SN complejo con SPs (Inglés -> Español)
traducir_sn_estructura(sn(Det, Adjs, Nucleo, SPs), ie, Traduccion) :-
    !,
    traducir_sn_estructura(sn(Det, Adjs, Nucleo), ie, ParteBase),  % Traducir base
    traducir_sps(SPs, ie, SPsTrad),                                % Traducir SPs
    atomic_list_concat([ParteBase|SPsTrad], ' ', Traduccion).      % Unir

% SN complejo con SPs (Español -> Inglés)
traducir_sn_estructura(sn(Det, Adjs, Nucleo, SPs), ei, Traduccion) :-
    !,
    traducir_sn_estructura(sn(Det, Adjs, Nucleo), ei, ParteBase),
    traducir_sps(SPs, ei, SPsTrad),
    atomic_list_concat([ParteBase|SPsTrad], ' ', Traduccion).

% Fallback para SN no reconocido
traducir_sn_estructura(SN, Modo, Traduccion) :-
    traducir_sn(SN, Modo, Traduccion).

% Traducir Sintagma Verbal
traducir_sv_estructura(sv(Verbo), Modo, VerboTraducido) :-
    !, traducir_palabra(Verbo, Modo, VerboTraducido).  % SV simple: solo verbo

traducir_sv_estructura(sv(Verbo, Comp), Modo, Traduccion) :-
    !,
    traducir_complemento(Comp, Modo, CompTrad),        % Traducir complemento
    atomic_list_concat([Verbo, CompTrad], ' ', Traduccion).

traducir_sv_estructura(sv(Verbo, CD, CI), Modo, Traduccion) :-
    !,
    traducir_sn_estructura(CD, Modo, CDTrad),          % Traducir CD
    traducir_sp(CI, Modo, CITrad),                     % Traducir CI  
    atomic_list_concat([Verbo, CDTrad, CITrad], ' ', Traduccion).

traducir_sv_estructura(SV, _, SV).  % Fallback: devolver original

% --------- TRADUCCIÓN DE PALABRAS ---------
%
% traducir_palabra/3: Traduce palabra individual según modo y categoría gramatical

% Español -> Inglés (ei)
traducir_palabra(Palabra, ei, Ingles) :-
    interjeccion(Palabra, Ingles), !.                  % Interjecciones
traducir_palabra(Palabra, ei, Ingles) :-
    sustantivo(Palabra, Ingles, _, _, _), !.           % Sustantivos
traducir_palabra(Palabra, ei, Ingles) :-
    verbo(Palabra, InfinitivoIng, _, _),               % Verbos (infinitivo)
    Ingles = InfinitivoIng, !.
traducir_palabra(Palabra, ei, Ingles) :-
    verbo(_, InfinitivoIng, ConjEsp, _),               % Verbos conjugados
    member(Palabra, ConjEsp),
    Ingles = InfinitivoIng, !.
traducir_palabra(Palabra, ei, Ingles) :-
    adjetivo(Palabra, Ingles, _, _), !.                % Adjetivos
traducir_palabra(Palabra, ei, Ingles) :-
    determinante(Palabra, Ingles, _, _, _), !.         % Determinantes
traducir_palabra(Palabra, ei, Ingles) :-
    pronombre(Palabra, Ingles, _, _), !.               % Pronombres
traducir_palabra(Palabra, ei, Ingles) :-
    preposicion(Palabra, Ingles), !.                   % Preposiciones
traducir_palabra(Palabra, ei, Ingles) :-
    adverbio(Palabra, Ingles), !.                      % Adverbios
traducir_palabra(Palabra, ei, Ingles) :-
    conjuncion(Palabra, Ingles), !.                    % Conjunciones

% Inglés -> Español (ie)
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

% Fallback: palabra no encontrada, devolver original
traducir_palabra(Palabra, _, Palabra).

% --------- POSTPROCESAMIENTO ---------

% --------- UNIFICACIÓN DE RESULTADOS ---------
% unir_oraciones_traducidas/2: Une lista de oraciones traducidas en texto final
% @param Oraciones: Lista de oraciones traducidas
% @param Texto: Texto unido resultante
unir_oraciones_traducidas(Oraciones, Texto) :-
    maplist(asegurar_atomo, Oraciones, OracionesAtomos),
    atomic_list_concat(OracionesAtomos, ' ', Texto).

% asegurar_atomo/2: Convierte elemento a átomo para concatenación
% @param Elemento: Elemento a convertir (átomo, lista o string)
% @param Atom: Átomo resultante
asegurar_atomo(Elemento, Atom) :-
    (atom(Elemento) -> 
        Atom = Elemento
    ; is_list(Elemento) -> 
        atomic_list_concat(Elemento, ' ', Atom)
    ; 
        atom_string(Elemento, Atom)
    ).

% combinar_traducciones/2: Combina componentes de traducción en lista de tokens
% @param Componentes: Lista de componentes a combinar
% @param TokensTraducidos: Lista de tokens resultante
combinar_traducciones(Componentes, TokensTraducidos) :-
    atomic_list_concat(Componentes, ' ', TextoCompleto),
    atomic_list_concat(TokensTraducidos, ' ', TextoCompleto), !.
combinar_traducciones(Componentes, [TextoCompleto]) :-
    atomic_list_concat(Componentes, ' ', TextoCompleto).  % Fallback: texto único

%  --------- FUNCIONES AUXILIARES ---------

% Auxiliares de traducción para diferentes tipos de complementos
traducir_complemento(pred(Adj), _, Adj) :- !.
traducir_complemento(adv(Adv), Modo, AdvTrad) :-
    !, traducir_palabra(Adv, Modo, AdvTrad).
traducir_complemento(Comp, Modo, CompTrad) :-
    traducir_sn_estructura(Comp, Modo, CompTrad).

% Traducir lista de adjetivos con concordancia
traducir_adjetivos_concordados([], _, _, []).
traducir_adjetivos_concordados([Adj|Adjs], Genero, Numero, [AdjTrad|AdjsTrad]) :-
    traducir_adjetivo_concordancia(Adj, Genero, Numero, AdjTrad),
    traducir_adjetivos_concordados(Adjs, Genero, Numero, AdjsTrad).

% Traducir lista de sintagmas preposicionales
traducir_sps([], _, []).  % Caso base
traducir_sps([SP|SPs], Modo, [SPTrad|SPsTrad]) :-
    traducir_sp(SP, Modo, SPTrad),        % Traducir un SP
    traducir_sps(SPs, Modo, SPsTrad).     % Traducir resto

% Traducir sintagma preposicional individual
traducir_sp(sp(Prep, SN), Modo, Traduccion) :-
    traducir_palabra(Prep, Modo, PrepTrad),      % Traducir preposición
    traducir_sn_estructura(SN, Modo, SNTrad),    % Traducir SN
    atomic_list_concat([PrepTrad, SNTrad], ' ', Traduccion).  % Unir

% Obtener traducción de determinante con concordancia de género/número
obtener_traduccion_determinante(DetIng, Genero, Numero, DetEsp) :-
    determinante(DetEsp, DetIng, Numero, Genero, _), !.  % Con concordancia
obtener_traduccion_determinante(DetIng, _, _, DetEsp) :-
    determinante(DetEsp, DetIng, _, _, _), !.             % Sin concordancia
obtener_traduccion_determinante(Det, _, _, Det).          % Fallback

% Traducción con contexto para determinantes (Inglés -> Español)
traducir_sn(SN, Modo, Traducido) :-
    traducir_sn_estructura(SN, Modo, Traducido), !.  % Intentar traducción estructural
traducir_sn(SN, ie, Traducido) :-
    atomic_list_concat(Palabras, ' ', SN),            % Dividir en palabras
    traducir_lista_palabras_con_contexto(Palabras, ie, PalabrasTraducidas),  % Traducir con contexto
    atomic_list_concat(PalabrasTraducidas, ' ', Traducido).
traducir_sn(SN, ei, Traducido) :-
    traducir_palabra(SN, ei, Traducido).              % Traducción simple

% Traducir lista de palabras con contexto para determinantes
traducir_lista_palabras_con_contexto([], _, []).  % Caso base
traducir_lista_palabras_con_contexto([Palabra|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_palabra_con_contexto(Palabra, Resto, Modo, Traducida),  % Traducir con contexto
    traducir_lista_palabras_con_contexto(Resto, Modo, RestoTrad).

% Traducir palabra con contexto (especial para determinantes)
traducir_palabra_con_contexto(Palabra, RestoTokens, ie, Traduccion) :-
    es_determinante(Palabra),                         % Si es determinante
    encontrar_sustantivo_en_lista(RestoTokens, Sustantivo),  % Buscar sustantivo siguiente
    obtener_traduccion_determinante_contextual(Palabra, Sustantivo, Traduccion), !.  % Traducir con contexto
traducir_palabra_con_contexto(Palabra, _, Modo, Traduccion) :-
    traducir_palabra(Palabra, Modo, Traduccion).      % Traducción normal

% Encontrar primer sustantivo válido en lista
encontrar_sustantivo_en_lista([], _) :- fail.  % No encontrado
encontrar_sustantivo_en_lista([Token|_], Token) :-
    es_sustantivo_valido(Token), !.             % Encontrado
encontrar_sustantivo_en_lista([_|Resto], Sustantivo) :-
    encontrar_sustantivo_en_lista(Resto, Sustantivo).  % Buscar en resto

% Obtener traducción de determinante con contexto del sustantivo
obtener_traduccion_determinante_contextual(DetIng, Sustantivo, DetEsp) :-
    (sustantivo(_, Sustantivo, _, Numero, Genero) ; sustantivo(Sustantivo, _, _, Numero, Genero)),
    determinante(DetEsp, DetIng, Numero, Genero, _), !.  % Con concordancia del sustantivo
obtener_traduccion_determinante_contextual(DetIng, _, DetEsp) :-
    determinante(DetEsp, DetIng, singular, masculino, _), !.  % Por defecto

% Conjugación contextual: obtener persona y número del contexto
obtener_persona_numero_contexto(_, Tokens, Persona, Numero) :-
    encontrar_sujeto_en_contexto(Tokens, Sujeto),          % Buscar sujeto en tokens restantes
    persona_numero_sujeto(Sujeto, Persona, Numero), !.    % Obtener persona/número
obtener_persona_numero_contexto(_, _, 'tercera', 'singular'). % Valor por defecto

% Encontrar sujeto en contexto (tokens restantes)
encontrar_sujeto_en_contexto(Tokens, Sujeto) :-
    sn(Tokens, Sujeto, _), !.                  % Buscar como sintagma nominal
encontrar_sujeto_en_contexto([Token|_], Token) :-
    es_pronombre(Token), !.                    % Buscar como pronombre
encontrar_sujeto_en_contexto([_|Resto], Sujeto) :-
    encontrar_sujeto_en_contexto(Resto, Sujeto).  % Buscar en resto

% Traducir lista de palabras simple (sin contexto)
traducir_lista_palabras_simple([], _, []).  % Caso base
traducir_lista_palabras_simple([Palabra|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_palabra(Palabra, Modo, Traducida),              % Traducir palabra
    traducir_lista_palabras_simple(Resto, Modo, RestoTrad).  % Traducir resto
