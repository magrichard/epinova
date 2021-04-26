# epinova


# Stage M1 Fabien Kon-Sun-Tack

## Data

## Planning

### Semaine 1 20210419

**Objectifs :** 

- prise en main de git et Rmarkdown
- statistique descriptive des données
- analyse différentielle univariée (moyenne et variance)

**Conclusions :** 

- git et Rmd +/- OK

[1] Statistiques descriptives: histogrammes

WT : distribution bimodale avec un pic (haut) autour de 1 (sondes méthylées) et un pic (bas) autour de 0 (sondes déméthylées)

simple KO vs WT : le pic autour de 1 s'elargit: perte de méthylation

double KO vs WT : on perd la bimodalité. Il n'y a plus le pic à 1

Without serum vs WT : pas d'impact sur la distribution des valeurs de methylation

[2] Tests univariés

- Penser à extraire les coefficients des tests (pas uniquement les pvaleurs). 
- Faire un tableau (data frame) général avec toutes les données et le sauver en .rds (faire un file.exists)
- correction pvaleurs : fait

[3] Visualisation

- volcano plot avec ggplot: ok
- en abscisse : ploter la difference de methylation plutot que le fold change (est ce que la methylation augmente ou diminue? a quelle amplitude?)

### Semaine 2 20210426

**Objectifs :**  

*Visualitation des description des données*

- Finaliser le tableau des analyses statistiques.
- Comparer les volcano plots avant et après BH. 
- Comparer les volcano plots entre les différentes paires de conditions
- Chercher des sondes d'interet :
  - Combien de sondes varient (moyenne) dans toutes les combinaisons A-C, B-C et C-D? 
  - Est-ce que le sens de variation est toujours le même?
  - Combien de sondes varient à la fois en moyenne ET en variance dans chaque combinaison?
  - Combien de sondes ont une variance différente pour une même moyenne dans chaque combinaison?
 
*Combinaison des pvaleurs*

- Implémenter le pipeline EWAS + Comb-P de Rousseaux et al



### Semaine 3 20210503

**Objectifs :** 

- Comp-P sur les p-valeurs de la variance différentielle

### Semaine 4 20210510

Objectifs :

- Etude jointe des régions différentiellement méthylée en moyenne et en variance