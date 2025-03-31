% �����������:
% A, B, C, D, E, F, G, H

% �����������:
% biologist, hydrologist, meteorologist, radio operator, mechanic, doctor

% ������� ��� �������� �����������:
% F �� ����� ����� ��� B
cannot_go_together(f, b).
% D �� ����� ����� ��� C � H
cannot_go_together(d, c).
cannot_go_together(d, h).
% C �� ����� ����� � G
cannot_go_together(c, g).
% A �� ����� ����� � B
cannot_go_together(a, b).

% ��������� ��������� ��������� ��� ������� ���������
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

% ������� ��� ���������� ������������ � ������ �����������
assign_biologist(Biologist) :- biologist(Biologist).
assign_hydrologist(Hydrologist) :- hydrologist(Hydrologist).
assign_meteorologist(Meteorologist) :- meteorologist(Meteorologist).
assign_radio_operator(RadioOperator) :- radio_operator(RadioOperator).
assign_mechanic(Mechanic) :- mechanic(Mechanic).
assign_doctor(Doctor) :- doctor(Doctor).

% ������� ��� ��������, �� �������� �� �����������
valid_assignment(Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor) :-
    % �������� �� ������������
    all_unique([Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor]),
    % �������� �����������
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

% ������� ��� �������� ������������ �������� (����� �� ���� �������� �� ��� ������ ������)
all_unique([]).
all_unique([H|T]) :-
    not(member(H, T)),
    all_unique(T).

% ��������� ���������
start :-
    assign_biologist(Biologist),
    assign_hydrologist(Hydrologist),
    assign_meteorologist(Meteorologist),
    assign_radio_operator(RadioOperator),
    assign_mechanic(Mechanic),
    assign_doctor(Doctor),
    valid_assignment(Biologist, Hydrologist, Meteorologist, RadioOperator, Mechanic, Doctor),
    write('�������: '), nl,
    write('������: '), write(Biologist), nl,
    write('��������: '), write(Hydrologist), nl,
    write('��������: '), write(Meteorologist), nl,
    write('������: '), write(RadioOperator), nl,
    write('�������: '), write(Mechanic), nl,
    write('����: '), write(Doctor), nl.
