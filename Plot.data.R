## Take the output from Progenesis directly and plot the distribution.

Plot.data<-function(to.plot, bin=0.5){


  ggplot(to.plot, aes(x=Mass, xend=Mass, y=0, yend=Abundance, fill="black")) + geom_segment(size=bin) + theme(panel.border=element_rect(fill=NA, size=1, linetype = "solid", color="black"), panel.background = element_rect(fill="white",color="black"), panel.grid.major=element_line(color="grey95"), axis.text.y = element_text(size=16), axis.text.x = element_text(size=15), axis.title.x = element_text(size=20), axis.title.y = element_text(size=20)) + labs(y="Abundance")+xlim(0, 20000) + scale_y_continuous(name="Abundance", breaks=(max(to.plot$Abundance)/10)*c(0,5,10), labels =paste(seq(0,100, by=50), "%", sep=""))
    }
 

    
  


           


