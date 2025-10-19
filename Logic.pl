% Logic.pl

% ---------- TOKENIZACIÓN ----------

% tokenizar_entrada/2: Convierte una cadena de texto en una lista de tokens
% @param Entrada: Cadena de texto a tokenizar
% @param Tokens: Lista de tokens resultante
tokenizar_entrada(Entrada, Tokens) :-
    downcase_atom(Entrada, LineaMinusculas),
    atomic_list_concat(AtomosPalabras, ' ', LineaMinusculas),
    maplist(separar_puntuacion, AtomosPalabras, ListasPalabras),
    flatten(ListasPalabras, TokensFiltrados),
    excluir(=(''), TokensFiltrados, Tokens).

% separar_puntuacion/2: Separa los signos de puntuación de las palabras
% @param Palabra: Palabra a procesar
% @param Tokens: Lista de tokens resultantes
separar_puntuacion(Palabra, Tokens) :-
    atom_chars(Palabra, Caracteres),
    separar_caracteres(Caracteres, [], Tokens).

% separar_caracteres/3: Procesa caracteres para separar puntuación
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
    (es_puntuacion(Caracter) ->
        (PalabraActual = [] ->
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPuntuacion|TokensRestantes]
        ;
            atom_chars(TokenPalabra, PalabraActual),
            atom_chars(TokenPuntuacion, [Caracter]),
            separar_caracteres(Resto, [], TokensRestantes),
            Tokens = [TokenPalabra, TokenPuntuacion|TokensRestantes]
        )
    ;
        append(PalabraActual, [Caracter], NuevaPalabra),
        separar_caracteres(Resto, NuevaPalabra, Tokens)
    ).

% es_puntuacion/1: Verifica si un carácter es signo de puntuación
% @param Caracter: Carácter a verificar
es_puntuacion(Caracter) :-
    member(Caracter, [',', '.', ';', ':', '!', '?', '¿', '¡', '(', ')', '[', ']', '{', '}']).

% excluir/3: Filtra elementos de una lista según un predicado
% @param Predicado: Predicado de filtrado
% @param Lista: Lista original
% @param Filtrada: Lista filtrada
excluir(_, [], []).
excluir(Predicado, [X|Xs], Filtrada) :-
    (call(Predicado, X) ->
        excluir(Predicado, Xs, Filtrada)
    ;
        Filtrada = [X|FiltradaResto],
        excluir(Predicado, Xs, FiltradaResto)
    ).

% ---------- RECONOCIMIENTO GRAMATICAL ----------

% es_sustantivo/1: Verifica si una palabra es sustantivo
es_sustantivo(Palabra) :- sustantivo(Palabra, _, _, _, _).
es_sustantivo(Palabra) :- sustantivo(_, Palabra, _, _, _).

% es_interjeccion/1: Verifica si una palabra es interjección
es_interjeccion(Palabra) :- interjeccion(Palabra, _).
es_interjeccion(Palabra) :- interjeccion(_, Palabra).

% es_verbo/1: Verifica si una palabra es verbo
es_verbo(Palabra) :- verbo(_, Palabra, _, _).
es_verbo(Palabra) :- verbo(Palabra, _, _, _).
es_verbo(Palabra) :- verbo(_, _, Conjugaciones, _), member(Palabra, Conjugaciones).
es_verbo(Palabra) :- verbo(_, _, _, Conjugaciones), member(Palabra, Conjugaciones).

% es_adjetivo/1: Verifica si una palabra es adjetivo
es_adjetivo(Palabra) :- adjetivo(Palabra, _).
es_adjetivo(Palabra) :- adjetivo(_, Palabra).

% es_determinante/1: Verifica si una palabra es determinante
es_determinante(Palabra) :- determinante(Palabra, _, _, _, _).
es_determinante(Palabra) :- determinante(_, Palabra, _, _, _).

% es_pronombre/1: Verifica si una palabra es pronombre
es_pronombre(Palabra) :- pronombre(Palabra, _, _, _).
es_pronombre(Palabra) :- pronombre(_, Palabra, _, _).

% es_preposicion/1: Verifica si una palabra es preposición
es_preposicion(Palabra) :- preposicion(Palabra, _).
es_preposicion(Palabra) :- preposicion(_, Palabra).

% es_adverbio/1: Verifica si una palabra es adverbio
es_adverbio(Palabra) :- adverbio(Palabra, _).
es_adverbio(Palabra) :- adverbio(_, Palabra).

% es_conjuncion/1: Verifica si una palabra es conjunción
es_conjuncion(Palabra) :- conjuncion(Palabra, _).
es_conjuncion(Palabra) :- conjuncion(_, Palabra).

% ---------- PREDICADOS PARA SUJETOS (MEJORADOS) ----------

% es_sustantivo_sujeto/1: Verifica si un sustantivo puede funcionar como sujeto
% @param Sustantivo: Sustantivo a verificar
es_sustantivo_sujeto(Sustantivo) :-
    (sustantivo(Sustantivo, _, Persona, _, _) ;
     sustantivo(_, Sustantivo, Persona, _, _)),
    member(Persona, ['primera', 'segunda', 'tercera']).

% persona_numero_sujeto/3: Determina persona y número de un sujeto
% @param Sujeto: Palabra que funciona como sujeto
% @param Persona: Persona gramatical
% @param Numero: Número gramatical
persona_numero_sujeto(Sujeto, Persona, Numero) :-
    atom(Sujeto),
    (   sustantivo(Sujeto, _, Persona, Numero, _)
    ;   sustantivo(_, Sujeto, Persona, Numero, _)
    ), !.

persona_numero_sujeto(SujetoCompuesto, 'tercera', Numero) :-
    atomic_list_concat([Determinante, Sustantivo], ' ', SujetoCompuesto),
    es_determinante(Determinante),
    es_sustantivo(Sustantivo),
    (   sustantivo(Sustantivo, _, _, Numero, _)
    ;   sustantivo(_, Sustantivo, _, Numero, _)
    ), !.

% es_sujeto_valido/1: Verifica si una palabra puede ser sujeto
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

% traducir_sujeto/3: Traduce sujetos
traducir_sujeto(Sujeto, ei, Ingles) :-
    atom(Sujeto),
    sustantivo(Sujeto, Ingles, _, _, _), !.

traducir_sujeto(Sujeto, ie, Espanol) :-
    atom(Sujeto),
    sustantivo(Espanol, Sujeto, _, _, _), !.

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

traducir_sujeto(Sujeto, _, Sujeto).  % Fallback

% ---------- CONJUGACIÓN VERBAL ----------

% Índices para conjugaciones: [1S, 2S, 3S, 1P, 2P, 3P]
indice_conjugacion('primera', 'singular', 1).
indice_conjugacion('segunda', 'singular', 2).
indice_conjugacion('tercera', 'singular', 3).
indice_conjugacion('primera', 'plural', 4).
indice_conjugacion('segunda', 'plural', 5).
indice_conjugacion('tercera', 'plural', 6).

% conjugar_es_en/4: Conjuga verbo español → inglés
% @param VerboEsp: Verbo en español
% @param Persona: Persona gramatical
% @param Numero: Número gramatical
% @param VerboIng: Verbo conjugado en inglés
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(InfinitivoEsp, _, ConjEsp, ConjIng),
    (member(VerboEsp, ConjEsp) ; VerboEsp = InfinitivoEsp),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng).

% conjugar_en_es/4: Conjuga verbo inglés → español
% @param VerboIng: Verbo en inglés
% @param Persona: Persona gramatical
% @param Numero: Número gramatical
% @param VerboEsp: Verbo conjugado en español
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(_, InfinitivoIng, ConjEsp, ConjIng),
    (member(VerboIng, ConjIng) ; VerboIng = InfinitivoIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp).

% ---------- TRADUCCIÓN ----------

% traducir_con_conjugacion/3: Traduce considerando conjugación verbal
% @param Tokens: Lista de tokens a traducir
% @param Modo: ei (español→inglés) o ie (inglés→español)
% @param Traduccion: Lista de tokens traducidos
traducir_con_conjugacion(Tokens, Modo, Traduccion) :-
    analizar_sujeto_verbo(Tokens, Sujeto, Verbo, Resto),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    traducir_sujeto(Sujeto, Modo, SujetoTraducido),
    traducir_verbo_conjugado(Verbo, Persona, Numero, Modo, VerboTraducido),
    traducir_estructura(Resto, Modo, RestoTraducido),
    append([SujetoTraducido, VerboTraducido], RestoTraducido, Traduccion).

% analizar_sujeto_verbo/4: Identifica sujeto y verbo en una lista de tokens
% @param Tokens: Lista de tokens de entrada
% @param Sujeto: Sujeto identificado
% @param Verbo: Verbo identificado
% @param Resto: Tokens restantes
analizar_sujeto_verbo([Sujeto, Verbo|Resto], Sujeto, Verbo, Resto) :-
    es_sujeto_valido(Sujeto),
    es_verbo(Verbo).

analizar_sujeto_verbo([Determinante, Sustantivo, Verbo|Resto], SujetoCompleto, Verbo, Resto) :-
    es_determinante(Determinante),
    es_sustantivo(Sustantivo),
    es_verbo(Verbo),
    atomic_list_concat([Determinante, Sustantivo], ' ', SujetoCompleto),
    es_sustantivo_sujeto(Sustantivo).

% traducir_verbo_conjugado/5: Traduce verbo aplicando conjugación
traducir_verbo_conjugado(Verbo, Persona, Numero, ei, Traduccion) :-
    conjugar_es_en(Verbo, Persona, Numero, Traduccion), !.

traducir_verbo_conjugado(Verbo, Persona, Numero, ie, Traduccion) :-
    conjugar_en_es(Verbo, Persona, Numero, Traduccion), !.

traducir_verbo_conjugado(Verbo, _, _, Modo, Traduccion) :-
    traducir_palabra(Verbo, Modo, Traduccion).

% ---------- GRAMÁTICA ----------

% oracion//0: Define una oración completa
oracion --> sintagma_nominal, sintagma_verbal.
oracion --> sintagma_verbal.
oracion --> interjeccion_token.

% sintagma_nominal//0: Define un sintagma nominal
sintagma_nominal --> determinante_token, sustantivo_token.
sintagma_nominal --> pronombre_token.
sintagma_nominal --> sustantivo_token.
sintagma_nominal --> adjetivo_token, sustantivo_token.
sintagma_nominal --> determinante_token, adjetivo_token, sustantivo_token.

% sintagma_verbal//0: Define un sintagma verbal
sintagma_verbal --> verbo_token.
sintagma_verbal --> verbo_token, sintagma_nominal.
sintagma_verbal --> verbo_token, preposicion_token, sintagma_nominal.
sintagma_verbal --> verbo_token, adverbio_token.
sintagma_verbal --> verbo_token, sintagma_nominal, adverbio_token.

% Tokens individuales con predicados de reconocimiento
interjeccion_token --> [Palabra], {es_interjeccion(Palabra)}.
determinante_token --> [Palabra], {es_determinante(Palabra)}.
sustantivo_token --> [Palabra], {es_sustantivo(Palabra)}.
verbo_token --> [Palabra], {es_verbo(Palabra)}.
adjetivo_token --> [Palabra], {es_adjetivo(Palabra)}.
pronombre_token --> [Palabra], {es_pronombre(Palabra)}.
preposicion_token --> [Palabra], {es_preposicion(Palabra)}.
adverbio_token --> [Palabra], {es_adverbio(Palabra)}.
conjuncion_token --> [Palabra], {es_conjuncion(Palabra)}.

% ---------- TRADUCCIÓN ESTRUCTURAL ----------

% analizar_y_traducir/3: Analiza y traduce una lista de tokens
% @param Tokens: Lista de tokens a traducir
% @param Modo: Dirección de traducción
% @param Traduccion: Resultado de la traducción
analizar_y_traducir(Tokens, Modo, Traduccion) :-
    (traducir_con_conjugacion(Tokens, Modo, Traduccion)
    ; 
    (phrase(oracion, Tokens),
     traducir_estructura(Tokens, Modo, Traduccion))
    ).

% traducir_estructura/3: Traduce una lista de tokens manteniendo estructura
traducir_estructura([], _, []).
traducir_estructura([Token|Resto], Modo, [Traduccion|RestoTraducido]) :-
    traducir_palabra(Token, Modo, Traduccion),
    traducir_estructura(Resto, Modo, RestoTraducido).

% traducir_palabra/3: Traduce una palabra individual
% @param Palabra: Palabra a traducir
% @param Modo: ei (español→inglés) o ie (inglés→español)
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
    adjetivo(Palabra, Ingles), !.
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

% Traducción inglés → español
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
    adjetivo(Espanol, Palabra), !.
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

% Palabra no encontrada - mantener original
traducir_palabra(Palabra, _, Palabra).
