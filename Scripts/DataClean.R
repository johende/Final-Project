# Reading strava data-----------------------------------------------------------

strdata <- process_data("Data - Raw/export_15640207/activities")

#write_csv(strdata, file = "Data - Clean/jhStravaData.csv")

# Filtering strava data

strdata.f <- strdata %>% 
  filter(time < as.Date("2019-07-09", "%Y-%m-%d"))


# Getting OSM (map) data--------------------------------------------------------

# bbox:
# 37.7942 ylat, -122.1285 xlon
# 37.977, -122.3071

# Loading the streets

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

# Loading parks etc.

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

uni <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "amenity", value = "university") %>% 
  osmdata_sf()

# Loading water features

water <- opq(bbox = c(-122.3071, 37.7942, -122.1285, 37.977)) %>% 
  add_osm_feature(key = "water") %>% 
  osmdata_sf()


# Unused First Attempt----------------------------------------------------------

# Reading map data

#map <- readOGR(
#  dsn = "Data - Raw/stanford-cr876kn5514-shapefile",
#  layer = "cr876kn5514",
#  verbose = FALSE)

#streets <- readOGR(
#  dsn = "Data - Raw/Streets Network",
#  layer = "geo_export_fa2eacd0-3acd-425f-abe7-f8fdbcbd4020",
#  verbose = FALSE)

#map.f <- tidy(map)
#streets.f <- tidy(streets)

#write_csv(streets.f, "Data - Clean/BerkeleyStreets.csv")
#write_csv(map.f, "Data - Clean/CaliShapefileInfo.csv")


# Mapping bounds

#minlong <- -122.28082120798122
#maxlong <- -122.20019252744733

#minlat <- 37.847318026685656
#maxlat <- 37.91044827457767

#map.f.filter <- map.f %>% 
#  filter(long >= minlong & long <= maxlong & lat >= minlat & lat <= maxlat)
#streets.f.filter <- streets.f %>% 
#  filter(long >= minlong & long <= maxlong & lat >= minlat & lat <= maxlat)




