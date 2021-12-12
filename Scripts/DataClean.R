# Reading map data

map <- readOGR(
  dsn = "Data - Raw/stanford-cr876kn5514-shapefile",
  layer = "cr876kn5514",
  verbose = FALSE)

streets <- readOGR(
  dsn = "Data - Raw/Streets Network",
  layer = "geo_export_fa2eacd0-3acd-425f-abe7-f8fdbcbd4020",
  verbose = FALSE)

map.f <- tidy(map)
streets.f <- tidy(streets)

#write_csv(streets.f, "Data - Clean/BerkeleyStreets.csv")
#write_csv(map.f, "Data - Clean/CaliShapefileInfo.csv")


# Mapping bounds

minlong <- -122.28082120798122
maxlong <- -122.20019252744733

minlat <- 37.847318026685656
maxlat <- 37.91044827457767

map.f.filter <- map.f %>% 
  filter(long >= minlong & long <= maxlong & lat >= minlat & lat <= maxlat)
streets.f.filter <- streets.f %>% 
  filter(long >= minlong & long <= maxlong & lat >= minlat & lat <= maxlat)


# Reading strava data

strdata <- process_data("Data - Raw/export_15640207/activities")

#write_csv(strdata, file = "Data - Clean/jhStravaData.csv")

# Filtering strava data

strdata.f <- strdata %>% 
  filter(time < as.Date("2019-07-09", "%Y-%m-%d"))


# Getting OSM data

# bbox:
# 37.7942 ylat, -122.1285 xlon
# 37.977, -122.3071

strts <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "highway", value = "primary") %>% 
  osmdata_sf()

strts2 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "highway", value = "secondary") %>% 
  osmdata_sf()

strts3 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "highway", value = "tertiary") %>% 
  osmdata_sf()

strts4 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "highway", value = "residential") %>% 
  osmdata_sf()

hghwy <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "highway", value = "motorway") %>% 
  osmdata_sf()

parks <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "leisure", value = "nature_reserve") %>% 
  osmdata_sf()

parks2 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "leisure", value = "park") %>% 
  osmdata_sf()

parks3 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "boundary", value = "protected_area") %>% 
  osmdata_sf()

parks4 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "landuse", value = "cemetery") %>% 
  osmdata_sf()

water <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "water") %>% 
  osmdata_sf()

water2 <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "water", value = "reservoir") %>% 
  osmdata_sf()

uni <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "amenity", value = "university") %>% 
  osmdata_sf()

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
    alpha = 0.3) +
  theme_void()

ggsave("Figures/revised map 1st draft.jpg", plot = last_plot())
