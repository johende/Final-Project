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



ggplot() +
  geom_polygon(
    data = map.f.filter, 
    aes(x = long, y = lat, group = group),
    fill = "#69b3a2",
    colour = "white") +
  geom_path(
    data = streets.f.filter,
    aes(x = long, y = lat, group = group),
    colour = "#373c45",
    alpha = 0.5) +
  geom_path(
    data = strdata.f,
    aes(x = lon, y = lat),
    colour = "#fc6d00",
    alpha = 0.3) +
  theme_void()

ggsave("Figures/small map w strava 1st.jpg", plot = last_plot())
