using BenchmarkTools;

function ForLinearSearch(list::Vector{Int64}, element::Int64) ::Bool
    for elem in list
        if elem == element
            return true;
        end
    end
    return false;
end

function InLinearSearch(list::Vector{Int64}, element::Int64) ::Bool
    return element in list;
end

function main()
    list::Vector{Int64} = [x for x in 0:1000000-1 if x%2==0];
    items::Vector{Int64} = [x for x in 0:1000-1];
    exec_times::Vector{Float64} = zeros(1000);
    for i in 1:length(items)
        item = items[i];
        result = @timed InLinearSearch(list, item);
        println(result);
        exec_times[i] = result.time;
    end
    println(exec_times);
    println(median(exec_times));

end


main();