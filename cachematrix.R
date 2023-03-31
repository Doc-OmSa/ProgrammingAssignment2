## Put comments here that give an overall description of what your
## functions do

# Function to create a matrix with caching capabilities
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL # Initialize the inverse cache
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y # Assign the matrix to the parent environment
    inv <<- NULL # Invalidate the inverse cache
  }
  
  # Function to retrieve the matrix
  get <- function() {
    x # Return the matrix
  }
  
  # Function to retrieve the cached inverse
  getInv <- function() {
    inv # Return the inverse cache
  }
  
  # Function to compute and cache the matrix inverse
  setInv <- function(inverse) {
    inv <<- inverse # Cache the inverse
  }
  
  # Return a list of functions
  list(set = set, get = get, getInv = getInv, setInv = setInv)
}

# Function to compute the inverse of a matrix with caching capabilities
cacheSolve <- function(x, ...) {
  inv <- x$getInv() # Check if the inverse is already cached
  
  # If the inverse is not cached, compute it and cache it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...) # Compute the inverse
  x$setInv(inv) # Cache the inverse
  inv # Return the inverse
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

# The cacheSolve function returns the inverse of the matrix. This function can cache 
# the inverse of the matrix for future use. 
