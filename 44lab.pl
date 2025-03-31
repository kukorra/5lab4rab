% Претенденты:
% A, B, C, D, E, F, G, H

% Обязанности:
% biologist, hydrologist, meteorologist, radio operator, mechanic, doctor

% Правила для проверки ограничений:
% F не может ехать без B
cannot_go_together(f, b).
% D не может ехать без C и H
cannot_go_together(d, c).
cannot_go_together(d, h).
% C не может ехать с G
cannot_go_together(c, g).
% A не может ехать с B
cannot_go_together(a, b).

% Определим возможные профессии для каждого кандидата
biologist(e).
biologist(g).

hydrologist(b).
hydrologist(f).

meteorologist(f).
meteorologist(g).

radio_operator(c).
radio_operator(d).

mechanic(c).
mechanic(h).

doctor(a).
doctor(d).

% Правила для назначения обязанностей с учетом ограничений
assign_biologist(Biologist) :- biologist(Biologist).
assign_hydrologist(Hydrologist) :- hydrologist(Hydrologist).
assign_meteorologist(Meteorologist) :- meteorologist(Meteorologist).
assign_radio_operator(RadioOperator) :- radio_operator(RadioOperator).
assign_mechanic(Mechanic) :- mechanic(Mechanic).
assign_doctor(Doctor) :- doctor(Doctor).

% Правила для проверки, не нарушены ли ограничения
valid_assignment(Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor) :-
    % Проверка на уникальность
    all_unique([Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor]),
    % Проверка ограничений
    not(cannot_go_together(Biologist, Hydrologist)),
    not(cannot_go_together(Biologist, Meteorologist)),
    not(cannot_go_together(Biologist, RadioOperator)),
    not(cannot_go_together(Biologist, Mechanic)),
    not(cannot_go_together(Biologist, Doctor)),
    not(cannot_go_together(Hydrologist, Meteorologist)),
    not(cannot_go_together(Hydrologist, RadioOperator)),
    not(cannot_go_together(Hydrologist, Mechanic)),
    not(cannot_go_together(Hydrologist, Doctor)),
    not(cannot_go_together(Meteorologist, RadioOperator)),
    not(cannot_go_together(Meteorologist, Mechanic)),
    not(cannot_go_together(Meteorologist, Doctor)),
    not(cannot_go_together(RadioOperator, Mechanic)),
    not(cannot_go_together(RadioOperator, Doctor)),
    not(cannot_go_together(Mechanic, Doctor)).

% Правило для проверки уникальности значений (чтобы ни один кандидат не был выбран дважды)
all_unique([]).
all_unique([H|T]) :-
    not(member(H, T)),
    all_unique(T).

% Стартовая процедура
start :-
    assign_biologist(Biologist),
    assign_hydrologist(Hydrologist),
    assign_meteorologist(Meteorologist),
    assign_radio_operator(RadioOperator),
    assign_mechanic(Mechanic),
    assign_doctor(Doctor),
    valid_assignment(Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor),
    write('Решение: '), nl,
    write('Биолог: '), write(Biologist), nl,
    write('Гидролог: '), write(Hydrologist), nl,
    write('Синоптик: '), write(Meteorologist), nl,
    write('Радист: '), write(RadioOperator), nl,
    write('Механик: '), write(Mechanic), nl,
    write('Врач: '), write(Doctor), nl.
