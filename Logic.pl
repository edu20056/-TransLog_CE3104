% Logic.pl - Versión Mejorada con Sintagmas Avanzados y Conjugación Mejorada

:- encoding(utf8).

% --------- DEFINICIONES Y VALIDACIONES ----------
es_delimitador_oracion('.').
es_delimitador_oracion('!').
es_delimitador_oracion('?').
es_delimitador_oracion(Token) :-
    es_conjuncion(Token).

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

tokenizar_entrada(Entrada, Tokens) :-
    downcase_atom(Entrada, LineaMinusculas),
    atomic_list_concat(AtomosPalabras, ' ', LineaMinusculas),
    maplist(separar_puntuacion, AtomosPalabras, ListasPalabras),
    flatten(ListasPalabras, TokensFiltrados),
    excluir(=(''), TokensFiltrados, Tokens).

excluir(_, [], []).
excluir(Predicado, [X|Xs], Filtrada) :-
    (call(Predicado, X) ->
        excluir(Predicado, Xs, Filtrada)
    ;
        Filtrada = [X|FiltradaResto],
        excluir(Predicado, Xs, FiltradaResto)
    ).

separar_puntuacion(Palabra, Tokens) :-
    atom_chars(Palabra, Caracteres),
    separar_caracteres(Caracteres, [], Tokens).

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

es_puntuacion(Caracter) :-
    member(Caracter, [',', '.', ';', ':', '!', '?', '¿', '¡', '(', ')', '[', ']', '{', '}']).

% --------- SEGMENTACIÓN DE ORACIONES -----------

dividir_por_delimitadores([], []).
dividir_por_delimitadores(Tokens, [Oracion|OracionesRestantes]) :-
    tomar_oracion_completa(Tokens, Oracion, TokensRestantes),
    dividir_por_delimitadores(TokensRestantes, OracionesRestantes).

tomar_oracion_completa([], [], []).
tomar_oracion_completa([Token|Resto], Oracion, TokensRestantes) :-
    (es_delimitador_oracion(Token) ->
        Oracion = [Token],
        TokensRestantes = Resto
    ;
        Oracion = [Token|OracionResto],
        tomar_oracion_completa(Resto, OracionResto, TokensRestantes)
    ).

% ========= SINTAGMAS MEJORADOS =========

% --------- SINTAGMA PREPOSICIONAL (SP) ---------
% Maneja construcciones como "of the house", "in the garden"

sp(Tokens, sp(Prep, SN), Resto) :-
    Tokens = [Prep|RestoTokens],
    es_preposicion(Prep),
    sn(RestoTokens, SN, Resto), !.

% --------- SINTAGMA NOMINAL (SN) MEJORADO ---------
% Estructura: sn(Det, Adjs, Nucleo, SPs)
% Ejemplos: "the big house", "the beautiful red car of my father"

sn(Tokens, SN, Resto) :-
    sn_completo(Tokens, SN, Resto), !.

sn(Tokens, SN, Resto) :-
    sn_con_adjetivos(Tokens, SN, Resto), !.

sn(Tokens, SN, Resto) :-
    sn_con_det(Tokens, SN, Resto), !.

sn(Tokens, SN, Resto) :-
    sn_simple(Tokens, SN, Resto), !.

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

% Auxiliares para tomar múltiples adjetivos
tomar_adjetivos(Tokens, [Adj|Adjs], Resto) :-
    Tokens = [Adj|T1],
    es_adjetivo(Adj),
    tomar_adjetivos(T1, Adjs, Resto), !.

tomar_adjetivos(Tokens, [], Tokens).

% Auxiliares para tomar múltiples sintagmas preposicionales
tomar_sps(Tokens, [SP|SPs], Resto) :-
    sp(Tokens, SP, T1),
    tomar_sps(T1, SPs, Resto), !.

tomar_sps(Tokens, [], Tokens).

% --------- CONJUGACIÓN VERBAL MEJORADA ---------

% indice_conjugacion/3: Mapea persona y número a índice de conjugación
indice_conjugacion('primera', 'singular', 1).
indice_conjugacion('segunda', 'singular', 2).
indice_conjugacion('tercera', 'singular', 3).
indice_conjugacion('primera', 'plural', 4).
indice_conjugacion('segunda', 'plural', 5).
indice_conjugacion('tercera', 'plural', 6).

% conjugar_es_en/4: Conjuga verbo español a inglés según persona y número
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(VerboEsp, _, _, ConjIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng), !.

% También manejar cuando el verbo español es una forma conjugada
conjugar_es_en(VerboEsp, Persona, Numero, VerboIng) :-
    verbo(_, _, ConjEsp, ConjIng),
    member(VerboEsp, ConjEsp),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjIng, VerboIng), !.

conjugar_es_en(VerboEsp, _, _, VerboEsp). % Fallback

% conjugar_en_es/4: Conjuga verbo inglés a español según persona y número
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(_, VerboIng, ConjEsp, _),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp), !.

% También manejar cuando el verbo inglés es una forma conjugada
conjugar_en_es(VerboIng, Persona, Numero, VerboEsp) :-
    verbo(_, _, ConjEsp, ConjIng),
    member(VerboIng, ConjIng),
    indice_conjugacion(Persona, Numero, Indice),
    nth1(Indice, ConjEsp, VerboEsp), !.

conjugar_en_es(VerboIng, _, _, VerboIng). % Fallback

% conjugar_verbo/5: Función principal que considera el modo
conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConjugado) :-
    (Modo = ei -> 
        conjugar_es_en(Verbo, Persona, Numero, VerboConjugado)
    ; Modo = ie -> 
        conjugar_en_es(Verbo, Persona, Numero, VerboConjugado)
    ; 
        VerboConjugado = Verbo
    ).

% Detectar si un verbo está en español
es_verbo_espanol(Verbo) :-
    verbo(Verbo, _, _, _), !.
es_verbo_espanol(Verbo) :-
    verbo(_, _, ConjEsp, _),
    member(Verbo, ConjEsp), !.

% Detectar si un verbo está en inglés  
es_verbo_ingles(Verbo) :-
    verbo(_, Verbo, _, _), !.
es_verbo_ingles(Verbo) :-
    verbo(_, _, _, ConjIng),
    member(Verbo, ConjIng), !.

% --------- SINTAGMA VERBAL (SV) MEJORADO CON MODO ---------
% Estructura: sv(Verbo, Complementos, Adverbios)
% Ejemplos: "eats quickly", "gives the book to Mary", "is very happy"

sv(Tokens, Sujeto, Modo, SV, Resto) :-
    sv_con_cd_ci(Tokens, Sujeto, Modo, SV, Resto), !.

sv(Tokens, Sujeto, Modo, SV, Resto) :-
    sv_con_adverbio(Tokens, Sujeto, Modo, SV, Resto), !.

sv(Tokens, Sujeto, Modo, SV, Resto) :-
    sv_con_adjetivo(Tokens, Sujeto, Modo, SV, Resto), !.

sv(Tokens, Sujeto, Modo, SV, Resto) :-
    sv_con_complemento(Tokens, Sujeto, Modo, SV, Resto), !.

sv(Tokens, Sujeto, Modo, SV, Resto) :-
    sv_simple(Tokens, Sujeto, Modo, SV, Resto), !.

% SV con Complemento Directo e Indirecto: Verbo + SN (CD) + SP (CI)
% Ejemplo: "gives the book to Mary"
sv_con_cd_ci([Verbo|RestoTokens], Sujeto, Modo, sv(VerboConj, CD, CI), RestoFinal) :-
    es_verbo(Verbo),
    sn(RestoTokens, CD, T1),
    sp(T1, CI, RestoFinal),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% SV con Adverbio: Verbo + Adverbio
% Ejemplo: "runs quickly"
sv_con_adverbio([Verbo, Adv|Resto], Sujeto, Modo, sv(VerboConj, adv(Adv)), Resto) :-
    es_verbo(Verbo),
    es_adverbio(Adv),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% SV con Adjetivo Predicativo: Verbo copulativo + Adjetivo
% Ejemplo: "is beautiful"
sv_con_adjetivo([Verbo, Adj|Resto], Sujeto, Modo, sv(VerboConj, pred(AdjConc)), Resto) :-
    es_verbo(Verbo),
    es_adjetivo(Adj),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj),
    obtener_genero_numero_sujeto(Sujeto, Genero, NumeroAdj),
    traducir_adjetivo_concordancia(Adj, Genero, NumeroAdj, AdjConc), !.

% SV con Complemento: Verbo + SN
% Ejemplo: "eats an apple"
sv_con_complemento([Verbo|RestoTokens], Sujeto, Modo, sv(VerboConj, Comp), RestoFinal) :-
    es_verbo(Verbo),
    sn(RestoTokens, Comp, RestoFinal),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% SV Simple: Solo verbo
sv_simple([Verbo|Resto], Sujeto, Modo, sv(VerboConj), Resto) :-
    es_verbo(Verbo),
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, VerboConj), !.

% --------- VALIDACIÓN DE SUSTANTIVOS ---------

es_sustantivo_valido(Token) :-
    (sustantivo(_, Token, _, _, _) ; sustantivo(Token, _, _, _, _)),
    \+ es_determinante(Token),
    \+ es_preposicion(Token),
    \+ es_adverbio(Token).

% --------- CONCORDANCIA ---------

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

obtener_genero_numero_sustantivo(Sustantivo, Genero, Numero) :-
    atom(Sustantivo),
    (   sustantivo(Sustantivo, _, _, Numero, Genero)
    ;   sustantivo(_, Sustantivo, _, Numero, Genero)
    ), !.

obtener_genero_numero_sustantivo(SujetoCompuesto, Genero, Numero) :-
    atomic_list_concat([_, Sustantivo], ' ', SujetoCompuesto),
    obtener_genero_numero_sustantivo(Sustantivo, Genero, Numero), !.

obtener_genero_numero_sustantivo(_, masculino, singular).

traducir_adjetivo_concordancia(AdjIngles, Genero, Numero, AdjEspanol) :-
    adjetivo(AdjEspanol, AdjIngles, Genero, Numero), !.

traducir_adjetivo_concordancia(AdjIngles, _, _, AdjEspanol) :-
    adjetivo(AdjEspanol, AdjIngles, _, _), !.

% --------- DETECCIÓN DE PERSONA Y NÚMERO ---------

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

persona_numero_sustantivo(Sujeto, Persona, Numero) :-
    atom(Sujeto),
    (   sustantivo(Sujeto, _, Persona, Numero, _)
    ;   sustantivo(_, Sujeto, Persona, Numero, _)
    ), !.

% Pronombres en español
persona_numero_sustantivo('yo', 'primera', 'singular') :- !.
persona_numero_sustantivo('tú', 'segunda', 'singular') :- !.
persona_numero_sustantivo('él', 'tercera', 'singular') :- !.
persona_numero_sustantivo('ella', 'tercera', 'singular') :- !.
persona_numero_sustantivo('usted', 'tercera', 'singular') :- !.
persona_numero_sustantivo('nosotros', 'primera', 'plural') :- !.
persona_numero_sustantivo('nosotras', 'primera', 'plural') :- !.
persona_numero_sustantivo('vosotros', 'segunda', 'plural') :- !.
persona_numero_sustantivo('vosotras', 'segunda', 'plural') :- !.
persona_numero_sustantivo('ellos', 'tercera', 'plural') :- !.
persona_numero_sustantivo('ellas', 'tercera', 'plural') :- !.
persona_numero_sustantivo('ustedes', 'tercera', 'plural') :- !.

% Pronombres en inglés
persona_numero_sustantivo('I', 'primera', 'singular') :- !.
persona_numero_sustantivo('you', 'segunda', 'singular') :- !.
persona_numero_sustantivo('he', 'tercera', 'singular') :- !.
persona_numero_sustantivo('she', 'tercera', 'singular') :- !.
persona_numero_sustantivo('it', 'tercera', 'singular') :- !.
persona_numero_sustantivo('we', 'primera', 'plural') :- !.
persona_numero_sustantivo('you', 'segunda', 'plural') :- !.
persona_numero_sustantivo('they', 'tercera', 'plural') :- !.

persona_numero_sustantivo(SujetoCompuesto, 'tercera', Numero) :-
    atomic_list_concat([_, Sustantivo], ' ', SujetoCompuesto),
    (   sustantivo(Sustantivo, _, _, Numero, _)
    ;   sustantivo(_, Sustantivo, _, Numero, _)
    ), !.

persona_numero_sustantivo(_, 'tercera', 'singular'). % Default

% --------- ANÁLISIS DE ORACIÓN MEJORADO ---------

analizar_oracion(Tokens, Modo, Sujeto, SV, Resto) :-
    sn(Tokens, Sujeto, TokensDespuesSN),
    sv(TokensDespuesSN, Sujeto, Modo, SV, Resto).

% --------- TRADUCCIÓN DE ESTRUCTURAS SINTÁCTICAS ---------

% Traducir Sintagma Nominal
traducir_sn_estructura(sn(Nucleo), Modo, Traduccion) :-
    !, traducir_palabra(Nucleo, Modo, Traduccion).

traducir_sn_estructura(sn(Det, Nucleo), ie, Traduccion) :-
    !,
    obtener_genero_numero_sustantivo(Nucleo, Genero, Numero),
    obtener_traduccion_determinante(Det, Genero, Numero, DetTrad),
    traducir_palabra(Nucleo, ie, NucleoTrad),
    atomic_list_concat([DetTrad, NucleoTrad], ' ', Traduccion).

traducir_sn_estructura(sn(Det, Nucleo), ei, Traduccion) :-
    !,
    traducir_palabra(Det, ei, DetTrad),
    traducir_palabra(Nucleo, ei, NucleoTrad),
    atomic_list_concat([DetTrad, NucleoTrad], ' ', Traduccion).

traducir_sn_estructura(sn(Det, Adjs, Nucleo), ie, Traduccion) :-
    !,
    obtener_genero_numero_sustantivo(Nucleo, Genero, Numero),
    obtener_traduccion_determinante(Det, Genero, Numero, DetTrad),
    traducir_palabra(Nucleo, ie, NucleoTrad),
    traducir_adjetivos_concordados(Adjs, Genero, Numero, AdjsTrad),
    atomic_list_concat([DetTrad, NucleoTrad|AdjsTrad], ' ', Traduccion).

traducir_sn_estructura(sn(Det, Adjs, Nucleo), ei, Traduccion) :-
    !,
    traducir_palabra(Det, ei, DetTrad),
    traducir_lista_palabras_simple(Adjs, ei, AdjsTrad),
    traducir_palabra(Nucleo, ei, NucleoTrad),
    atomic_list_concat([DetTrad|AdjsTrad], ' ', ParteAdjs),
    atomic_list_concat([ParteAdjs, NucleoTrad], ' ', Traduccion).

traducir_sn_estructura(sn(Det, Adjs, Nucleo, SPs), ie, Traduccion) :-
    !,
    traducir_sn_estructura(sn(Det, Adjs, Nucleo), ie, ParteBase),
    traducir_sps(SPs, ie, SPsTrad),
    atomic_list_concat([ParteBase|SPsTrad], ' ', Traduccion).

traducir_sn_estructura(sn(Det, Adjs, Nucleo, SPs), ei, Traduccion) :-
    !,
    traducir_sn_estructura(sn(Det, Adjs, Nucleo), ei, ParteBase),
    traducir_sps(SPs, ei, SPsTrad),
    atomic_list_concat([ParteBase|SPsTrad], ' ', Traduccion).

traducir_sn_estructura(SN, Modo, Traduccion) :-
    traducir_sn(SN, Modo, Traduccion).

% Traducir Sintagma Verbal considerando el modo
traducir_sv_estructura(sv(Verbo), Modo, VerboTraducido) :-
    !, traducir_palabra(Verbo, Modo, VerboTraducido).

traducir_sv_estructura(sv(Verbo, Comp), Modo, Traduccion) :-
    !,
    traducir_complemento(Comp, Modo, CompTrad),
    atomic_list_concat([Verbo, CompTrad], ' ', Traduccion).

traducir_sv_estructura(sv(Verbo, CD, CI), Modo, Traduccion) :-
    !,
    traducir_sn_estructura(CD, Modo, CDTrad),
    traducir_sp(CI, Modo, CITrad),
    atomic_list_concat([Verbo, CDTrad, CITrad], ' ', Traduccion).

traducir_sv_estructura(SV, _, SV).

% Auxiliares de traducción
traducir_complemento(pred(Adj), _, Adj) :- !.
traducir_complemento(adv(Adv), Modo, AdvTrad) :-
    !, traducir_palabra(Adv, Modo, AdvTrad).
traducir_complemento(Comp, Modo, CompTrad) :-
    traducir_sn_estructura(Comp, Modo, CompTrad).

traducir_adjetivos_concordados([], _, _, []).
traducir_adjetivos_concordados([Adj|Adjs], Genero, Numero, [AdjTrad|AdjsTrad]) :-
    traducir_adjetivo_concordancia(Adj, Genero, Numero, AdjTrad),
    traducir_adjetivos_concordados(Adjs, Genero, Numero, AdjsTrad).

traducir_sps([], _, []).
traducir_sps([SP|SPs], Modo, [SPTrad|SPsTrad]) :-
    traducir_sp(SP, Modo, SPTrad),
    traducir_sps(SPs, Modo, SPsTrad).

traducir_sp(sp(Prep, SN), Modo, Traduccion) :-
    traducir_palabra(Prep, Modo, PrepTrad),
    traducir_sn_estructura(SN, Modo, SNTrad),
    atomic_list_concat([PrepTrad, SNTrad], ' ', Traduccion).

obtener_traduccion_determinante(DetIng, Genero, Numero, DetEsp) :-
    determinante(DetEsp, DetIng, Numero, Genero, _), !.

obtener_traduccion_determinante(DetIng, _, _, DetEsp) :-
    determinante(DetEsp, DetIng, _, _, _), !.

obtener_traduccion_determinante(Det, _, _, Det).

% --------- TRADUCCIÓN DE ORACIONES MEJORADA ---------

traducir_oracion_individual(Oracion, Modo, Traducida) :-
    (traducir_por_sintagmas(Oracion, Modo, Traducida)
     ;
     traduccion_simple(Oracion, Modo, Traducida)
    ).

traducir_por_sintagmas(Tokens, Modo, Traducida) :-
    analizar_oracion(Tokens, Modo, Sujeto, SV, Resto),
    traducir_sn_estructura(Sujeto, Modo, SujetoTraducido),
    traducir_sv_estructura(SV, Modo, SVTraducido),
    traduccion_simple(Resto, Modo, RestoTraducido),
    combinar_traducciones([SujetoTraducido, SVTraducido|RestoTraducido], Traducida).

combinar_traducciones(Componentes, TokensTraducidos) :-
    atomic_list_concat(Componentes, ' ', TextoCompleto),
    atomic_list_concat(TokensTraducidos, ' ', TextoCompleto), !.

combinar_traducciones(Componentes, [TextoCompleto]) :-
    atomic_list_concat(Componentes, ' ', TextoCompleto).

traducir_lista_oraciones([], _, []).
traducir_lista_oraciones([Oracion|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_oracion_individual(Oracion, Modo, Traducida),
    traducir_lista_oraciones(Resto, Modo, RestoTrad).

unir_oraciones_traducidas(Oraciones, Texto) :-
    maplist(atomic_list_concat_space, Oraciones, OracionesStrings),
    atomic_list_concat(OracionesStrings, ' ', Texto).

atomic_list_concat_space(Lista, Texto) :-
    atomic_list_concat(Lista, ' ', Texto).

% --------- TRADUCCIÓN SIMPLE MEJORADA ---------

traducir_sn(SN, Modo, Traducido) :-
    traducir_sn_estructura(SN, Modo, Traducido), !.

traducir_sn(SN, ie, Traducido) :-
    atomic_list_concat(Palabras, ' ', SN),
    traducir_lista_palabras_con_contexto(Palabras, ie, PalabrasTraducidas),
    atomic_list_concat(PalabrasTraducidas, ' ', Traducido).

traducir_sn(SN, ei, Traducido) :-
    traducir_palabra(SN, ei, Traducido).

traducir_lista_palabras_con_contexto([], _, []).
traducir_lista_palabras_con_contexto([Palabra|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_palabra_con_contexto(Palabra, Resto, Modo, Traducida),
    traducir_lista_palabras_con_contexto(Resto, Modo, RestoTrad).

traducir_palabra_con_contexto(Palabra, RestoTokens, ie, Traduccion) :-
    es_determinante_ingles(Palabra), 
    encontrar_sustantivo_en_lista(RestoTokens, Sustantivo),
    obtener_traduccion_determinante_contextual(Palabra, Sustantivo, Traduccion), !.

traducir_palabra_con_contexto(Palabra, _, Modo, Traduccion) :-
    traducir_palabra(Palabra, Modo, Traduccion).

es_determinante_ingles('the').
es_determinante_ingles('this').
es_determinante_ingles('that').
es_determinante_ingles('these').
es_determinante_ingles('those').
es_determinante_ingles('a').
es_determinante_ingles('an').

encontrar_sustantivo_en_lista([], _) :- fail.
encontrar_sustantivo_en_lista([Token|_], Token) :-
    es_sustantivo_valido(Token), !.
encontrar_sustantivo_en_lista([_|Resto], Sustantivo) :-
    encontrar_sustantivo_en_lista(Resto, Sustantivo).

obtener_traduccion_determinante_contextual(DetIng, Sustantivo, DetEsp) :-
    (   sustantivo(_, Sustantivo, _, Numero, Genero)
    ;   sustantivo(Sustantivo, _, _, Numero, Genero)  
    ),
    determinante(DetEsp, DetIng, Numero, Genero, _), !.

obtener_traduccion_determinante_contextual(DetIng, _, DetEsp) :-
    determinante(DetEsp, DetIng, singular, masculino, _), !.

traducir_sv(SV, _, SV).

% Traducción simple mejorada con conjugación contextual
traduccion_simple([], _, []).
traduccion_simple([Token|Resto], Modo, [Traduccion|RestoTraducido]) :-
    (es_verbo(Token) ->
        % Intentar conjugar si podemos determinar persona y número
        (obtener_persona_numero_contexto(Token, Resto, Persona, Numero) ->
            conjugar_verbo(Token, Persona, Numero, Modo, Traduccion)
        ;
            traducir_palabra(Token, Modo, Traduccion)
        )
    ;
        traducir_palabra(Token, Modo, Traduccion)
    ),
    traduccion_simple(Resto, Modo, RestoTraducido).

% Intentar obtener persona y número del contexto
obtener_persona_numero_contexto(_, Tokens, Persona, Numero) :-
    encontrar_sujeto_en_contexto(Tokens, Sujeto),
    persona_numero_sujeto(Sujeto, Persona, Numero), !.

obtener_persona_numero_contexto(_, _, 'tercera', 'singular'). % Default

% Buscar un sujeto plausible en los tokens siguientes
encontrar_sujeto_en_contexto(Tokens, Sujeto) :-
    sn(Tokens, Sujeto, _), !.
encontrar_sujeto_en_contexto([Token|_], Token) :-
    es_pronombre(Token), !.
encontrar_sujeto_en_contexto([_|Resto], Sujeto) :-
    encontrar_sujeto_en_contexto(Resto, Sujeto).

% --------- TRADUCCIÓN DE PALABRAS ---------

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

% --------- FUNCIÓN PRINCIPAL DE TRADUCCIÓN ---------

traducir(Texto, Modo, Traduccion) :-
    tokenizar_entrada(Texto, Tokens),
    dividir_por_delimitadores(Tokens, Oraciones),
    traducir_lista_oraciones(Oraciones, Modo, OracionesTraducidas),
    unir_oraciones_traducidas(OracionesTraducidas, Traduccion).

% Funciones de prueba para conjugación
probar_conjugacion_es_en(VerboEsp, Sujeto, VerboIng) :-
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_es_en(VerboEsp, Persona, Numero, VerboIng).

probar_conjugacion_en_es(VerboIng, Sujeto, VerboEsp) :-
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_en_es(VerboIng, Persona, Numero, VerboEsp).

probar_conjugacion_modo(Verbo, Sujeto, Modo, Conjugado) :-
    persona_numero_sujeto(Sujeto, Persona, Numero),
    conjugar_verbo(Verbo, Persona, Numero, Modo, Conjugado).

% --------- FUNCIONES AUXILIARES ---------

traducir_lista_palabras_simple([], _, []).
traducir_lista_palabras_simple([Palabra|Resto], Modo, [Traducida|RestoTrad]) :-
    traducir_palabra(Palabra, Modo, Traducida),
    traducir_lista_palabras_simple(Resto, Modo, RestoTrad).
