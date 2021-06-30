test = data.frame(chrom=character(),start=integer(),end=integer(),probes=character(),sd_C=double())
rDMR = apply_func(new_regions,1,function(l){
  chr = l[[1]]
  st = as.numeric(l[[2]])
  stop = as.numeric(l[[3]])
  nr1 = subset(ewas, chrom == chr & start >= st & end <= stop)
  nr1 = nr1[,c(1:4,8)]
})

for (i in 1:length(rDMR)){
  nr = data.frame(rDMR[i])
  colnames(nr) = colnames(test)
  test = rbind(test,nr)
}
ewas_test = ewas[,colnames(test)]
ewas_test = anti_join(ewas_test,test)

test$type = "DMR"
ewas_test$type = "Other"

compar = wilcox.test(ewas_test$sd_C, test$sd_C, paired=F)

boxplot(ewas_test$sd_C, test$sd_C, las=2, border=c(2,4))
#ewas_j = rbind(test,ewas_test)
#m.ewas_j = melt(ewas_j,id.var="type")
#m.ewas_j = m.ewas_j[m.ewas_j$variable=="sd_C",]
#p6 = ggplot(m.ewas_j, aes(x=type,y=value)) + geom_boxplot(aes(fill=variable))
#print(p6)
#p7 = boxplot(type ~ value, m.ewas_j)
#print(p7)