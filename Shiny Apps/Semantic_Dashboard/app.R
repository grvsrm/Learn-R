library(semantic.dashboard) # <-- You only need to change this line to: library(semantic.dashboard)


# UI
ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    dashboardSidebar(sidebarMenu(
        menuItem(tabName = "home", text = "Home", icon = icon("home")),
        menuItem(tabName = "another", text = "Another Tab", icon = icon("heart"))
    )),
    dashboardBody(
        fluidRow(
            box(plotOutput("plot1", height = 250)),
            box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
            )
        )
    )
)


# Server
server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

# App
shinyApp(ui, server)