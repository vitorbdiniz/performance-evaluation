factorial <- function(n){
  if(n == 0) return(1)
  else return(n*factorial(n-1))
}

fibonacci <- function(n){
  if(n <= 1) return(n)
  else return(fibonacci(n-1)+fibonacci(n-2))
}

main <- function(){
  list = c(1000:2000)
  exec_time_list = c()
  for(item in list){
    start_time <- Sys.time()
    f = factorial(item)
    end_time <- Sys.time()
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
  }
  print("Factorial median time:")
  print(median(exec_time_list))
  
  list = c(40:40)
  exec_time_list = c()
  for(item in list){
    start_time <- Sys.time()
    f = fibonacci(item)
    end_time <- Sys.time()
    print(f)
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
    
  }
  
  print("Fibonacci median time")
  print(median(exec_time_list))
}
main()
