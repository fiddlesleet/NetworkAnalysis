# Marriage and Power in 15th century Florence

# Early Renaissance Florence was ruled by an 
# oligarchy of powerful families. By the 15th
# century, the Medicis emerged supreme, and the 
# Medici Bank became the largest in Europe. 

# How did the Medici win?
# Political ties were established via marriage. 
# The adjacency matrix for the 16 most powerful
# families in Florence shown in the following 
# includes a one whenever two families were connected 
# in marriage. This adjacency matrix represents an
# undirected graph. A graphical representation of the 
# network, created with the R package igraph, is shown.

# The data set analyzed here has been compiled from 
# extensive data collected by John Padgett. The data 
# includes information on families who were locked in
# a struggle for political control of the city of Florence
# around 1430. Two factions were dominant in this struggle:
# one revolved around the infamous Medicis, the other
# around the powerful Strozzis. 

library(igraph) 
library(haven)
library(readr)

# adjacency matrix of marital alliances between Florence's 
# 16 most powerful families
url <- "https://raw.githubusercontent.com/fiddlesleet/Network-Analysis/master/marriage-and-power/firenze.csv"
firenze <- read_csv(url)
str(firenze)
head(firenze)

# create adjacency matrix:
marriage <- graph.adjacency(florence, mode="undirected", diag=FALSE)

# plot the network
set.seed(1)
plot(marriage,layout=layout.fruchterman.reingold,
     vertex.label=V(marriage)$name,vertex.color="red",
     vertex.label.color="black", vertex.frame.color=0,
     vertex.label.cex=1.5)

# note the centrality of families with high degree
data.frame(V(marriage)$name, degree(marriage))

# A deeper measure of network structure is obtained 
# through betweenness. Betweenness is a centrality
# measure of a node (or vertex) within a graph. 

# Nodes that occur on many shortest paths between
# other nodes have higher betweenness than those 
# that do not.

## calculate and plot the shortest paths
data.frame(V(marriage)$name, betweenness(marriage))

# Betweenness versus Degree. The Medici have the highest 
# degree (largest number of edges), but only by a factor 
# of 3/2 over the Strozzi's. But the Medici's betweenness
# (47.5) is five times higher than that of the Strozzi 
# (9.33). 

# Betweenness measures total graph connectivity, rather 
# than counting the next door neighbors.

