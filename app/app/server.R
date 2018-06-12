#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(here)
library(plotly)
source(here("code/read_wrangle.R"))

vias = read_wrangle_data()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$ruas_bancos_pontos <- renderPlot({
        
        if (input$extra) {
            vias %>% filter(bancos > 0) %>%
                ggplot(aes(x = bancos)) +
                    geom_jitter(aes(y = pontotaxi, color = 'Ponto de Taxi', size = 4), alpha = .7) +
                    geom_jitter(aes(y = pontomotot, color = 'Ponto de Mototaxi', size = 4), alpha = .5) +
                    geom_jitter(aes(y = pontoonibu, color = 'Ponto de Ônibus', size = 4), alpha = .5) +
                    labs(y = 'Pontos de Taxi, Mototaxi e Ônibus',
                         x = 'Quantidade de Bancos', 
                         colour = "Ponto")
        } else {
            vias %>% filter(bancos > 0) %>%
                ggplot(aes(x = bancos)) +
                    geom_jitter(aes(y = pontotaxi, color = 'Ponto de Taxi', size = 4), alpha = .7) +
                    labs(y = 'Pontos de Taxi', 
                         x = 'Quantidade de Bancos', 
                         colour = "Ponto")
        }
        
    })
    
    output$ruas_arvores_pontos <- renderPlot({
        
        if (input$extra2) {
            vias %>%
                ggplot(aes(x = arvore)) +
                geom_jitter(aes(y = pontotaxi, color = 'Ponto de Taxi', size = 4), alpha = .7) +
                geom_jitter(aes(y = pontomotot, color = 'Ponto de Mototaxi', size = 4), alpha = .5) +
                labs(y = 'Pontos de Taxi e Mototaxi', 
                     x = 'Quantidade de Árvores', 
                     colour = "Ponto")
        } else {
            vias %>%
                ggplot(aes(x = arvore)) +
                geom_jitter(aes(y = pontotaxi, color = 'Ponto de Taxi', size = 4), alpha = .7) +
                labs(y = 'Pontos de Taxi', 
                     x = 'Quantidade de Árvores', 
                     colour = "Ponto")
        }
        
    })
    
})