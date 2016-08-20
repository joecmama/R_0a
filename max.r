find.max <- function(x)
{
  n <- length(x)
  x.m <- x[1]
  ix.m <- 1
  for (i in 2:n)
  {
    if (x[i] > x.m)
    {
      x.m <- x[i]
      ix.m <- i
    }
  }
  list(max = x.m, index.max = ix.m)
}
