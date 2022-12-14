# Función de verosimilitud
poisson_logL = function(beta,y,X){
  # asumimos que beta es un vector 
  # beta = [beta0 beta1 .. betak]
  
  n = length(y)
  suma = 0
  for (i in 1:n){
    lambda_i = exp(sum(beta*X[i,]))
    suma = suma + y[i]*log(lambda_i) - lambda_i - log(factorial(y[i])) 
  }
  return(suma)
}
#----------------------------------------------------------
# gradiente de la función de verosimilitud
poisson_grad = function(beta,y,X){
  X = as.matrix(X)
  n = length(y)
  y = matrix(y, nrow = n, ncol = 1)
  lambda = matrix(0, nrow = n, ncol = 1)
  for (i in 1:n){
    lambda[i,1] = exp(sum(beta*X[i,]))
  }
  grad = t(X) %*% (y - lambda)
  return(grad)
}
#--------------------------------------------------------
# Hessiano de la matriz de verosimilitud
poisson_hess = function(beta,X){
  X = as.matrix(X)
  n = nrow(X)
  W = matrix(0, nrow = n, ncol = n)
  for (i in 1:n){
    W[i,i] = lambda_i = exp(sum(beta*X[i,]))
  }
  hess = - t(X) %*% W %*% X
  return(hess)
}
# -----------------------------------------------------------
poisson_logL_optim = function(beta,y,X){
  logL = poisson_logL(beta,y,X)
  return(-logL)
}



