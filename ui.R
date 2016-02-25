library(shiny)
require(markdown)

shinyUI(pageWithSidebar(

  headerPanel("Mileage Analysis of Cars"),

  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Cylinders" = "Cylinders",
                     "Transmission" = "Transmission",
                     "Gears" = "Gears",
                     "Carburetors" = "Carburetors"))
  ),

  tabsetPanel(

  tabPanel("Analyze Data", mainPanel(

    h3(textOutput("caption")),

    plotOutput("mpgPlot"),

    h4('The Average mileage'),

    tableOutput(outputId = "Avg_Mileage"),

    h4('The Median mileage'),

    tableOutput(outputId = "Median_Mileage"),

    h4('The Maximum mileage'),

    tableOutput(outputId = "Max_Mileage"),

    h4('Standard Deviation of mileage'),

    tableOutput(outputId = "SD_Mileage"))),

    tabPanel("About",mainPanel(includeMarkdown("about.md")))
)
))
