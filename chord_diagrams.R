# Claire Malley
# November 30, 2016

# Description of data: y = RNA transcript IDs from the moss species Physcomitrella patens. x1, x2, and x3 are three programs that made orthogroups of different sizes. The values are number of total transcripts in the orthogroup where the transcript is found.

install.packages("circlize")
install.packages("data.table")
library(circlize)
library(data.table)

# fread() is a much faster function to read extremely large data files than read.table(). It gives a progress meter while it reads and total time spent after all data is read.

chord_data <- fread("chord_diagram_data.csv", sep=",", header=T, stringsAsFactors = F, data.table =F)
row.names(chord_data) <- chord_data$y
chord_data <- chord_data[,c(-1)]

# Here we reorganize the data into 2D matrices.

matrix1 <- data.frame(chord_data$x1, chord_data$x2)
matrix2 <- data.frame(chord_data$x2, chord_data$x3)
matrix3 <- data.frame(chord_data$x1, chord_data$x3)

# Make three chord diagrams for each comparison. Colors are randomized each run.
chordDiagram(matrix1)
chordDiagram(matrix2)
chordDiagram(matrix3)
