# Plotting the map and overlaying the Strava data-------------------------------

ggplot() +
  geom_sf(strts$osm_lines, 
          mapping = aes(colour = I("gray25")), size = 0.5) +
  geom_sf(strts2$osm_lines, 
          mapping = aes(colour = I("gray25")), size = 0.3) +
  geom_sf(strts3$osm_lines, 
          mapping = aes(colour = I("gray25")), size = 0.2) +
  geom_sf(hghwy$osm_lines, 
          mapping = aes(colour = I("gray25")), size = 0.8) +
  geom_sf(strts4$osm_lines, 
          mapping = aes(colour = I("gray25")), size = 0.1) +
  geom_sf(parks$osm_polygons, 
          mapping = aes(fill = I("#5ed450"), 
                        colour = I("#5ed45000")),
          alpha = 0.5) +
  geom_sf(parks2$osm_polygons, 
          mapping = aes(fill = I("#48a33e"), 
                        colour = I("#48a33e00")),
          alpha = 0.5) +
  geom_sf(parks$osm_multipolygons, 
          mapping = aes(fill = I("#5ed450"), 
                        colour = I("#5ed45000")),
          alpha = 0.5) +
  geom_sf(parks2$osm_multipolygons, 
          mapping = aes(fill = I("#48a33e"), 
                        colour = I("#48a33e00")),
          alpha = 0.5) +
  geom_sf(parks3$osm_polygons, 
          mapping = aes(fill = I("#25783f"), 
                        colour = I("#25783f00")),
          alpha = 0.8) +
  geom_sf(parks3$osm_multipolygons, 
          mapping = aes(fill = I("#25783f"), 
                        colour = I("#25783f00")),
          alpha = 0.8) +
  geom_sf(water$osm_polygons, 
          mapping = aes(fill = I("#77d1ed"), 
                        colour = I("#77d1ed00")),
          alpha = 0.8) +
  geom_sf(water$osm_multipolygons, 
          mapping = aes(fill = I("#77d1ed"), 
                        colour = I("#77d1ed00")),
          alpha = 0.8) +
  geom_sf(uni$osm_multipolygons, 
          mapping = aes(fill = I("#0b5730"), 
                        colour = I("#0b573000")),
          alpha = 0.8) +
  geom_path(
    data = strdata.f,
    aes(x = lon, y = lat),
    colour = "#fc6d00",
    alpha = 0.4) +
  coord_sf(xlim = c(-122.3071, -122.1285),
           ylim = c(37.7942, 37.977)) +
  theme_void()


# Saving the plot as a jpg

#ggsave("Figures/Final Map.jpg", plot = last_plot())



# Unused First Attempt ----------------------------------------------------

#ggplot() +
#  geom_polygon(
#    data = map.f.filter, 
#    aes(x = long, y = lat, group = group),
#    fill = "#69b3a2",
#    colour = "white") +
#  geom_path(
#    data = streets.f.filter,
#    aes(x = long, y = lat, group = group),
#    colour = "#373c45",
#    alpha = 0.5) +
#  geom_path(
#    data = strdata.f,
#    aes(x = lon, y = lat),
#    colour = "#fc6d00",
#    alpha = 0.3) +
#  theme_void()
