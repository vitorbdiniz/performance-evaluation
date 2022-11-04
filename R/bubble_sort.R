bubble_sort <- function(list_){
  for(i in 1:1000){
    for(j in i+1:1000){
      t = list_[i]
      list_[i] = list_[j]
      list_[j] = t
    }
  }
}


main <- function(){
  
  X = sample(1:1000)
  exec_time_list = c()
  for(i in 1:100){
    print(i)
    data = X
    start_time <- Sys.time()
    f = bubble_sort(data)
    end_time <- Sys.time()
    exec_time = end_time - start_time
    exec_time_list = append(exec_time_list, exec_time)
  }
  print(median(exec_time_list))
  
}

main()
