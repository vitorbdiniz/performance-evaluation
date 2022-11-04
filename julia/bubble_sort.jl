using BenchmarkTools;

randGenerator()::Float64 = rand([1/x for x in 1:10000])


function bubbleSort(v::Vector{Float64})
    for i in 1:length(v)
        for j in i:length(v)
            v[i], v[j] = v[j], v[i]
        end
    end
end

function measureBubbleSort()
    X::Vector{Float64} = [x+(x*randGenerator()) for x in 0:1000];
    exec_times::Vector{Float64} = zeros(10000);
    for i in 1:length(exec_times)
        println(i);
        result = @timed bubbleSort(X);
        exec_times[i] = result.time;
    end
    println(median(exec_times));

end




function main()
    measureBubbleSort();
end


main()
