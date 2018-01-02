
source("Plot.data.R")
source("Sep.mz.data.R")
library(ggplot2)
shinyServer(function(input, output) {
  
  PRO<-reactive({ 
    validate(
      need(input$input.file$datapath !="", "")
    )
    read.csv(input$input.file[['datapath']], skip=2)
     })
  
  size<-reactive({
    nrow(PRO())
  })
  
  observeEvent(input$input.file,{
    output$Distri<-renderPlot({
      Plot.data(Sep.mz.data(PRO(), wid.=input$width), bin=input$binwd)})
  })
   

  
  observeEvent(input$input.file,{
    output$instruction<-renderText(paste('Interactive Peptide Masses Distribution', '\n # of features: ',size(), sep=""))
  })
  
  output$down.plot<-downloadHandler(filename = function(){paste("MassDistribution-", ".png",sep="")}, content=function(file){
    device<-function(..., width=8, height=3) grDevices::png(..., width=8, height=3, res=400, unit="in")
    ggsave(file, plot=Plot.data(Sep.mz.data(PRO(), wid.=input$width), bin=input$binwd), device="png", dpi=400, height=3, width = 8, units="in")}, contentType = "image/png")
  }
    )  
  

