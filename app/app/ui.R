library(shiny)
library(tidyverse)
library(here)
source(here("code/read_wrangle.R"))

nomes_ruas = read_wrangle_data() %>% select(nomelograd) %>% unique()

fluidPage(
    
    titlePanel("Shiny App - Gabriel Guimarães"),
    
    fluidRow(
        column(1),
        column(10, 
           fluidPage(
               titlePanel("Em uma rua, quanto mais bancos mais pontos de taxi/mototaxi/ônibus?"),
               
               checkboxInput(inputId = "extra", 
                             label = strong("Visualizar relação com pontos de mototaxis e ônibus"), 
                             value = FALSE),
               
               plotOutput(outputId = "ruas_bancos_pontos")
            )),
        column(1)
    ),
    fluidRow(
        column(1),
        column(10, 
               fluidPage(
                   
                   titlePanel("Ruas mais arborizadas são alvo dos pontos de taxi/mototaxi?"),
                   
                   checkboxInput(inputId = "extra2", 
                                 label = strong("Visualizar relação com pontos de mototaxis"), 
                                 value = FALSE),
                   
                   plotOutput(outputId = "ruas_arvores_pontos")
                   
               )),
        column(1)
    )
    
    
)
