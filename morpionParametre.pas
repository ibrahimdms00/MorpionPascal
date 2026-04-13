unit morpionParametre;
interface
uses GestionEcran,crt; 
var
couleurX,couleurO : integer; 
procedure InitialiserCouleur();
function GetCouleurO() : integer;
function GetCouleurX() : integer;
procedure Parametre();
procedure RegleJeu();
procedure HistoireJeu();


implementation

procedure point();
var
i : integer;
j : string;
begin
j:='.';
  for i:=0 to 5 do
  begin
    j:='.';
    write(j);
    attendre(500);
  end;
end;



procedure TeteMenu();
begin
  writeln('=================================');
  writeln('         JEU DU MORPION          ');
  writeln('=================================');
  writeln;
end;


procedure ModifierCouleur2(choix : integer;var couleurX,couleurO : integer);
var
couleur : integer;
begin
  TextColor(0); writeln('0/ Noir');
  TextColor(1); writeln('1/ Bleu fonce');
  TextColor(2); writeln('2/ Vert');
  TextColor(3); writeln('3/ Cyan');
  TextColor(4); writeln('4/ Rouge');
  TextColor(5); writeln('5/ Magenta');
  TextColor(6); writeln('6/ Marron');
  TextColor(7); writeln('7/ Gris clair');
  TextColor(8); writeln('8/ Gris fonce');
  TextColor(9); writeln('9/ Bleu clair');
  TextColor(10); writeln('10/ Vert clair');
  TextColor(11); writeln('11/ Cyan clair');
  TextColor(12); writeln('12/ Rouge clair');
  TextColor(13); writeln('13/ Magenta clair');
  TextColor(14); writeln('14/ Jaune');
  TextColor(15); writeln('15/ Blanc');
  readln(couleur);
  if choix = 1 then 
  couleurX:=couleur
  else if choix = 2 then
  couleurO:=couleur;
end;

procedure ModifierCouleur1(var couleurX,couleurO : integer);
var
choix : integer;
begin
  effacerEcran;
  TeteMenu;
  writeln('Vous souhaitez modifier pour X ou O ?');
  writeln('1/ X');
  writeln('2/ O');
  readln(choix);
  ModifierCouleur2(choix,couleurX,couleurO);

end;



procedure InitialiserCouleur();
begin
  couleurX:=4;
  couleurO:=2;
end;


function GetCouleurO() : integer;
begin
  GetCouleurO:= couleurO;
end;

function GetCouleurX() : integer;
begin
  GetCouleurX:= couleurX;
end;


procedure Parametre();
var
choix : integer;
begin
  effacerEcran;
  TeteMenu;
  writeln('Que souhaitez vous faire ? :');
  writeln('1/ Modifier les couleurs');
  writeln('2/ Initialiser les couleurs');
  writeln('3/ Retour au menu');
  readln(choix);
  case choix of 
  1 : ModifierCouleur1(couleurX,couleurO);
  2 : 
  begin
  effacerEcran;
  TeteMenu;
  InitialiserCouleur;
  write('Initialisation des couleurs a Rouge et Vert');
  point;
  writeln('Initialisation réussie !');
  attendre(1000);
  end;
  3 : exit;
end;
end;

procedure RegleJeu();
begin
TeteMenu;
writeln('REGLES DU JEU MORPION');
writeln('---------------------');
writeln('');
writeln('Le morpion se joue a deux joueurs.');
writeln('');
writeln('Le jeu se joue sur une grille');
writeln('de 3 cases par 3 cases.');
writeln('');
write('Un joueur utilise le symbole ');
TextColor(GetCouleurX());
writeln('X');
TextColor(white);
write('Un joueur utilise le symbole ');
TextColor(GetCouleurO());
writeln('O');
TextColor(white);
writeln('');
writeln('Les joueurs jouent chacun leur tour.');
writeln('A chaque tour, un joueur place');
writeln('son symbole dans une case vide.');
writeln('');
writeln('Le premier joueur qui aligne');
writeln('trois symboles identiques');
writeln('horizontalement, verticalement');
writeln('ou en diagonale gagne la partie.');
writeln('');
writeln('Si toutes les cases sont remplies');
writeln('et qu aucun joueur n a aligne');
writeln('trois symboles, la partie est');
writeln('declaree egale.');
writeln('');
writeln('Bonne chance et bon jeu !');
writeln('');
writeln('Appuyez sur une ENTREE pour revenir au menu');
readln;


end;


procedure HistoireJeu();
begin
TeteMenu;
  writeln('HISTOIRE DU MORPION');
writeln('-------------------');
writeln('');
writeln('Le morpion, aussi appele tic-tac-toe en anglais,');
writeln('est un jeu tres ancien.');
writeln('');
writeln('Des grilles similaires ont ete retrouvees dans');
writeln('des vestiges de l Empire romain, notamment');
writeln('a Rome et a Pompei.');
writeln('');
writeln('Les Romains jouaient a un jeu appele');
writeln('Terni Lapilli (trois cailloux).');
writeln('Chaque joueur avait trois pions qu il');
writeln('deplacait jusqu a en aligner trois.');
writeln('');
writeln('Avec le temps, le jeu a evolue vers');
writeln('la version actuelle avec placement');
writeln('progressif des symboles X et O.');
writeln('');
writeln('Les mathematiciens ont demontre que');
writeln('si les deux joueurs jouent parfaitement,');
writeln('la partie se termine toujours par une egalite.');
writeln('');
writeln('Le morpion est souvent utilise pour');
writeln('enseigner la logique et la programmation.');
writeln('');
writeln('Malgre sa simplicite, ce jeu existe');
writeln('depuis plus de 2000 ans.');
writeln('');
writeln('Appuyez sur une ENTREE pour revenir au menu');
readln;
end;



end.