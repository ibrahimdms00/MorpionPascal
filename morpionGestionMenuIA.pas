unit morpionGestionMenuIA;
interface

procedure JeuIa();

implementation
uses morpionIHM,GestionEcran,morpionGestionJeuIA;

procedure AfficherMenuIA(var difficulte : integer);
begin
  effacerEcran;
  TeteMenu;
  writeln('IA');
  writeln('Voici les difficultés : ');
  writeln('1 / Facile');
  writeln('2 / Moyen');
  writeln('3 / Difficile');
  writeln('4 / Impossible');
  writeln('Quelle difficulté souhaitez vous ? : ');
  readln(difficulte);
end;


procedure JeuIa();
var 
difficulte : integer;
begin
AfficherMenuIA(difficulte);
case difficulte of 
1 : FacileMode;
2 : MoyenMode;
3 : DifficileMode;
4 : ImpossibleMode;
else
begin
  writeln('Fausse valeur reessayer');
  readln;
end
end;
end;


end.