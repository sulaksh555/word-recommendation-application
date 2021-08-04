library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme(theme = "darkly"),

    # Application title
    titlePanel("Word Recommendation App"),

    sidebarLayout(
        sidebarPanel(
            helpText("Enter an English phrase below. My app will recommend what the next word to continue your phrase should be."),
            textInput(inputId="inputPhrase", label="Enter your phrase below: ", value="")
        ),

        mainPanel(
            h3("Recommendation"),
            textOutput(outputId="recommendation")
        )
    )
))
