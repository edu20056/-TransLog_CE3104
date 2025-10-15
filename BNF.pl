:- encoding(utf8).
:- consult('Logic.pl').
:- consult('BD1.pl').

% ==========================
% INTERFAZ
% ==========================

tranlog_ie :-
    nl,
    writeln('TranLogIE___________________________________________'),
    writeln('[ English -> Spanish ]'),
    writeln('Type text in english (empty line to end)'),
    nl,
    start_translation_mode(ie).

tranlog_ei :-
    nl,
    writeln('TranLogEI___________________________________________'),
    writeln('[ Español -> Inglés ]'),
    writeln('Escriba texto en español (línea vacía para terminar)'),
    start_translation_mode(ei).

% ==========================
% MODO DE TRADUCCIÓN
% ==========================

start_translation_mode(Mode) :-
    nl,
    show_prompt(Mode),
    read_input(Input),
    process_translation_input(Input, Mode).

show_prompt(ei) :- write('ES > ').
show_prompt(ie) :- write('EN > ').

read_input(Input) :-
    read_line_to_codes(user_input, Codes),
    atom_codes(Input, Codes).

process_translation_input('', Mode) :-
    ( Mode = ei -> writeln('Gracias por usar TranLogEI')
    ; Mode = ie -> writeln('Thanks for using TranLogIE')
    ),
    nl.

process_translation_input(Input, Mode) :-
    tokenize_input(Input, Tokens),
    nl,
    display_results(Input, Tokens, Mode),
    start_translation_mode(Mode).

% ==========================
% MOSTRAR RESULTADOS
% ==========================

display_results(Input, Tokens, ei) :-
    format('Entrada: ~w~n', [Input]),
    format('Tokens: ~w~n', [Tokens]),
    translate_tokens_ei(Tokens, Translation),
    atomic_list_concat(Translation, ' ', Text),
    format('Traducción: ~w~n', [Text]).

display_results(Input, Tokens, ie) :-
    format('Input: ~w~n', [Input]),
    format('Tokens: ~w~n', [Tokens]),
    translate_tokens_ie(Tokens, Translation),
    atomic_list_concat(Translation, ' ', Text),
    format('Translation: ~w~n', [Text]).

% ==========================
% TRADUCCIÓN CON FRASES
% ==========================

% Español -> Inglés
translate_tokens_ei([], []).
translate_tokens_ei([H1,H2|T], [Eng|Rest]) :-
    atomic_list_concat([H1,H2], ' ', Phrase),
    interjeccion(Phrase, Eng), !,
    translate_tokens_ei(T, Rest).
translate_tokens_ei([H|T], [Eng|Rest]) :-
    interjeccion(H, Eng), !,
    translate_tokens_ei(T, Rest).
translate_tokens_ei([H|T], [H|Rest]) :-
    translate_tokens_ei(T, Rest).

% Inglés -> Español
translate_tokens_ie([], []).
translate_tokens_ie([H1,H2|T], [Esp|Rest]) :-
    atomic_list_concat([H1,H2], ' ', Phrase),
    interjeccion(Esp, Phrase), !,
    translate_tokens_ie(T, Rest).
translate_tokens_ie([H|T], [Esp|Rest]) :-
    interjeccion(Esp, H), !,
    translate_tokens_ie(T, Rest).
translate_tokens_ie([H|T], [H|Rest]) :-
    translate_tokens_ie(T, Rest).
