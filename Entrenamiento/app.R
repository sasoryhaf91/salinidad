## Ejemplo 1
# library(shiny)
# ui <- fluidPage(
#   "Hello, world!"
# )
# server <- function(input, output, session){
#   
# }
# shinyApp(ui, server)

# # Ejemplo 2
# library(shiny)
# ui <- fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# server <- function(input, output, session){
#   
# }
# shinyApp(ui, server)

# # Ejemplo 2 modificado
# library(shiny)
# problema <- c("-----", "Incremento del nivel freatico", "Mala calidad del agua de riego",
#               "Ambas causas")
# solucion <- c("Resuelto","Casi resuelto","Medianamente resuelto","No resuelto","Irreversible")
# 
# ui <- fluidPage(
#   selectInput("problema", label = "Origen del problema", choices = problema),
#   selectInput("solucion", label = "Grado actual de solución", choices = solucion),
#   textOutput("factorO1"),
#   textOutput("factorO2")
# )
# server <- function(input, output, session){
#   output$factorO1 <- renderText({
#     paste0("Problema: ", input$problema)
#   })
#   output$factorO2 <- renderText({
#     paste0("Solucion: ", input$solucion)
#   })
# }
# shinyApp(ui, server)

## Ejemplo 3
# library(shiny)
# ui <- fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# server <- function(input, output, session){
#   output$summary <- renderPrint({
#     dataset <- get(input$dataset, "package:datasets")
#     summary(dataset)
#   })
#   output$table <- renderTable({
#     dataset <- get(input$dataset, "package:datasets")
#     dataset
#   })
# }
# shinyApp(ui, server)

# # Ejemplo 4
# library(shiny)
# ui <- fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# server <- function(input, output, session){
#   # Create a reactive expression
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
#   output$summary <- renderPrint({
#     # Use a reactive expression by calling it like a function
#     summary(dataset())
#   })
#   output$table <- renderTable({
#     dataset()
#   })
# }
# shinyApp(ui, server)

# # Ejercicio 1.8.1
# library(shiny)
# ui <- fluidPage(
#   textInput("name", "What's your name?"),
#   textOutput("greeting")
# )
# server <- function(input, output, session){
#   output$greeting <- renderText({
#     paste0("Hello ",input$name)
#   })
# }
# shinyApp(ui, server)

# # Ejercicio 1.8.2
# library(shiny)
# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
#   "then x times 5 is",
#   textOutput("product")
# )
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * 5
#   })
# }
# shinyApp(ui, server)

# # Ejercicio 1.8.3
# library(shiny)
# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
#   sliderInput("y", label = "and y is", min = 1, max = 50, value = 5),
#   "then, x times y is",
#   textOutput("product")
# )
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * input$y
#   })
# }
# shinyApp(ui, server)

# # Ejercicio 1.8.4
# library(shiny)
# ui <- fluidPage(
#   sliderInput("x", "If x is", min = 1, max = 50, value = 30),
#   sliderInput("y", "and y is", min = 1, max = 50, value = 5),
#   "then, (x * y) is", textOutput("product"),
#   "and, (x * y) + 5 is", textOutput("product_plus5"),
#   "and (x * y) + 10 is", textOutput("product_plus10")
# )
# server <- function(input, output, session) {
#   # reactive product
#   product <- reactive({
#     input$x * input$y
#   })
#   output$product <- renderText({ 
#     product()
#   })
#   output$product_plus5 <- renderText({ 
#     product() + 5
#   })
#   output$product_plus10 <- renderText({ 
#     product() + 10
#   })
# }
# shinyApp(ui, server)

# Ejemplo 1.8.5
# library(shiny)
# library(ggplot2)
# datasets <- c("economics", "faithfuld", "seals")
# ui <- fluidPage(
#   selectInput("dataset", "Dataset", choices = datasets),
#   verbatimTextOutput("summary"),
#   plotOutput("plot")
# )
# server <- function(input, output, session) {
#   dataset <- reactive({
#     get(input$dataset, "package:ggplot2")
#   })
#   output$summary <- renderPrint({
#     summary(dataset())
#   })
#   output$plot <- renderPlot({
#     plot(dataset())
#   }, res = 96)
# }
# shinyApp(ui, server)

# # Free text controls
# library(shiny)
# ui <- fluidPage(
# textInput("name","What's your name?"),
# passwordInput("password","What's your password?"),
# textAreaInput("story", "Tell me about yourself", rows = 3)
# )
# server <- function(input, output, session){
#   
# }
# shinyApp(ui, server)

# # Numeric inputs
# library(shiny)
# ui <- fluidPage(
#   numericInput("num", "Number one", value = 0, min = 0, max = 100),
#   sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
#   sliderInput("rng", "Range", value = c(10,20), min = 0, max = 100)
# )
# server <- function(input, output, session){
# 
# }
# shinyApp(ui, server)

# # Ejemplo 2 modificado con sidebarLayout
# library(shiny)
# problema <- c("-----", "Incremento del nivel freatico", "Mala calidad del agua de riego",
#               "Ambas causas")
# solucion <- c("Resuelto","Casi resuelto","Medianamente resuelto","No resuelto","Irreversible")
# 
# ui <- fluidPage(
#   titlePanel("Textura del suelo"),
#   sidebarLayout(
#     sidebarPanel(
#       numericInput("Arcilla", label = "% Arcilla", value = 0, min = 0, max = 100),
#       numericInput("Limo", label = "% Limo", value = 0, min = 0, max = 100),
#       numericInput("Arena", label = "% Arena", value = 0, min = 0, max = 100)
#     ),
#     mainPanel(
#       textOutput("text1"),
#       textOutput("text2"),
#       textOutput("text3"),
#     ) 
#   ),
#   titlePanel("Factor general origen del problema O"),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("problema", label = "Origen del problema", choices = problema),
#       selectInput("solucion", label = "Grado actual de solución", choices = solucion),
#     ),
#     mainPanel(
#       textOutput("factorO1"),
#       textOutput("factorO2")  
#     ) 
#   )
# )
# server <- function(input, output, session){
#   output$factorO1 <- renderText({
#     paste0("Problema: ", input$problema)
#   })
#   output$factorO2 <- renderText({
#     paste0("Solucion: ", input$solucion)
#   })
#   output$text1 <- renderText({
#     paste0("% Arcilla: ", input$Arcilla)
#   })
#   output$text2 <- renderText({
#     paste0("% Limo: ", input$Limo)
#   })
#   output$text3 <- renderText({
#     paste0("% Arena: ", input$Arena)
#   })
# }
# shinyApp(ui, server)

# # Dates control
# library(shiny)
# ui <- fluidPage(
#   dateInput("dob", "When were you born?"),
#   dateRangeInput("holiday", "When do you want to go on vacation next?")
# )
# server <- function(input, output, session){
# 
# }
# shinyApp(ui, server)

####################################################
## Example: 2.2.5 Limited choices
###################################################
# library(shiny)
# animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")
# ui <- fluidPage(
#   selectInput("state", "What's your favorite state?", state.name),
#   radioButtons("animal", "What's your favorite animal?", animals)
# )
# server <- function(input, output, session){
# 
# }
# shinyApp(ui, server)
###################################################

####################################################
## Example: 2.3.1 Text
###################################################
# library(shiny)
# ui <- fluidPage(
#   textOutput("text"),
#   verbatimTextOutput("code")
# )
# server <- function(input, output, session){
#   output$text <- renderText({
#     "Hello friend!"
#   })
#   output$code <- renderPrint({
#     #summary(1:10)
#     t.test(1:5, 2:6)
#   })
# }
# shinyApp(ui, server)
###################################################

####################################################
## Example: 
###################################################
# library(shiny)
# ui <- fluidPage(
# 
# )
# server <- function(input, output, session){
# 
# }
# shinyApp(ui, server)
###################################################

####################################################
## Example: 
###################################################
# library(shiny)
# ui <- fluidPage(
#   
# )
# server <- function(input, output, session){
#   
# }
# shinyApp(ui, server)
###################################################


