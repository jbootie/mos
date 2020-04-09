
#load_libraries
library(leaflet)
library(leaflet.extras)
library(htmlwidgets)
library(rmarkdown)

#load the csv of geocoded addresses.

dfm <- read.csv("final_adys3.csv",stringsAsFactor=FALSE)

#make lats and lons numeric
dfm$Lat <- as.numeric(dfm$Lat)
dfm$Lon <- as.numeric(dfm$Lon)


#map the geocoded points using different colors for the school associated with the points

map <- leaflet(dfm) %>% 
addProviderTiles("CartoDB.Positron") %>%
  addCircleMarkers(
color = "purple",
stroke = FALSE, fillOpacity = 1,
popup = paste(
dfm$g_address[which(dfm$elem_sch=="CLIN")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="CLIN")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="CLIN")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="CLIN")]),
dfm$Lon[which(dfm$elem_sch=="CLIN")], dfm$Lat[which(dfm$elem_sch=="CLIN")])%>%

addCircleMarkers(
color = "red",
popup = paste(
dfm$g_address[which(dfm$elem_sch=="SB")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="SB")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="SB")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="SB")]),
stroke = FALSE, fillOpacity = 1,dfm$Lon[which(dfm$elem_sch=="SB")], dfm$Lat[which(dfm$elem_sch=="SB")])%>%

addCircleMarkers(
color = "green",
popup = paste(
dfm$g_address[which(dfm$elem_sch=="TUSC")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="TUSC")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="TUSC")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="TUSC")]),
stroke = FALSE, fillOpacity = 1,dfm$Lon[which(dfm$elem_sch=="TUSC")], dfm$Lat[which(dfm$elem_sch=="TUSC")])%>%


addCircleMarkers(
color = "yellow",
popup = paste(
dfm$g_address[which(dfm$elem_sch=="JEFF")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="JEFF")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="JEFF")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="JEFF")]),
stroke = FALSE, fillOpacity = 1,dfm$Lon[which(dfm$elem_sch=="JEFF")], dfm$Lat[which(dfm$elem_sch=="JEFF")])%>%

addCircleMarkers(
color = "blue",
popup = paste(
dfm$g_address[which(dfm$elem_sch=="MARS")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="MARS")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="MARS")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="MARS")]),
stroke = FALSE, fillOpacity = 1,dfm$Lon[which(dfm$elem_sch=="MARS")], dfm$Lat[which(dfm$elem_sch=="MARS")])%>%


addCircleMarkers(
color = "orange",
popup = paste(
dfm$g_address[which(dfm$elem_sch=="SM")], "<br>",
dfm$elem_sch[which(dfm$elem_sch=="SM")], "<br>",
dfm$mid_sch[which(dfm$elem_sch=="SM")], "<br>",
dfm$high_sch[which(dfm$elem_sch=="SM")]),
stroke = FALSE, fillOpacity = 1,dfm$Lon[which(dfm$elem_sch=="SM")], dfm$Lat[which(dfm$elem_sch=="SM")]) %>

addResetMapButton(map) %>%
addSearchGoogle(map)

setwd("/home/subudhi/james/mos")

saveWidget(map, file="mso.html", selfcontained = FALSE)



