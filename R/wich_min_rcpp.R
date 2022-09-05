require(Rcpp)
cppFunction('IntegerVector which_minCpp1(NumericVector v) {
  double m = Rcpp::min(v);
  Rcpp::IntegerVector res( v.size() );

  int i;
  int counter = 0;
  for( i = 0; i < v.size(); ++i) {
    if( v[i] == m ) {
      res[ counter ] = i;
      counter++;
    }
  }
  counter--;
  Rcpp::Range rng(0, counter);
  return res[rng];
}')

v = c(1,2,3,1,2,3)

which_minCpp1(v)
