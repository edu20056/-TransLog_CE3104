tokenize_input(Input, Tokens) :-
    % Convierte Input a lista de tokens (palabras + puntuacion)

    % Conversion a minuscula y separado por espacios
    downcase_atom(Input, LowercaseLine),
    atomic_list_concat(WordAtoms, ' ', LowercaseLine),
    
    maplist(split_punctuation, WordAtoms, WordLists),
    flatten(WordLists, FilteredTokens),
    
    exclude(=(''), FilteredTokens, Tokens).

split_punctuation(Word, Tokens) :-
    atom_chars(Word, Characters),
    separate_characters(Characters, [], Tokens).

separate_characters([], CurrentWord, [FinalWord]) :-
    (CurrentWord = [] -> 
        FinalWord = ''
    ; 
        atom_chars(FinalWord, CurrentWord)
    ).

separate_characters([Char|Rest], CurrentWord, Tokens) :-
    (is_punctuation(Char) ->
        (CurrentWord = [] ->
            atom_chars(PunctuationToken, [Char]),
            separate_characters(Rest, [], RemainingTokens),
            Tokens = [PunctuationToken|RemainingTokens]
        ;
            atom_chars(WordToken, CurrentWord),
            atom_chars(PunctuationToken, [Char]),
            separate_characters(Rest, [], RemainingTokens),
            Tokens = [WordToken, PunctuationToken|RemainingTokens]
        )
    ;
        append(CurrentWord, [Char], NewWord),
        separate_characters(Rest, NewWord, Tokens)
    ).

is_punctuation(Char) :-
    member(Char, [',', '.', ';', ':', '!', '?', '¿', '¡', '(', ')', '[', ']', '{', '}']).

exclude(_, [], []).
exclude(Predicate, [X|Xs], Filtered) :-
    (call(Predicate, X) ->
        exclude(Predicate, Xs, Filtered)
    ;
        Filtered = [X|FilteredRest],
        exclude(Predicate, Xs, FilteredRest)
    ).
