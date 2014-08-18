
# Run some tests:
print("Create matrix")
mat1 <- makeCacheMatrix( matrix (runif(1000000, max = 800),1000,1000))
print("Solve without cache")
matSolved <- cacheSolve(mat1)
print("Cache should be there")
matSolved <- cacheSolve(mat1)

print("Error situations")
mat1 <- makeCacheMatrix(matrix (runif(100),50,2))
try(matSolved <- cacheSolve(mat1))

mat1 <- makeCacheMatrix(c(2,3,4))
try(matSolved <- cacheSolve(mat1))

mat1 <- makeCacheMatrix(matrix())
try(matSolved <- cacheSolve(mat1))

mat1 <- makeCacheMatrix(data.frame())
try(matSolved <- cacheSolve(mat1))

m1 <- matrix(c(10,20,3,4),2,2)
solve(m1)

m2 <- matrix(c(1,2,60,100),2,2)
solve(m1,m2)

> cm <- makeCacheMatrix(m1)
cacheSolve(cm)
cacheSolve(cm, m2)
