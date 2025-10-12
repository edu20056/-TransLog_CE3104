:- consult('Logic.pl').

tranlog_ie :-
    nl,
    writeln('TranLogIE_______________________________'),
    writeln('[ English -> Spanish ]'),
    writeln('Type text in english (empty line to end)'),
    nl,
    start_translation_mode(ie).

tranlog_ei :-
    nl,
    writeln('TranLogEI___________________________________________'),
    writeln('[ Espanol -> Ingles ]'),
    writeln('Escriba texto en espanol (linea vacia para terminar)'),
    start_translation_mode(ei).

start_translation_mode(Mode) :-
    nl,
    show_prompt(Mode),
    read_input(Input),
    process_translation_input(Input, Mode).

show_prompt(ei) :- writeln('ES > ').
show_prompt(ie) :- writeln('EN > ').

read_input(Input) :-
    % Lee input escrito por el usuario
    % Recomendado por IA para manejo flexible de input
    % Alternativa para 'read' para aceptar diversos formatos de textp

    read_line_to_codes(user_input, Codes),
    atom_codes(Input, Codes).

process_translation_input('', Mode) :-
    (Mode = ei -> writeln('Gracias por usar TranLogEI')
    ; Mode = ie -> writeln('Thanks for using TranLogIE')
    ),
    nl.

process_translation_input(Input, Mode) :-
    tokenize_input(Input, Tokens),
    nl,
    display_results(Input, Tokens, Mode),
    start_translation_mode(Mode).

display_results(Input, Tokens, ei) :-
    format('Input: ~w~n', [Input]),
    format('Tokens: ~w~n', [Tokens]).

display_results(Input, Tokens, ie) :-
    format('Input: ~w~n', [Input]),
    format('Tokens: ~w~n', [Tokens]).
