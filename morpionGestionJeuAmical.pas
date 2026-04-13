unit morpionGestionJeuAmical;

interface

uses
classes,sysutils,morpionlogicAmical,morpionIHM,GestionEcran;


procedure JeuAmical();

implementation


procedure JeuAmical();
var
  compteurPartie,j,Victoire,choix,scoreX,scoreO : integer;
  quitterManche,quitterPartie,quitterSansChoix,sortieChoix : boolean;
  Tj : Joueur;
  NewValue : char;
begin

quitterPartie := True;
InitialiserScore(scoreX,scoreO);
JoueurCommence(Tj);
quitterSansChoix:= True;
compteurPartie:=0;
while quitterPartie do
  begin
    compteurPartie:=compteurPartie+1;
    InitialiserTab(grille); 
    Victoire := -1; // Part du principe que ya pas de gagnant
    quitterManche := true; // Sortie Boucle 2 = VRAI
    sortieChoix := False; // quitterManche Utilisateur = FAUX
    effacerEcran; 
    AfficherJeu(Tj,scoreX,scoreO);

    //Afficher le Jeu
  while quitterManche do // grande Boucle pour le jeu
  begin  
    writeln('Pour quitter taper 0 ');
    writeln('Quel est la case ou vous souhaitez jouer ?');
    readln(choix);
    if choix = 0 then
    begin
      quitterManche:=False;
      sortieChoix:= True;
      quitterSansChoix:= False;
    end
    else
    begin
      NewValue:= GetJoueur(Tj);
      ModifCaseVoulu(choix,grille,NewValue);
      VainqueurProc(grille,Victoire,scoreX,scoreO);
      JoueurSuivant(Tj);
      
    end;

    if (not sortieChoix) and ((Victoire<>-1) or (GrillePleine(grille))) then
    begin
      quitterManche := False; //Quitter la manche
      quitterSansChoix:= True; //Annoncer le gagnant

    end;
      effacerEcran;
      AfficherJeu(Tj,scoreX,scoreO);
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


end.