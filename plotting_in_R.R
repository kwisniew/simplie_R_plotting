library(ggplot2)
referencyjna_DLTS <- read.table("referencyjna_DLTS.txt")
referencyjnaRDLTS <- read.table("referencyjnaRDLTS.txt")
Na_DLTS <- read.table("5xNa_DLTS.txt")
NaRDLTS <- read.table("5xNaRDLTS.txt")
eV_DLTS <- read.table("015eV_DLTS.txt")
eVRDLTS <- read.table("015eVRDLTS.txt")
u_DLTS <- read.table("00004ruch_DLTS.txt")
uRDLTS <- read.table("00004ruchRDLTS.txt")


data.frame(Temperature = referencyjna_DLTS$V1,
                  refD = referencyjna_DLTS$V2,
                  refR = referencyjnaRDLTS$V2,
                  NaD  =  Na_DLTS$V2,
                  NaR  =  NaRDLTS$V2,
                 eVD  =  eV_DLTS$V2,
                 eVR  =  eVRDLTS$V2,
           uD  =  u_DLTS$V2,
           uR  =  uRDLTS$V2
           ) -> df

g <- ggplot(df, aes(Temperature)) + 
     geom_area(aes(y=refD), size=1.2, col="lightgreen", fill="lightgreen")+ 
     geom_area(aes(y=refR), size=1.2, col="lightgreen", fill="lightgreen")+
  geom_line(aes(y=NaD), size=1.2)+
  geom_line(aes(y=NaR), size=1.2)+
  geom_line(aes(y=eVD), size=1.2, col="red")+
  geom_line(aes(y=eVR), size=1.2, col="red")+
  geom_line(aes(y=uD), size=1.2, col="blue")+
  geom_line(aes(y=uR), size=1.2, col="blue")+
     labs(y="DLTS amplitude", x="T[K]")+
  theme( axis.title=element_text(size=18,face="bold"), axis.text.x=element_text(size=16), axis.text.y=element_text(size=16))+
  coord_cartesian(xlim=c(50,140))


plot(g)
