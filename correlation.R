# Compute the correlation coefficient between the cost per Mb and the cost per genome 
cor(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome)

plot(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, main = "Scatterplot of Cost per Mb and Cost per Genome", xlab = "Cost per Mb", ylab = "Cost per Genome")

# Add a trendline to the scatterplot
abline(lm(genome_s$Cost.per.Genome ~ genome_s$Cost.per.Mb), col = "#e56d72")

# Calculate the Spearman or Kendall correlation coefficients
cor.test(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, method = "spearman")
cor.test(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, method = "kendall")
