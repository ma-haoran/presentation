
library(shiny)


shinyUI(fluidPage(

    # Application title
    titlePanel("Predict MPG"),


    sidebarLayout(
        sidebarPanel(
           selectInput("x","choose cyl",sort(unique(mtcars$cyl),
                                                decreasing = FALSE)),
           sliderInput("y","input disp",
                       max=sort(mtcars$disp,
                                decreasing = TRUE)[1],
                       min = sort(mtcars$disp)[1],100),
           sliderInput("z","input hp",
                       max=sort(mtcars$hp,
                                decreasing = TRUE)[1],
                       min=sort(mtcars$hp)[1],100),
           
           submitButton("submit")
           
           
        ),
        
       

  
        mainPanel(
            
            h3("Predicted MPG"),
            textOutput("pred_mpg"),
            plotOutput("plot",height = "300px"),
            h2("Linear Model for Predict MPG")
            
           
         
        )
    )
))
