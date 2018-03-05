A = matrix(1:9, nrow = 3, byrow = T)
B = matrix(c(5,3,7,4,6,3,1,6,3,2,8,5), nrow = 4, byrow = T)
B %*% A
E <- array(1,c(4,3,2))
E[,,2] <- E[,,2]*2 #?????????????????????????????????2
E[,,1] #?????????

A = matrix(c(1,2,5,3,0,9), nrow = 3, byrow = TRUE)
A
x = c(2,4,3,7,1)
x
max(x)
max(A)
apply(A, 1, max)

#apply demo
myfunction = function(x){sum(x^2)}
apply(A, 1, myfunction)
#apply sacle
x = array(1:20,c(4,5))
myScale = function(x){
  x.mean = apply(x, 2, mean)
  x.sd = apply(x, 2, sd)
  t((t(x) - x.mean)/x.sd)
}

#data iris
#????????????

data(iris)
class(iris) #"data.frame"
names(iris) # "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
iris[,1]
iris$Sepal.Length

class(iris[,5]) #factor 1-4 all numeric

summary(iris) # show min, 1st quatier,median, mean,3rd quatier, max

apply(iris[,1:4],2,mean) #1-4col compute mean

cor(iris[,1:4])

print(cor(iris[,1:4]),digits=3) #digits = 3?????????????????????

plot(iris) #meaning



def.par = par(no.readonly = T)
par(mfrow = c(2,2))
for(i in 2:5){
  hist(iris[, i])
}
par(def.par)

#Error in hist.default(iris[, i]) : 'x' must be numeric ???5?????????numeric

pie(summary(iris$Species)) #?????????

barplot(summary(iris$Species)) #?????????

plot(iris[,1:4], col=c("red","green","blue")[iris$Species]) #????????????

boxplot(iris) #?????????

pairs(iris[,1:4],main="Iris de Fisher",pch=21,bg=c("red","green3","blue")[iris$Species]) 

quartz(iris$Species) x11()

#exemple with barplot
attach(iris)

inter<-seq(min(Petal.Length),max(Petal.Length),by=(max(Petal.Length)-min(Petal.Length))/10) #????????????sequence

h1<-hist(plot=F,Petal.Length[Species=="setosa"],breaks=inter) #???f?????? ??????counts???breaks??????
#iris$Species
h2<-hist(plot=F,Petal.Length[Species== "versicolor"],breaks=inter)
h3<-hist(plot=F,Petal.Length[Species== "virginica"],breaks=inter)
?hist
barplot(rbind(h1$counts,h2$counts,h3$counts),space=0,legend=levels(Species),main="LoPe",col=c('blue','red','yellow'))

postscript('exemple.eps',horizontal=F,width=12/2.5,height=12/2.5)
pairs(iris[2:5],main="Les Iris",pch=21,bg=c("red","green3","blue")[Species])
dev.off()

detach(iris)


notes <- read.csv("median-sy02-p2014.csv", header=F, na.strings=c("NA","ABS"))
names(notes) <- c("branche","note")
notes <- notes[-which(is.na(notes$note)),]

notes$branche <- as.character(notes$branche) #Convertir l???information de branche en chaine de caractere
notes$branche <- substr(notes$branche,1,2)#tirer les 2 premiers caracteres
notes$branche <- as.factor(notes$branche) #reconvertir en variable qualitative



#####methode a main
attach(notes)
lev = levels(branche)
inter = seq(min(note),max(note), by = ((max(note) - min(note)))/10)
h1 = hist(plot = F, note[branche == 'GB'], breaks = inter)
h2 = hist(plot = F, note[branche == 'GI'], breaks = inter)
h3 = hist(plot = F, note[branche == 'GM'], breaks = inter)
h4 = hist(plot = F, note[branche == 'GP'], breaks = inter)
h5 = hist(plot = F, note[branche == 'GS'], breaks = inter)
h6 = hist(plot = F, note[branche == 'GU'], breaks = inter)
h7 = hist(plot = F, note[branche == 'MT'], breaks = inter)
h8 = hist(plot = F, note[branche == 'TC'], breaks = inter)

barplot(rbind(h1$counts,h2$counts,h3$counts,h4$counts,h5$counts,h6$counts,h7$counts,h8$counts),space = 0, 
        legend = levels(branche),main = "score",col = c('blue','red','yellow','pink','green','orange','black','purple'))
########methode par fonction
hist.factor = function(qualit,quant){
  inter = seq(min(quant), max(quant),by = ((max(quant) - min(quant)))/10)
  h = rep(0, length(inter) - 1)
  for(lev in levels(qualit)){
    h1 = hist(plot = F, quant[qualit == lev], breaks = inter)
    h = rbind(h, h1$counts)
  }
  mycols <- runif(length(inter),min=1,max=length(colors()))
  barplot(h, space = 0, legend = levels(qualit),main = "score",col = mycols)
}
hist.factor(branche,note)



############################################################
babies = read.table("babies23.txt", header = T)
babies$smoke
babies = babies[c(7, 5, 8, 10, 12, 13, 21, 11)]
names(babies) = c("bwt", "gestation", "parity", "age", "height", "weight", "smoke", "education")
#remplace les codes des donnees non disponibles par NA
babies[babies$bwt == 999, 1] = NA
babies[babies$gestation == 999, 2] = NA
babies[babies$age == 99, 4] = NA
babies[babies$height == 99, 5] = NA
babies[babies$weight == 999, 6] = NA
babies[babies$smoke == 9, 7] = NA
babies[babies$education == 9, 8] = NA
#declarer les variables qualitatives comme fateurs
babies$smoke = factor(c("NonSmoking", "Smoking", "NonSmoking", "NonSmoking")[babies$smoke+1])
babies$education = factor(babies$education, ordered = T)

# Question 1
# SELECT bwt FROM babies WHERE smoke == 'Smoking';
a = babies$bwt[babies$smoke == 'Smoking']
b = babies$bwt[babies$smoke == 'NonSmoking']
summary(a);
summary(b);

png("bwt.png", width = 400, height = 400)


boxplot(babies[babies$smoke == "Smoking", ]$bwt,
        babies[babies$smoke == "NonSmoking", ]$bwt,
        #         notch = T, 
        names = c("Fumeuses", "Non fumeuses"),
        ylim = c(50, 200),
        col = c("gray","aliceblue"));
title("Poids des nouveaux-n??s en oncess")

dev.off()


a <- as.numeric(as.character(a))
b <- as.numeric(as.character(b))
mean(a,na.rm=T)-mean(b,na.rm=T)

#??????????????????jour de hestation?????????

c = babies$gestation[babies$smoke == "Smoking"]
d = babies$gestation[babies$smoke == "NonSmoking"]
summary(c)
summary(d)
plot(c)
png("gestation.png",width = 400, height = 400)
#boxplot(c, d, main = "Comparaison des gestations des m??res", col = c("blue", "red"), names = c("Smoking", "NonSmoking"), ylab = "gestation", notch = TRUE, outline = FALSE)

boxplot(c,
        d,
        names = c("Fumeuses","Non Fumeuses"),
        #ylim = c(250,313),  #???????????????ylim
        col = c("gray","aliceblue"),
        notch = TRUE, outline = FALSE);
title("Jour de gestation")

dev.off()


#????????????????????????

e = (babies$education[babies$smoke == 'Smoking'])
f = (babies$education[babies$smoke == 'NonSmoking'])
summary(e);
summary(f); #??????????????????????????????????????????

table <- table(babies$smoke, babies$education)

#             0   1   2   3   4   5   7
#NonSmoking  15  79 264  30 194 154   6
#Smoking      4 102 176  33 102  65   1

educationCategories = c("<8th grade", "8th<grade<12th", "High School",
                        "HS + trade", "HS + Some college", "College", 
                        "Trade school")

colnames(table)<-(educationCategories) #???table?????????


png("barplotEducation.png", width = 650, height = 400)

barplot(table, main = "Repartition des meres fumeuses et non fumeuses
        en fonction de leur niveau d'education", 
        col = c("aliceblue", "gray"),
        legend = c("Meres non fumeuses", "Meres fumeuses"),#?????????
        names.arg = educationCategories,
        cex.names = 0.8,#??????????????????
        beside = T, #?????????????????????????????????????????? ?????????T
        horiz = T)#??????????????????????????????????????????


bp <- barplot(table, main = "Niveau d'education des meres",
              horiz=T,
              col = c("aliceblue", "gray"),
              las=1,
              names.arg = educationCategories,
              cex.names = .505,
              cex.axis = .8,
              xlab = "Effectif de meres",
              xlim=c(0,max(apply(table,2,sum))+250),#??????x???????????????????????????250?????????
              border="gray",
              beside = T
              );

legend("topright",c("Meres non fumeuses", "Meres fumeuses"),,pch=rep(19,2),col = c("aliceblue", "gray"),bty="y")

add = apply(table,2,sum)#???table????????????

prop <- round(table/sum(table)*100,2) #?????????table?????????

#??????????????????????????????????????????????????? 
labs <- paste(paste(as.character(prop[1,]),"%",sep=""),
              paste(as.character(prop[2,]),"%",sep=""),sep=" / ")
#????????????????????????
text(apply(table,2,sum),bp,labs,pos=4,cex=.8)

