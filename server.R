library(shiny)
library(ggplot2)
library(ggcorrplot)

function(input, output) {
  
  # Read data from CSV file
  data <- read.csv("df.csv", header = TRUE)  # Use absolute path
  
  output$plot <- renderPlot({
    
    x <- input$x_var
    y <- input$y_var
    
    if (input$plot_type == "Bar Chart") {
      ggplot(data, aes_string(x = x, fill = x)) +
        geom_bar() +
        labs(x = x, title = "Bar Chart") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
      
    } else if (input$plot_type == "Boxplot") {
      ggplot(data, aes_string(x = x, y = y)) +
        geom_boxplot() +
        labs(x = x, y = y, title = "Boxplot") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
      
    } else if (input$plot_type == "Violin Plot") {
      ggplot(data, aes_string(x = x, y = y)) +
        geom_violin() +
        labs(x = x, y = y, title = "Violin Plot") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
    }
  })
}

