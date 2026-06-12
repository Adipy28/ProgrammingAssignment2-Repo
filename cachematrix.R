Working code:
makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL

    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

    get <- function() {
        x
    }

    setinverse <- function(inverse) {
        inv <<- inverse
    }

    getinverse <- function() {
        inv
    }

    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}

cacheSolve <- function(x, ...) {

    inv <- x$getinverse()

    if (!is.null(inv)) {
        message("getting cached inverse")
        return(inv)
    }

    data <- x$get()

    inv <- solve(data, ...)

    x$setinverse(inv)

    inv
}

Code checked on R studio Example: 

source("cachematrix.R")

A <- matrix(c(1,2,3,4), 2, 2)

m <- makeCacheMatrix(A)

cacheSolve(m)

cacheSolve(m)

Result:
    [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
> cacheSolve(m)
getting cached inverse
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
