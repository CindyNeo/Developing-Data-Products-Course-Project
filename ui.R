library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict MPG from Weight"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderWeight", "What is the weight of the car?",
                        min = 1, max = 6, value = 3),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
        ),
        mainPanel(
            plotOutput("plot"),
            h3("Predicted MPG based on model:"),
            textOutput("pred")
        )
    )
))
