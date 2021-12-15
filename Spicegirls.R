# Load libraries
library(ggplot2)
library(pheatmap)

# Read data into R
studio_album_tracks <- as.data.frame(readr::read_csv("https://github.com/jacquietran/spice_girls_data/raw/main/data/studio_album_tracks.csv"))

#Create a subset with numeric metrics
spicegirls<-studio_album_tracks[c("danceability", "energy" ,"speechiness", "acousticness", "instrumentalness",  "liveness", "valence", "loudness", "key")]


#Heatmap
row.names(spicegirls)<-studio_album_tracks$track_name
album_df = data.frame("Album" = studio_album_tracks$album_name)
rownames(album_df) = rownames(spicegirls)
pheatmap(spicegirls,main = "Clustering the Songs of the Spice Girls", scale = "column",
         clustering_distance_rows="euclidean",
         clustering_distance_cols="euclidean",
         annotation_row = album_df)
