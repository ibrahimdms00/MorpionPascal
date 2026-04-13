unit morpionGestionJeuIA;

interface

procedure FacileMode();
procedure MoyenMode();
procedure DifficileMode();
procedure ImpossibleMode();
function GetEgalite(): integer;
procedure Stat();
implementation
uses morpionlogicAmical,GestionEcran,morpionIHM,morpionLogicIA;
var
compteurPartie,scoreX,scoreO : integer;


function GetEgalite(): integer;
begin
  GetEgalite:= compteurPartie - scoreX - scoreO;
end;

procedure SauvegarderStats(scoreX, scoreO : integer);
var
  f : Text;
begin
  Assign(f, 'stats.txt');
  Rewrite(f);   { ecrase l ancien fichier }
  Writeln(f, scoreX);
  Writeln(f, scoreO);
  Writeln(f, GetEgalite());
  Close(f);

end;
procedure FacileMode();

var
  Victoire,choix : integer;
  MancheEnCours,quitterPartie,quitterSansChoix,sortieChoix,CaseValideIA,CaseValide : boolean;
  Tj,Jia,J : Joueur;
  NewValue : char;
begin

quitterPartie := True;
InitialiserScore(scoreX,scoreO);
JoueurCommenceIA(Tj,J,Jia);
quitterSansChoix:= True;
compteurPartie:=0;

while quitterPartie do
  begin
    compteurPartie:=compteurPartie+1;
    InitialiserTab(grille); 
    Victoire := -1; // Part du principe que ya pas de gagnant
    MancheEnCours := true; // Sortie Boucle 2 = VRAI
    sortieChoix := False; // quitterManche Utilisateur = FAUX

    //Afficher le Jeu
  while MancheEnCours do // Boucle pour les manches
  begin 
    effacerEcran;
    AfficherJeu(Tj,scoreX,scoreO);
    CaseValide:=False;
    CaseValideIA:=False;
// PARTIE Joueur
    while not CaseValide do
    begin
      if Tj = J then
      begin
        writeln('Pour quitter taper 0 ');
        writeln('Quel est la case ou vous souhaitez jouer ?');
        readln(choix);

      if choix = 0 then
        begin
          CaseValide:=True;
          MancheEnCours:=False;
          sortieChoix:= True;
          quitterSansChoix:= False;
        end
        else
        begin
          CaseValide:=ChoixComformeFunc(choix,grille);
          NewValue:= GetJoueur(J);
          ModifCaseVoulu(choix,grille,NewValue);

          //mettre un systeme qui permet de resaisir une autre valeur
        end;
    end    
    
    
    // PARTIE IA 
    else if Tj = Jia then
      begin
      CaseValide:=True;
      attendre(500);
      while (not CaseValideIA) and (not GrillePleine(grille)) do
      begin
        IaJouerFacile(choix);
        ModifCaseVouluIA(grille,choix,CaseValideIA,Jia);
      end;
      // fin boucle Valeur Comforme
      
      end;// fin de la partie IA
      
      end;
JoueurSuivant(Tj);
VainqueurProc(grille,Victoire,scoreX,scoreO);

  if (not sortieChoix) and ((Victoire<>-1) or (GrillePleine(grille))) then
    begin
      MancheEnCours := False; //Quitter la manche
      quitterSansChoix:= True; //Annoncer le gagnant
    end;
  end; // fin boucle manche
  

  if quitterSansChoix = True then // si fin de la manche
  begin
    AnnoncerGagnant(Victoire);
    FinManche(scoreX,scoreO,compteurPartie);
  end
  else if sortieChoix = True then // sinon si U choisi de quitter
  begin
  quitterPartie:=false; // Quitter revenir au menu
  RetourMenuPrincipal;
  end;
  end;

end;






procedure MoyenMode();
var
  compteurPartie,Victoire,choix,scoreX,scoreO : integer;
  MancheEnCours,quitterPartie,quitterSansChoix,sortieChoix,CaseValideIA,CaseValide : boolean;
  Tj,Jia,J : Joueur;
  NewValue : char;
begin

quitterPartie := True;
InitialiserScore(scoreX,scoreO);
JoueurCommenceIA(Tj,J,Jia);
quitterSansChoix:= True;
compteurPartie:=0;

while quitterPartie do
  begin
    compteurPartie:=compteurPartie+1;
    InitialiserTab(grille); 
    Victoire := -1; // Part du principe que ya pas de gagnant
    MancheEnCours := true; // Sortie Boucle 2 = VRAI
    sortieChoix := False; // quitterManche Utilisateur = FAUX

    //Afficher le Jeu
  while MancheEnCours do // Boucle pour les manches
  begin 
    effacerEcran;
    AfficherJeu(Tj,scoreX,scoreO);
    CaseValide:=False;
    CaseValideIA:=False;
// PARTIE Joueur
    while not CaseValide do
    begin
      if Tj = J then
      begin
        writeln('Pour quitter taper 0 ');
        writeln('Quel est la case ou vous souhaitez jouer ?');
        readln(choix);

      if choix = 0 then
        begin
          CaseValide:=True;
          MancheEnCours:=False;
          sortieChoix:= True;
          quitterSansChoix:= False;
        end
        else
        begin
          CaseValide:=ChoixComformeFunc(choix,grille);
          NewValue:= GetJoueur(J);
          ModifCaseVoulu(choix,grille,NewValue);

          //mettre un systeme qui permet de resaisir une autre valeur
        end;
    end    
    
    
    // PARTIE IA 
    else if Tj = Jia then
      begin
        CaseValide:=True;
        attendre(500);
        if not GrillePleine(grille) then
        begin
          IaJoueMoyen(J,Jia,grille);
        end;      
      end;// fin de la partie IA
      
      end;
JoueurSuivant(Tj);
VainqueurProc(grille,Victoire,scoreX,scoreO);

  if (not sortieChoix) and ((Victoire<>-1) or (GrillePleine(grille))) then
    begin
      MancheEnCours := False; //Quitter la manche
      quitterSansChoix:= True; //Annoncer le gagnant
    end;
  end; // fin boucle manche
  

  if quitterSansChoix = True then // si fin de la manche
  begin
    AnnoncerGagnant(Victoire);
    FinManche(scoreX,scoreO,compteurPartie);
  end
  else if sortieChoix = True then // sinon si U choisi de quitter
  begin
  quitterPartie:=false; // Quitter revenir au menu
  RetourMenuPrincipal;
  end;
  end;
  end;



procedure DifficileMode();
var
  compteurPartie,Victoire,choix,scoreX,scoreO : integer;
  MancheEnCours,quitterPartie,quitterSansChoix,sortieChoix,CaseValideIA,CaseValide : boolean;
  Tj,Jia,J : Joueur;
  NewValue : char;
begin

quitterPartie := True;
InitialiserScore(scoreX,scoreO);
JoueurCommenceIA(Tj,J,Jia);
quitterSansChoix:= True;
compteurPartie:=0;

while quitterPartie do
  begin
    compteurPartie:=compteurPartie+1;
    InitialiserTab(grille); 
    Victoire := -1; // Part du principe que ya pas de gagnant
    MancheEnCours := true; // Sortie Boucle 2 = VRAI
    sortieChoix := False; // quitterManche Utilisateur = FAUX

    //Afficher le Jeu
  while MancheEnCours do // Boucle pour les manches
  begin 
    effacerEcran;
    AfficherJeu(Tj,scoreX,scoreO);
    CaseValide:=False;
    CaseValideIA:=False;
// PARTIE Joueur
    while not CaseValide do
    begin
      if Tj = J then
      begin
        writeln('Pour quitter taper 0 ');
        writeln('Quel est la case ou vous souhaitez jouer ?');
        readln(choix);

      if choix = 0 then
        begin
          CaseValide:=True;
          MancheEnCours:=False;
          sortieChoix:= True;
          quitterSansChoix:= False;
        end
        else
        begin
          CaseValide:=ChoixComformeFunc(choix,grille);
          NewValue:= GetJoueur(J);
          ModifCaseVoulu(choix,grille,NewValue);

          //mettre un systeme qui permet de resaisir une autre valeur
        end;
    end    
    
    
    // PARTIE IA 
    else if Tj = Jia then
      begin
        CaseValide:=True;
        attendre(500);
        if not GrillePleine(grille) then
        begin
          IaJoueDifficile(J,Jia,grille);
        end;      
      end;// fin de la partie IA
      
      end;
JoueurSuivant(Tj);
VainqueurProc(grille,Victoire,scoreX,scoreO);

  if (not sortieChoix) and ((Victoire<>-1) or (GrillePleine(grille))) then
    begin
      MancheEnCours := False; //Quitter la manche
      quitterSansChoix:= True; //Annoncer le gagnant
    end;
  end; // fin boucle manche
  

  if quitterSansChoix = True then // si fin de la manche
  begin
    AnnoncerGagnant(Victoire);
    FinManche(scoreX,scoreO,compteurPartie);
  end
  else if sortieChoix = True then // sinon si U choisi de quitter
  begin
  quitterPartie:=false; // Quitter revenir au menu
  RetourMenuPrincipal;
  end;
  end;
  end;


procedure ImpossibleMode();
var
  compteurPartie,Victoire,choix,scoreX,scoreO : integer;
  MancheEnCours,quitterPartie,quitterSansChoix,sortieChoix,CaseValideIA,CaseValide : boolean;
  Tj,Jia,J : Joueur;
  NewValue : char;
begin

quitterPartie := True;
InitialiserScore(scoreX,scoreO);
JoueurCommenceIA(Tj,J,Jia);
quitterSansChoix:= True;
compteurPartie:=0;

while quitterPartie do
  begin
    compteurPartie:=compteurPartie+1;
    InitialiserTab(grille); 
    Victoire := -1; // Part du principe que ya pas de gagnant
    MancheEnCours := true; // Sortie Boucle 2 = VRAI
    sortieChoix := False; // quitterManche Utilisateur = FAUX

    //Afficher le Jeu
  while MancheEnCours do // Boucle pour les manches
  begin 
    effacerEcran;
    AfficherJeu(Tj,scoreX,scoreO);
    CaseValide:=False;
    CaseValideIA:=False;
// PARTIE Joueur
    while not CaseValide do
    begin
      if Tj = J then
      begin
        writeln('Pour quitter taper 0 ');
        writeln('Quel est la case ou vous souhaitez jouer ?');
        readln(choix);

      if choix = 0 then
        begin
          CaseValide:=True;
          MancheEnCours:=False;
          sortieChoix:= True;
          quitterSansChoix:= False;
        end
        else
        begin
          CaseValide:=ChoixComformeFunc(choix,grille);
          NewValue:= GetJoueur(J);
          ModifCaseVoulu(choix,grille,NewValue);

          //mettre un systeme qui permet de resaisir une autre valeur
        end;
    end    
    
    
    // PARTIE IA 
    else if Tj = Jia then
      begin
        CaseValide:=True;
        attendre(500);
        if not GrillePleine(grille) then
        begin
          IaJoueImpossible(J,Jia,grille);
        end;      
      end;// fin de la partie IA
  
      end; // fin Boucle Case valide
VainqueurProc(grille,Victoire,scoreX,scoreO);
JoueurSuivant(Tj);


  if (not sortieChoix) and ((Victoire<>-1) or (GrillePleine(grille))) then
    begin
      MancheEnCours := False; //Quitter la manche
      quitterSansChoix:= True; //Annoncer le gagnant
    end;
end; // fin boucle manche
  

  if quitterSansChoix = True then // si fin de la manche
  begin
    AnnoncerGagnant(Victoire);
    FinManche(scoreX,scoreO,compteurPartie);
  end
  else if sortieChoix = True then // sinon si U choisi de quitter
  begin
  quitterPartie:=false; // Quitter revenir au menu
  RetourMenuPrincipal;
  end;
  end;
  SauvegarderStats(scoreX,scoreO);
  end;



procedure Stat();
var
  f : Text;
  v1, v2, eg : integer;
begin
  effacerEcran;

  Assign(f, 'stats.txt');

  {$I-}
  Reset(f);
  {$I+}

  if IOResult <> 0 then
  begin
    writeln('Aucune statistique disponible.');
    writeln;
    writeln('Appuyez sur ENTREE...');
    readln;
    exit;
  end;

  Readln(f, v1);
  Readln(f, v2);
  Readln(f, eg);

  Close(f);

  writeln('------- STATISTIQUES -------');
  writeln;
  writeln('Victoires Joueur 1 : ', v1);
  writeln('Victoires Joueur 2 : ', v2);
  writeln('Egalites           : ', eg);
  writeln;
  writeln('Appuyez sur ENTREE...');
  readln;
end;

end.

