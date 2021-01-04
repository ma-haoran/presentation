
library(shiny)
library(ggplot2)
library(plotly)

shinyServer(function(input, output) {

model <- lm(data=mtcars,mpg~as.factor(cyl)+disp+hp)

pred <- reactive({
    predict(model,newdata = data.frame(cyl=as.factor(input$x),
                                           disp=input$y,
                                           hp=input$z))
  })


output$pred_mpg <- renderText({pred()})

output$plot <- renderPlot({
    g <- ggplot(data=mtcars,aes(y=mpg,x=disp,color=hp))+
        geom_point()+
        facet_grid(.~cyl)
   
    g
        
})

})
