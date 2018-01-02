library(shinydashboard)

dashboardPage(skin="purple",
  dashboardHeader(title="Proteolytic Miscleavage Evaluation", titleWidth = 400),
  dashboardSidebar(
    sidebarMenu(
      fileInput("input.file", label=span("Input data file", style="font-family:'calibri'; font-size:12pt")),
      hr(),
     
    
      sliderInput("width", label="Mass range (Da) within each bin", min=50, max=400, value=250, step=50),
      sliderInput("binwd", label="Bin width", min=0.5, max=2, value=0.5, step=0.5)  
      
      
      )
    ),
    
  
  dashboardBody(
    tags$style(HTML("

                              
                              .box.box-solid.box-primary>.box-header {
                              color:#fff;
                              background:#666666
                              }
                              
                              .box.box-solid.box-primary{
                              border-bottom-color:#666666;
                              border-left-color:#666666;
                              border-right-color:#666666;
                              border-top-color:#666666;
                              }
                              
                              ")),
  
      
    fluidRow(
   
      box(title="Peptide Mass Distribution", status="primary", solidHeader = TRUE, collapsible = TRUE, width=12,
        plotOutput("Distri")
          
      ),
      box(title=NULL, status = "primary", solidHeader = FALSE, collapsible = FALSE, width = 12,
          fluidRow(
            column(width=12,
          verbatimTextOutput("instruction")),
            column(width=12,
          downloadButton("down.plot", label="Output Plot"))
          ))
  
   
)
)
)
          
          
          
          
          