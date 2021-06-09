apply_func =  apply
apply_func =  epimedtools::monitored_apply
if (!file.exists("ewas_mean.rds")) {
  ewas_mean =  apply_func(d[1:nb_probes,] , 1, function(l) {  
    # print(l)
    # l = d[1,]
    
    data =  e[colnames(d),]
    data$meth =  l
    m_AC =  lm(meth~cond, data[c(idx_A, idx_C),])
    m_BC =  lm(meth~cond, data[c(idx_B, idx_C),])
    m_DC =  lm(meth~cond, data[c(idx_D, idx_C),])
    
    fstat_AC =  summary(m_AC)$fstatistic
    fstat_BC =  summary(m_BC)$fstatistic
    fstat_DC =  summary(m_DC)$fstatistic
    
    pval_AC =  1 - pf(fstat_AC[1], fstat_AC[2], fstat_AC[3]) # anova(m_AC)[1,5]
    pval_BC =  1 - pf(fstat_BC[1], fstat_BC[2], fstat_BC[3]) # anova(m_BC)[1,5]
    pval_DC =  1 - pf(fstat_DC[1], fstat_DC[2], fstat_DC[3]) # anova(m_DC)[1,5]
    
    beta_AC =  m_AC$coef[[2]]
    beta_BC =  m_BC$coef[[2]]
    beta_C = m_DC$coef[[2]]
    beta_D = m_DC$coef[[1]]+m_DC$coef[[2]]
    
    ret <-  c(
      pval_AC = pval_AC,
      pval_BC = pval_BC,
      pval_DC = pval_DC,
      beta_AC = beta_AC,
      beta_BC = beta_BC,
      beta_C = beta_C,
      beta_D = beta_D,
      NULL
    )
    return(ret)
  }
  )
  ewas_mean = data.frame(t(ewas_mean))
  head(ewas_mean)
  saveRDS(ewas_mean, "ewas_mean.rds")
}