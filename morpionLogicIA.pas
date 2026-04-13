unit morpionLogicIA;

interface
uses morpionlogicAmical;
procedure IaJouerFacile(var n : integer);
procedure ModifCaseVouluIA(var grille : TabJeu; choix : integer ; var ValeurComforme : boolean;Jia : Joueur);
procedure IaJoueMoyen(Tj,Jia : Joueur; var grille : TabJeu);
procedure IaJoueDifficile(Tj,Jia : Joueur; var grille : TabJeu); 
procedure IaJoueImpossible(Tj,Jia : Joueur; var grille : TabJeu);

implementation

procedure ModifCaseVouluIA(var grille : TabJeu; choix : integer; var ValeurComforme : boolean;Jia : Joueur);
var
  i,j : integer;
begin
ValeurComforme := False;
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
else
  exit;
end;

if (grille[i][j] <> 'X') and (grille[i][j] <> 'O') then
begin
  grille[i][j]:= GetJoueur(Jia);
  ValeurComforme := True;
end
else
begin
  exit;
end;

end;


procedure IaJouerFacile(var n : integer);
begin
  randomize;
  n := Random(9)+1;   // entre 1 et 9
end;

procedure BloquerVictoire(Tj :Joueur;Jia : Joueur ; var grille : TabJeu);
var
j : integer;

begin
for j := 1 to 3 do 
begin
  // --- LIGNES ---
  if (grille[j][1] = GetJoueur(Jia)) and (grille[j][2] = GetJoueur(Jia)) and (grille[j][3] <> 'X') and (grille[j][3] <> 'O') then
  begin
    grille[j][3] := GetJoueur(Jia);
    exit;
  end
  else if (grille[j][2] = GetJoueur(Jia)) and (grille[j][3] = GetJoueur(Jia)) and (grille[j][1] <> 'X') and (grille[j][1] <> 'O') then
  begin
    grille[j][1] := GetJoueur(Jia);
    exit;
  end
  else if (grille[j][1] = GetJoueur(Jia)) and (grille[j][3] = GetJoueur(Jia)) and (grille[j][2] <> 'X') and (grille[j][2] <> 'O') then 
  begin
    grille[j][2] := GetJoueur(Jia);
    exit;
  end;

  // --- COLONNES ---
  if (grille[1][j] = GetJoueur(Jia)) and (grille[2][j] = GetJoueur(Jia)) and (grille[3][j] <> 'X') and (grille[3][j] <> 'O') then
  begin
    grille[3][j] := GetJoueur(Jia);
    exit;
  end
  else if (grille[2][j] = GetJoueur(Jia)) and (grille[3][j] = GetJoueur(Jia)) and (grille[1][j] <> 'X') and (grille[1][j] <> 'O') then
  begin
    grille[1][j] := GetJoueur(Jia);
    exit;
  end
  else if (grille[1][j] = GetJoueur(Jia)) and (grille[3][j] = GetJoueur(Jia)) and (grille[2][j] <> 'X') and (grille[2][j] <> 'O') then
  begin
    grille[2][j] := GetJoueur(Jia);
    exit;
  end;
end;

// --- DIAGONALE \ ---
if (grille[1][1] = GetJoueur(Jia)) and (grille[2][2] = GetJoueur(Jia)) and (grille[3][3] <> 'X') and (grille[3][3] <> 'O') then
begin
  grille[3][3] := GetJoueur(Jia);
  exit;
end
else if (grille[2][2] = GetJoueur(Jia)) and (grille[3][3] = GetJoueur(Jia)) and (grille[1][1] <> 'X') and (grille[1][1] <> 'O') then
begin
  grille[1][1] := GetJoueur(Jia);
  exit;
end
else if (grille[1][1] = GetJoueur(Jia)) and (grille[3][3] = GetJoueur(Jia)) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
begin
  grille[2][2] := GetJoueur(Jia);
  exit;
end;

// --- DIAGONALE / ---
if (grille[3][1] = GetJoueur(Jia)) and (grille[2][2] = GetJoueur(Jia)) and (grille[1][3] <> 'X') and (grille[1][3] <> 'O') then
begin
  grille[1][3] := GetJoueur(Jia);
  exit;
end
else if (grille[3][1] = GetJoueur(Jia)) and (grille[1][3] = GetJoueur(Jia)) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
begin
  grille[2][2] := GetJoueur(Jia);
  exit;
end
else if (grille[2][2] = GetJoueur(Jia)) and (grille[1][3] = GetJoueur(Jia)) and (grille[3][1] <> 'X') and (grille[3][1] <> 'O') then
begin
  grille[3][1] := GetJoueur(Jia);
  exit;
end;

// 2E PARTIE
for j := 1 to 3 do 
begin
  // SI XXX ou OOO -
  if (grille[j][1] = GetJoueur(Tj)) and (grille[j][2] = GetJoueur(Tj)) and (grille[j][3] <> 'X') and (grille[j][3] <> 'O') then
  begin
    grille[j][3] := GetJoueur(Jia);
    exit;
  end
  else if (grille[j][2] = GetJoueur(Tj)) and (grille[j][3] = GetJoueur(Tj)) and (grille[j][1] <> 'X') and (grille[j][1] <> 'O') then
  begin
    grille[j][1] := GetJoueur(Jia);
    exit;
  end
  else if (grille[j][1] = GetJoueur(Tj)) and (grille[j][3] = GetJoueur(Tj)) and (grille[j][2] <> 'X') and (grille[j][2] <> 'O') then
  begin
    grille[j][2] := GetJoueur(Jia);
    exit;
  end;

  // SI XXX ou OOO |
  if (grille[1][j] = GetJoueur(Tj)) and (grille[2][j] = GetJoueur(Tj)) and (grille[3][j] <> 'X') and (grille[3][j] <> 'O') then
  begin
    grille[3][j] := GetJoueur(Jia);
    exit;
  end
  else if (grille[2][j] = GetJoueur(Tj)) and (grille[3][j] = GetJoueur(Tj)) and (grille[1][j] <> 'X') and (grille[1][j] <> 'O') then
  begin
    grille[1][j] := GetJoueur(Jia);
    exit;
  end
  else if (grille[1][j] = GetJoueur(Tj)) and (grille[3][j] = GetJoueur(Tj)) and (grille[2][j] <> 'X') and (grille[2][j] <> 'O') then
  begin
    grille[2][j] := GetJoueur(Jia);
    exit;
  end;
end;

// SI XXX ou OOO \
if (grille[1][1] = grille[2][2]) and (grille[3][3] <> 'X') and (grille[3][3] <> 'O') then
begin
  grille[3][3] := GetJoueur(Jia);
  exit;
end
else if (grille[2][2] = grille[3][3]) and (grille[1][1] <> 'X') and (grille[1][1] <> 'O') then
begin
  grille[1][1] := GetJoueur(Jia);
  exit;
end
else if (grille[1][1] = grille[3][3]) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
begin
  grille[2][2] := GetJoueur(Jia);
  exit;
end;

// SI XXX ou OOO /
if (grille[3][1] = grille[2][2]) and (grille[1][3] <> 'X') and (grille[1][3] <> 'O') then
begin
  grille[1][3] := GetJoueur(Jia);
  exit;
end
else if (grille[3][1] = grille[1][3]) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
begin
  grille[2][2] := GetJoueur(Jia);
  exit;
end
else if (grille[2][2] = grille[1][3]) and (grille[3][1] <> 'X') and (grille[3][1] <> 'O') then
begin
  grille[3][1] := GetJoueur(Jia);
  exit;
end;
end;


function PotentielVictoire(Tj : Joueur; Jia : Joueur; grille : TabJeu) : boolean;
var
  j : integer;
begin
  PotentielVictoire := False;

  for j := 1 to 3 do
  begin
    // --- LIGNES ---
    if (grille[j][1] = GetJoueur(Tj)) and (grille[j][2] = GetJoueur(Tj)) and (grille[j][3] <> 'X') and (grille[j][3] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end
    else if (grille[j][2] = GetJoueur(Tj)) and (grille[j][3] = GetJoueur(Tj)) and (grille[j][1] <> 'X') and (grille[j][1] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end
    else if (grille[j][1] = GetJoueur(Tj)) and (grille[j][3] = GetJoueur(Tj)) and (grille[j][2] <> 'X') and (grille[j][2] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end;

    // --- COLONNES ---
    if (grille[1][j] = GetJoueur(Tj)) and (grille[2][j] = GetJoueur(Tj)) and (grille[3][j] <> 'X') and (grille[3][j] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end
    else if (grille[2][j] = GetJoueur(Tj)) and (grille[3][j] = GetJoueur(Tj)) and (grille[1][j] <> 'X') and (grille[1][j] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end
    else if (grille[1][j] = GetJoueur(Tj)) and (grille[3][j] = GetJoueur(Tj)) and (grille[2][j] <> 'X') and (grille[2][j] <> 'O') then
    begin
      PotentielVictoire := True;
      exit;
    end;
  end;

  // --- DIAGONALE \ ---
  if (grille[1][1] = GetJoueur(Tj)) and (grille[2][2] = GetJoueur(Tj)) and (grille[3][3] <> 'X') and (grille[3][3] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end
  else if (grille[2][2] = GetJoueur(Tj)) and (grille[3][3] = GetJoueur(Tj)) and (grille[1][1] <> 'X') and (grille[1][1] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end
  else if (grille[1][1] = GetJoueur(Tj)) and (grille[3][3] = GetJoueur(Tj)) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end;

  // --- DIAGONALE / ---
  if (grille[3][1] = GetJoueur(Tj)) and (grille[2][2] = GetJoueur(Tj)) and (grille[1][3] <> 'X') and (grille[1][3] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end
  else if (grille[3][1] = GetJoueur(Tj)) and (grille[1][3] = GetJoueur(Tj)) and (grille[2][2] <> 'X') and (grille[2][2] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end
  else if (grille[2][2] = GetJoueur(Tj)) and (grille[1][3] = GetJoueur(Tj)) and (grille[3][1] <> 'X') and (grille[3][1] <> 'O') then
  begin
    PotentielVictoire := True;
    exit;
  end;
end;


procedure IaJoueMoyen(Tj,Jia : Joueur; var grille : TabJeu); // Tj correspond au JoueurNonBot
const
PROBA = 60; // 60% de bloquer le jeu
var
n,choix : integer;
ValeurComforme : boolean;
begin
ValeurComforme:= False;
if PotentielVictoire(Tj,Jia,grille) then // debut du if
begin
    n:=random(100)+1;
  if n<PROBA then
  begin
    BloquerVictoire(Tj,Jia,grille);
  end
  else // s'il y a victoire potentiel mais -60
  begin
  while not ValeurComforme do
    begin
      IaJouerFacile(choix);
      ModifCaseVouluIA(grille,choix,ValeurComforme,Jia);
    end;
  end;// fin du if 

end

else // s'il n'y pas de victoire potentiel
begin
while not ValeurComforme do
  begin
    IaJouerFacile(choix);
    ModifCaseVouluIA(grille,choix,ValeurComforme,Jia);
  end;
end;// fin du if 


end;

procedure IaJoueDifficile(Tj,Jia : Joueur; var grille : TabJeu); // Tj correspond au JoueurNonBot
const
PROBA = 80; // 80% de bloquer le jeu
var
n,choix : integer;
ValeurComforme : boolean;
begin
ValeurComforme:= False;
if PotentielVictoire(Tj,Jia,grille) then // debut du if
begin
    n:=random(100)+1;
  if n<PROBA then
  begin
    BloquerVictoire(Tj,Jia,grille);
  end
  else // s'il y a victoire potentiel mais -60
  begin
  while not ValeurComforme do
    begin
      IaJouerFacile(choix);
      ModifCaseVouluIA(grille,choix,ValeurComforme,Jia);
    end;
  end;// fin du if 

end

else // s'il n'y pas de victoire potentiel
begin
while not ValeurComforme do
  begin
    IaJouerFacile(choix);
    ModifCaseVouluIA(grille,choix,ValeurComforme,Jia);
  end;
end;// fin du if 


end;


procedure IaJoueImpossible(Tj,Jia : Joueur; var grille : TabJeu); // Tj correspond au JoueurNonBot
const
PROBA = 100; // 100% de bloquer le jeu
var
n,choix : integer;
ValeurComforme : boolean;
begin

ValeurComforme:= False;
if PotentielVictoire(Tj,Jia,grille) then // debut du if
  BloquerVictoire(Tj,Jia,grille)
else // s'il n'y pas de victoire potentiel
begin
while not ValeurComforme do
  begin
    IaJouerFacile(choix);
    ModifCaseVouluIA(grille,choix,ValeurComforme,Jia);
  end;
end;// fin du if 


end;


end.
