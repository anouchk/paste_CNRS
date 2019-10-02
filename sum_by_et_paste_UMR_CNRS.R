library(data.table)

#set working directory
setwd('/Users/analutzky/Desktop/UMR_CNRS')

Table_UMR=fread('UMR_tableau_global.csv')

View(Table_UMR)
# -> affichage excel-like

var.names=colnames(Table_UMR)
colnames(Table_UMR)=make.names(var.names)

# Créons une colonne où serait renseigné le nombre de tutelles par UMR, auquel on rajoute 1 pour compter le CNRS 
Table_UMR[,NbTutelle:=sum(Type.partenariat=='Tutelle')+1L,by=Code.Unité.au.31.12.2018]
# Décortiquons :
# Table_UMR[,NbTutelle] on crée un colonne nommée NbTutelle. Si elle existait déjà ça la remplacerait
# NbTutelle:= On assigne à la variable NbTutelle l'opétation suivante
# Type.partenariat=='Tutelle' c'est une variable bouléenne qui vaut true ou false
# Donc la somme c'est le nb de fois où c'est égal à true, c'est-à-dire où lacondition est vérifiée
# by=Code.Unité.au.31.12.2018 par UMR distincte

# pourquoi 1L au lieu de 1 ?
# Type of RHS ('double') must match LHS ('integer'). To check and coerce would impact performance too much for the fastest cases. Either change the type of the target column, or coerce the RHS of := yourself (e.g. by using 1L instead of 1)
# En fait R ne t'embête pas avec les types, mais data.table ne fait pas le boulot pour aller plus vite. Donc il faut l'aider.

# Idem pour le nombre de partenaires institutionnels
Table_UMR[,NbPartenaireInstitutionel:=sum(Type.partenariat=='Partenaire institutionnel'),by=Code.Unité.au.31.12.2018]

# Créons une colonne avec la liste des noms des tutelles, séparés par des virgules
Table_UMR[,ListeTutelles:=paste(Etablissement[Type.partenariat=='Tutelle'],collapse=','),by=Code.Unité.au.31.12.2018]
# Idem pour la liste des partenaires institutionnels
Table_UMR[,ListePartenaireInstitutionel:=paste(Etablissement[Type.partenariat=='Partenaire institutionnel'],collapse=','),by=Code.Unité.au.31.12.2018]

write.csv2(as.data.frame(Table_UMR),file='UMR_tableau_global_avec_nb_et_liste_tutelles_ou_partenariats.csv',fileEncoding = "UTF8")

