# COMPTER ET LISTER LES TUTELLES DES LABOS

Il s'agit d'appliquer la fonction "sum" avec "by", mais aussi "paste" de data.table dans R, à un jeu de données du CNRS relatif aux UMR dont l'organisme est tutelle.

Le fichier excel d'origine avait une ligne par établissement co-tutelle, donc 5 lignes pour une même UMR si le CNRS partage sa tutelle avec 5 établissements pour l'UMR en question. 

L'objectif est ici d'ajouter au jeu de données une colonne où le nombre de tutelles pour chaque UMR est précisé, ainsi qu'une colonne avec la liste des noms de ces tutelles, séparés par des virgules. 
