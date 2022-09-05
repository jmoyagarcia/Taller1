require(Rcpp)
cppFunction('NumericMatrix mmult1(NumericMatrix a, NumericMatrix b) {
  int arow = a.nrow();
  int brow = b.nrow();
  NumericMatrix out = no_init_matrix(a.ncol(), arow + brow);
  for (int j = 0; j < arow + brow; j++) {
    if (j < arow) {
      out(_, j) = a(_, j);
    } else {
      out(_, j) = b(_, j - arow);
    }
  }
  return out;
}')

set.seed(42)
a <- matrix(rnorm(1e7), 1e3)
b <- matrix(runif(1e7), 1e3)

identical(mmult1(a, b), mmult1(a, b))
