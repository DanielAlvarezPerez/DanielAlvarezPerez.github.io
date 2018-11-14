shinyServer(
  pageWithSidebar(
    headerPanel = ("My First Shiny App"),

         sidebarPanel = (
           selectInput("Selecione la distribucion",
                       opciones=c("Normal","Exponencial")),
           sliderInput("TMuestra","Porfavpor seleciones un tamaño de la muestra:",
                       min=100, max=5000, vakue=1000, step=100)
         ),
    mainPanel = ("Main Panel")
 )
)
