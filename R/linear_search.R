for_linear_search <- function(list, element){
  for (e in list){
    if(e == element){
      return(TRUE)
    }
  }
  return(FALSE)
}


in_linear_search <- function(list, element){
  return(element %in% list)
}


main <- function(){
  list = c(1:1000000)
  list = subset(list, list%%2 == 0)
  items = c(1:1000)
  exec_time_list = c()
  for(item in items){
    start_time <- Sys.time()
    found = for_linear_search(list, item)
    end_time <- Sys.time()
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
  }
  print(median(exec_time_list))
  exec_time_list = c()
  for(item in items){
    start_time <- Sys.time()
    found = in_linear_search(list, item)
    end_time <- Sys.time()
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
  }
  print(median(exec_time_list))
}

