ojciec(jan, anna).
ojciec(jan, kasia).
matka(maria, zuzia).
matka(maria, piotr).
dziadek(staś, anna).
dziadek(mirek, piotr).
siostra(anna,piotr).
wiek(jan, 40).
wiek(anna, 18).
wiek(maria, 37).
wiek(staś, 66).
wiek(zuzia, 21).
:- dynamic uczen/1. %definiujemy, że predykat uczen/1 jest dynamiczny, co pozwala na jego modyfikację w trakcie działania programu
uczen(jan).
uczen(monika).


rodzic(X, Y) :- ojciec(X, Y).
rodzic(X, Y) :- matka(X, Y).
dziadkowie(Z,Y) :- dziadek(Z,Y).
rodzeństwo(A,B) :- siostra(A,B).
jest_rodzicem(X) :- ojciec(X,_).
jest_rodzicem(X) :- matka(X,_).
czyj_rodzic(X, ListaDzieci) :-
    findall(Dziecko, rodzic(X, Dziecko), ListaDzieci).
rodzic_cut(X, Y) :- matka(X, Y), !.
rodzic_cut(X, Y) :- ojciec(X, Y), !.
rodzic_bez_cut(X, Y) :- matka(X, Y).
rodzic_bez_cut(X, Y) :- ojciec(X, Y).
starszy(X, Y) :-
    wiek(X, WiekX),
    wiek(Y, WiekY),
    WiekX > WiekY.
wiek_wiecej_niz(N) :-
    wiek(X, Wiek),
    Wiek > N,               % Sprawdzamy, czy wiek jest większy niż N
    write(X),               % Wypisujemy imię osoby
    nl,                     % Nowa linia po każdym wypisanym imieniu
    fail.                   % Zmusza do próby z następnym faktem