require(Rcpp)
cppFunction('NumericMatrix mmult(const NumericMatrix& m1, const NumericMatrix& m2){
if (m1.ncol() != m2.nrow()) stop ("Dimiensiones incompatibles de las matrices");
NumericMatrix out(m1.nrow(),m2.ncol());
NumericVector rm1, cm2;
for (size_t i = 0; i < m1.nrow(); ++i) {
    rm1 = m1(i,_);
    for (size_t j = 0; j < m2.ncol(); ++j) {
      cm2 = m2(_,j);
      out(i,j) = std::inner_product(rm1.begin(), rm1.end(), cm2.begin(), 0.);
    }
  }
return out;
}')

A <- matrix(c(1:6),ncol=2)
B <- matrix(c(0:7),nrow=2)
mmult(A,B)
