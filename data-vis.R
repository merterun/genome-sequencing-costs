library(ggplot2)

# Boxplot of Cost per Mb by Year
ggplot(genome_s, aes(x=year(Date), y=Cost.per.Mb)) + geom_boxplot() + 
  ggtitle("Boxplot of Cost per Mb by Year") + xlab("Year") + ylab("Cost per Mb")

# Line plot of Cost per Mb and Cost per Genome over time
ggplot(genome_s, aes(x=Date)) + 
  geom_line(aes(y=Cost.per.Mb, colour="Cost per Mb")) + 
  geom_line(aes(y=Cost.per.Genome/10000, colour="Cost per Genome (in MB)")) + # Divide the cost per genome by 10000 for better plotting on the canvas
  ggtitle("Cost per Mb and Cost per Genome over time") + xlab("Year") + ylab("Cost per Mb") + 
  scale_colour_manual(name = "Cost", values = c("red", "blue")) +
  scale_y_continuous(sec.axis = sec_axis(~.*1000000, name="Cost per Genome"))



# Heatmap of Cost per Mb and Year:
ggplot(genome_s, aes(x=year(Date), y=month(Date))) + 
  geom_tile(aes(fill=Cost.per.Mb)) + 
  scale_fill_gradient(low = "white", high = "red") + 
  ggtitle("Heatmap of Cost per Mb and Year") + xlab("Year") + ylab("Month")
