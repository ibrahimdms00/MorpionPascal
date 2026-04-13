unit morpionlogicAmical;


interface
// -----------------------
uses 
classes,sysutils,crt;
type
TabJeu = Array[1..3] of array[1..3] of char;
Joueur = (X,O);
var
grille: TabJeu;  

//----------Procedure/Fonctions-----------------

procedure VainqueurProc(var grille : TabJeu; var Vainqueur,ScoreX,ScoreO : integer) ;
procedure InitialiserTab(var grille : TabJeu);
function GrillePleine(t1: TabJeu):boolean;
procedure AnnoncerGagnant(Victoire: integer);
procedure ModifCaseVoulu(choix : integer; var grille : TabJeu; NewValue : char);
procedure JoueurSuivant(var J : Joueur);
function GetJoueur(J : Joueur): char;
procedure InitialiserScore(var scoreX,scoreO : integer);
procedure ChoixComforme(var ValeurComforme : Boolean; grille : TabJeu; choix,i,j : integer);
function ChoixComformeFunc(choix : integer; grille : TabJeu): boolean;

implementation

procedure ChoixComforme(var ValeurComforme : Boolean; grille : TabJeu; choix,i,j : integer);
begin
  if (choix < 1) or (choix > 9) then
    ValeurComforme:=False
      else if (grille[i][j] = 'X') or (grille[i][j] = 'O') then
        ValeurComforme:=False
      else ValeurComforme := True;    
      exit;
end;

function ChoixComformeFunc(choix : integer; grille : TabJeu): boolean;
var
  i,j : integer;
  ValeurComforme : boolean;
begin
ChoixComformeFunc := True;
case choix of
  1 : begin i:=1; j:=1; end;
  2 : begin i:=1; j:=2; end;
  3 : begin i:=1; j:=3; end;
  4 : begin i:=2; j:=1; end;
  5 : begin i:=2; j:=2; end;
  6 : begin i:=2; j:=3; end;
  7 : begin i:=3; j:=1; end;
  8 : begin i:=3; j:=2; end;
  9 : begin i:=3; j:=3; end;
end;
if (grille[i][j] = 'X') or (grille[i][j] = 'O') then
  ChoixComformeFunc := False;

end;


function GetJoueur(J : Joueur): char;
begin
  if J = X then
    GetJoueur:='X'
  else if J = O then
    GetJoueur:='O';
end;


procedure JoueurSuivant(var J : Joueur);
begin
  if J = X then
    J:=O
  else if J = O then
    J:=X;
end;



function GrillePleine(t1 : TabJeu): boolean;
var
  i, j: integer;
begin
  GrillePleine := True;  // on suppose pleine

  for i := 1 to 3 do
    for j := 1 to 3 do
      if (t1[i][j] <> 'X') and (t1[i][j] <> 'O') then
        GrillePleine := False;  // s'il reste un chiffre, ce n'est pas plein
end;




procedure InitialiserTab(var grille : tabJeu);
begin
grille[1][1] := '1';
grille[1][2] := '2';
grille[1][3] := '3';
grille[2][1] := '4';
grille[2][2] := '5';
grille[2][3] := '6';
grille[3][1] := '7';
grille[3][2] := '8';
grille[3][3] := '9';
end;



procedure VainqueurProc(var grille : TabJeu; var Vainqueur,ScoreX,ScoreO : integer) ;
var
i,j : integer;


begin
Vainqueur:= -1;


for j := 1 to 3 do 
  begin
  // SI XXX ou OOO -
    i:=1;
    if (grille[j][1] = grille[j][2]) and (grille[j][2] = grille[j][3]) and (grille[j][1] in ['X','O']) then 
    begin
      if grille[j][1] = 'X' then
      begin
        ScoreX:= ScoreX + 1;
        Vainqueur:= 1 ;
        exit;
      end
      else if grille[j][1] = 'O' then
      begin
        ScoreO:= ScoreO + 1;
        Vainqueur := 0 ;
        exit;
      end;
    end;
  /// SI XXX ou OOO |
  if (grille[i][j] = grille[i+1][j]) and (grille[i+1][j] = grille[i+2][j]) then
    begin
      if grille[i+1][j] = 'X' then
      begin
        ScoreX:= ScoreX + 1;
        Vainqueur:= 1 ;
        exit;
      end
      else if grille[i+1][j] = 'O' then
      begin
        ScoreO := ScoreO + 1;
        Vainqueur := 0 ;
        exit;
      end;
    end;
  end;
/// SI XXX ou 000 \
j:=1;i:=1;
  if (grille[1][1] = grille[2][2]) and (grille[2][2] = grille[3][3]) then
      begin
        if grille[j][i] = 'X' then
        begin
          ScoreX:= ScoreX + 1;
          Vainqueur:= 1 ;
          exit;
        end
        else if grille[j][i] = 'O' then
        begin
          ScoreO:= ScoreO + 1;
          Vainqueur := 0 ;
          exit;
        end;
      end;
      
/// SI XXX ou 000 /
if (grille[3][1] = grille[2][2]) and (grille[2][2] = grille[1][3]) then
    begin
      if grille[3][1] = 'X' then
      begin
        ScoreX:= ScoreX + 1;
        Vainqueur:= 1 ;
        exit;
      end
      else if grille[3][1] = 'O' then
      begin
        ScoreO:= ScoreO + 1;
        Vainqueur := 0 ;
        exit;
      end;
    end;
end;

procedure AnnoncerGagnant(Victoire: integer);
begin
  
  if Victoire = 1 then
  write('Le Joueur X a gagné !')
  else if Victoire = 0 then
  write('Le joueur O a gagné !')
  else if Victoire = -1 then
  write('Aucun gagnant')
  else
  write('ERREUR');
end;


function grillePos(grille : TabJeu; i, j: integer): char;
begin
  if grille[i][j] = 'X' then
  begin
    TextColor(Red);
    grillePos := 'X';
  end
  else if grille[i][j] = 'O' then
  begin
    TextColor(LightBlue);  //  Couleur différente pour O
    grillePos := 'O';
  end
  else
  begin
    TextColor(White);   // Couleur pour les cases vides
    grillePos := grille[i][j];
  end;
end;


procedure ModifCaseVoulu(choix : integer; var grille : TabJeu; NewValue : char);
var
ValeurComforme : boolean;
i,j : integer;
begin
ValeurComforme:=True;

case choix of
  1 : 
  begin
  i:=1;j:=1;
  ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
    grille[1][1]:= NewValue
    else exit;
  end;
  
  2 :
  begin
    i:=1;j:=2;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[1][2]:= NewValue;
  end;

  3 :
  begin
    i:=1;j:=3;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[1][3]:= NewValue;
  end;

  4 : 
  begin
    i:=2;j:=1;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[2][1]:= NewValue;
  end;

  5 : 
  begin
    i:=2;j:=2;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[2][2]:= NewValue;
  end;
  6 : 
  begin
    i:=2;j:=3;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[2][3]:= NewValue;
  end;

  7 :
  begin
    i:=3;j:=1;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[3][1]:= NewValue;
  end;

  8 : 
  begin
    i:=3;j:=2;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[3][2]:= NewValue;
  end;

  9 : 
  begin
    i:=3;j:=3;
    ChoixComforme(ValeurComforme,grille,choix,i,j);
    if ValeurComforme then
      grille[3][3]:= NewValue;
  end;
end;

end;


procedure InitialiserScore(var scoreX,scoreO : integer);
begin
  scoreX:=0;
  scoreO:=0;
end;



end.

