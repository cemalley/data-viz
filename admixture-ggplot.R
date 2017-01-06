# Claire Malley
# November 30, 2016

library(ggplot2)
library(reshape2)
library(scales)

## import ADMIXTURE or STRUCTURE data ##
tbl<-read.table("Genotyping_pruned.3.Q")
melt <- melt(as.matrix(tbl), id.vars = "Var1")

tt <-theme(legend.text = element_text(size=14), legend.title=element_text(size=16), text=element_text(size=14), axis.text = element_text(size=14))

ggplot(melt, aes(Var1, value, fill = factor(Var2))) + geom_bar(position = "fill", stat = "identity") + scale_fill_manual(values=c("skyblue1","darkolivegreen3","lightcoral"), name="Population") + labs(x="Individual (n=48)", y="Ancestry", title="ADMIXTURE results with 3 inferred populations \n post QC filtering and LD pruning") + tt + theme_bw()

