
cor(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome)

plot(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, main = "Scatterplot of Cost per Mb and Cost per Genome", xlab = "Cost per Mb", ylab = "Cost per Genome")

abline(lm(genome_s$Cost.per.Genome ~ genome_s$Cost.per.Mb), col = "#e56d72")

cor.test(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, method = "spearman")
cor.test(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, method = "kendall")
