library(shiny)

shinyServer(function(input, output) {
    
    model <- lm(mpg ~ wt, data = mtcars)
    
    modelpred <- reactive({
        weightInput <- input$sliderWeight
        predict(model, newdata = data.frame(wt = weightInput))
    })
    
    output$plot <- renderPlot({
        weightInput <- input$sliderWeight
        
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight",
             ylab = "Miles Per Gallon", bty = "n", pch = 16,
             xlim = c(1, 6), ylim = c(10, 35))
        
        if(input$showModel) {
            abline(model, col = "red", lwd = 2)
        }
        
        legend(25, 250, "Model Prediction", pch = 16,
               col = "red", bty = "n", cex = 1.2)
        points(weightInput, modelpred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred <- renderText({
        modelpred()
    })
    
})
