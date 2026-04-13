unit morpionIHM;

interface

uses
classes,sysutils,morpionlogicAmical,GestionEcran,crt,morpionParametre;

procedure TeteMenu();
procedure JoueurCommence(var J : Joueur);
procedure JoueurCommenceIA(var tJ : Joueur ;var J : Joueur;var Jia : Joueur);
procedure AfficherJeu(J : Joueur;  scoreX,scoreO : integer);
procedure FinManche(scoreX,scoreO,compteurPartie : integer);
procedure point();

procedure RetourMenuPrincipal();
implementation

procedure TeteMenu();
begin
  writeln('=================================');
  writeln('         JEU DU MORPION          ');
  writeln('=================================');
  writeln;
end;

procedure JoueurCommence(var J : Joueur);
begin
effacerEcran;
TeteMenu;
writeln('Qui commence ? X/O ?');
readln(J);

end;

procedure DefIa(var Jia : Joueur; var J : Joueur);
begin
if J=X then  
  Jia:= O
else if J = O then
  Jia:=X;
end;

procedure JoueurCommenceIA(var Tj : Joueur; var J : Joueur;var Jia : Joueur);
var
choix,n : integer;
begin
effacerEcran;
TeteMenu;
writeln('Vous souhaitez etre X/O ?');
readln(J);
DefIa(Jia,J);
TeteMenu;
writeln('Qui commence ?');
writeln('1/ Vous');
writeln('2/ IA');
writeln('3/Au hasard');
writeln;
writeln('Votre choix : ');
readln(choix);
case choix of 
1: Tj := J;
2: Tj := Jia;
3:
begin
n := Random(10)+1; 
if n > 5 then
Tj:=J else Tj:=Jia; 
end;

else
writeln('ERREUR inserez une valeur valable, cliquez sur ENTREE pour continuer');
readln;
exit;
end;
end;



procedure AfficherScore(ScoreX,ScoreO : integer);
begin
  write('Joueur X : ');
  writeln(ScoreX);
  write('Joueur O : ');
  writeln(ScoreO);
end;

procedure AfficherCase(c: char);
begin

  if c = 'X' then
  begin
    TextColor(GetCouleurX());
    write(c);
  end
  else if c = 'O' then
  begin
    TextColor(GetCouleurO());
    write(c);
  end
  else
  begin
    TextColor(White);
    write(c);
  end;

  TextColor(White); { remet la couleur normale }
end;
procedure AfficherTableauSJ();
begin
   write('   '); AfficherCase(grille[1][1]); write(' | ');
  AfficherCase(grille[1][2]); write(' | ');
  AfficherCase(grille[1][3]); writeln;

  writeln('  -----------');

  write('   '); AfficherCase(grille[2][1]); write(' | ');
  AfficherCase(grille[2][2]); write(' | ');
  AfficherCase(grille[2][3]); writeln;

  writeln('  -----------');

  write('   '); AfficherCase(grille[3][1]); write(' | ');
  AfficherCase(grille[3][2]); write(' | ');
  AfficherCase(grille[3][3]); writeln;

  TextColor(White);
  writeln;
  writeln;
end;




procedure AfficherTableauCouleur(J : Joueur);
begin
  writeln('   C''est au joueur ',GetJoueur(J));
  writeln('   ');
  write('   '); AfficherCase(grille[1][1]); write(' | ');
  AfficherCase(grille[1][2]); write(' | ');
  AfficherCase(grille[1][3]); writeln;

  writeln('  -----------');

  write('   '); AfficherCase(grille[2][1]); write(' | ');
  AfficherCase(grille[2][2]); write(' | ');
  AfficherCase(grille[2][3]); writeln;

  writeln('  -----------');

  write('   '); AfficherCase(grille[3][1]); write(' | ');
  AfficherCase(grille[3][2]); write(' | ');
  AfficherCase(grille[3][3]); writeln;

  TextColor(White);
  writeln;
  writeln;
end;





procedure AfficherJeu(J : Joueur;  scoreX,scoreO : integer);
begin
  TeteMenu;
  AfficherTableauCouleur(J);
  AfficherScore(scoreX,scoreO);
end;



procedure FinManche(scoreX,scoreO,compteurPartie : integer);
begin
  effacerEcran;
  TeteMenu;
  AfficherTableauSJ();
  AfficherScore(scoreX,scoreO);
  textcolor(GetCouleurX());
    if scoreX > scoreO then 
      writeln('Joueur X est en tete !')
        else if scoreX < scoreO then 
        begin
          textcolor(GetCouleurO());
          writeln('Joueur O est en tete !');
        end
          else 
          begin
            textcolor(Blue);
            writeln('Vous êtes à egalite !');
          end;
  textcolor(White);
    writeln('C''est votre ',compteurPartie,'ieme manche !');
    writeln('Cliquer sur ENTREE pour continuer');
    readln;
end;

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

procedure RetourMenuPrincipal();
begin
  effacerEcran;
  TeteMenu;
  write('Retour au menu');
  point();
end;






end.