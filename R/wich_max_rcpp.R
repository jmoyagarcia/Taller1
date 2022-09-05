require(Rcpp)
cppFunction('IntegeVector which_maxCpp(NumericVector v) {
  double m = Rcpp::max(v);
  Rcpp::IntegerVector res( v.size() );

  int i;
  int contador = 0;
  for( i = 0; i < v.size(); ++i) {
    if( v[i] == m ) {
      res[ contador ] = i;
      contador++;
    }
  }
  contador--;
  Rcpp::Range rng(0, contador);
  return res[rng];
}')

v = c(1,2,3,1,2,3)

which_maxCpp(v)
