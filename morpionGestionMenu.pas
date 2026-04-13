unit morpionGestionMenu;

interface

uses
classes,sysutils,morpionIHM,morpionGestionJeuAmical,morpionGestionMenuIA,morpionParametre,morpionGestionJeuIA;


procedure LancementJeu(); 
procedure Menu(); 
implementation
uses 
GestionEcran,crt;




procedure Jeu();
var
choix : integer;
begin
  effacerEcran;
    TeteMenu;
    TextColor(White);
    writeln('---------------------------------');
    writeln('               JEU               ');
    writeln('---------------------------------');
    writeln;

    { Apparition progressive simple }
    writeln('1/ Jouer en local');
    attendre(80);
    writeln('2/ Jouer contre l''IA');
    attendre(80);
    write('Choix : ');
    readln(choix);
    case choix of 
    1 : JeuAmical;
    2 : JeuIa;
end;

end;
procedure Menu();

var
  choix : integer;
  sortie : boolean;
  i : integer;

begin
  sortie := true;
  InitialiserCouleur();

  while sortie do
  begin
    effacerEcran;
    TeteMenu;

    TextColor(White);
    writeln('---------------------------------');
    writeln('              MENU               ');
    writeln('---------------------------------');
    writeln;

    { Apparition progressive simple }
    writeln('1/ Jouer');
    attendre(80);
    writeln('2/ Statistiques');
    attendre(80);
    writeln('3/ Parametres');
    attendre(80);
    writeln('4/ Regle du Jeu');
    attendre(80);
    writeln('5/ Histoire du Jeu');
    attendre(80);
    writeln('6/ Quitter');
    writeln;

    write('Choix : ');
    readln(choix);

    case choix of
      1 : Jeu;
      2 : Stat;
      3 : Parametre;
      4 : RegleJeu;
      5 : HistoireJeu;
      6 : sortie := false;
    else
      begin
        writeln;
        TextColor(LightRed);
        writeln('Choix invalide.');
        TextColor(White);
        attendre(800);
      end;
    end;
  end;

  { Sortie sobre }
  effacerEcran;
  writeln('Fermeture du jeu...');
  attendre(600);
  effacerEcran;
end;


procedure Intro();

var
  i : integer;
  titre : string;

begin
  effacerEcran;

  { Apparition progressive du titre }
  titre := 'JEU DU MORPION';

  TextColor(White);
  for i := 1 to length(titre) do
  begin
    write(titre[i]);
    attendre(70);
  end;

  attendre(400);
  writeln;
  writeln('----------------------');
  attendre(300);
  writeln;

  TextColor(LightGray);
  writeln('Un jeu simple de strategie.');
  attendre(400);
  writeln('Deux joueurs. Une grille 3x3.');
  attendre(400);
  writeln('Aligner 3 symboles pour gagner.');
  attendre(600);

  writeln;
  TextColor(White);
  writeln('Appuyez sur ENTREE pour continuer...');
  readln;

  effacerEcran;
end;


procedure LancementJeu();
begin
  changerTailleConsole(50,50);
  effacerEcran;
  Intro;
  effacerEcran;
  Menu();
end;


end.
