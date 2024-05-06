library(shiny)

fluidPage(
  
  titlePanel("Sociological Impact of Endangered Species"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("x_var", "X-axis Variable", choices = c("Red_List_Category", "Population_Trend", "Ecosystem", "Biogeographic_Realm", "Threat")),
      selectInput("y_var", "Y-axis Variable", choices = c("Year_Published")),
      
      radioButtons("plot_type", "Plot Type",
                   choices = c("Bar Chart", "Boxplot", "Violin Plot"),
                   selected = "Bar Chart")
      
    ),
    
    mainPanel(
      
      plotOutput("plot")
      
    )
  )
)