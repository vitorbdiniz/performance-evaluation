
regression <- function(data){
  ols = lm(y ~ X, data)
  return(ols)
}

gen_list <- function(){
  v = c(1:1000000)
  for(i in 1:length(v)){
    v[i] = 1/sample(1:100, 1)[1]*v[i] + v[i]
  }
  return(v)
}


main <- function(){

  X = c(1:1000000)
  y = gen_list()
  exec_time_list = c()
  data <- data.frame(
    X = X,
    y = y
  )
  print("Dale")
  
  for(i in 1:1000){
    print(i)
    start_time <- Sys.time()
    f = regression(data)
    end_time <- Sys.time()
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
  }
  print(median(exec_time_list))
  
}

