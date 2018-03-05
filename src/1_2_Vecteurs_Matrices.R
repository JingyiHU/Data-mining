# Matrices simples
A<-matrix(1:9,nrow=3,byrow=T)
B<-matrix(c(5,3,7,4,6,3,1,6,3,2,8,5),nrow=4,byrow=T) #byrow???true??????????????????
?matrix()
A
B
dim(A)
dim(B) 
na<-dim(A)[1] # nombre de lignes de la matrice
pa<-dim(A)[2] # nombre de colonnes de la matrice

# ----------------------------------

# Vecteur simple
v<-1:3
v

# ----------------------------------

# Il est possible de concat??ner des matrices en les agr??geant par lignes ou par colonnes :
# cbind (column bind) copie les colonnes de la matrice v ?? la suite de celles de la matrice A
C<-cbind(A,v) 
# rbind (row bind) copie les lignes de la matrice B ?? la suite de celles de la matrice A
D<-rbind(A,B)
C
D

# ----------------------------------

# On peut extraire des ??l??ments, des lignes ou des colonnes d???une matrice
dim(C)
dim(D)
D[3,3]
D[,2] # seconde colonne
D[5,] # cinquieme ligne
D[2:4,2:3]

# ----------------------------------

# Que fait la commande diag ?
# diag d'un int = cr??e une matrice carr??e diagonale avec toutes les valeurs de la diagonale ??gales ?? 1
diag(3)
# diag d'un vecteur = cr??e une matrice carr??e diagonale avec les valeurs du vecteur dans la diagonale
diag(v)
# diag d'une matrice = extrait les valeurs de la diagonale
diag(A)

# ----------------------------------

# Op??rations matricielles
matrix(1,3,2) # cr???? une matrice de 3 ligne et 2 colonnes avec toutes les valeurs initialis??es ?? 1
t(A) # transposition de matrice
A[,2]<-v # initialise la colonne 2 de A avec les valeurs de v
A
B%*%A # produit matriciel B*A
A%*%A # produit matriciel A*A
A*A # produit terme ?? terme A*A
A+A # addition terme ?? terme 


# ----------------------------------

# Fonction array permet de cr??er et manipuler des tableaux de nombres de 
# dimension quelconque (potentiellement sup??rieure ?? 2)

E <- array(1,c(4,3,2)) # contient deux matrices de 4 lignes et 3 colonnes initialis??es avec la valeur 1
E[,,1]
E[,,2]
E
E[,,2] = E[,,2]*2
E

# Notons que le ?? liage ?? de matrices selon la troisi??me dimension, 
# de mani??re ?? former un tel tableau de nombres, n??cessite l???installation 
# et le chargement du package abind
library(abind)
F1 <- matrix(1,4,3)
F2 <- matrix(2,4,3)
# "concatener" les matrices les unes ?? la suite des autres
F3 <- abind(F1, F2, along=1) # concat??ner les matrices en collant les lignes (m??me nombre de colonnes)
F4 <- abind(F1, F2, along=2) # concat??ner les matrices en collant les colonnes (m??me nombre de lignes)
F6 <- abind(F1, F2, along=3) # concat??ner les matrices en les collant les unes ?? la suite des autres (m??mes dimensions)
?abind




