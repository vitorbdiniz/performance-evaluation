using BenchmarkTools;

function factorial(n::Int64) ::Int64
    if n == 0
        return 1;
    end
    return n*factorial(n-1);
end

function fibonacci(n::Int64) ::Int64
    if n <= 1
        return 1;
    end
    return fibonacci(n-1) + fibonacci(n-2);
end

function measure_factorial()
    list::Vector{Int64} = [x for x in 1000:2000-1];
    exec_times::Vector{Float64} = zeros(1000);
    for i in 1:length(list)
        item = list[i];
        result = @timed factorial(item);
        exec_times[i] = result.time;
    end
    println(median(exec_times));

end


function measure_fibonacci()
    n::Int64 = 40;
    result = @timed fibonacci(n);
    println(result.time);
end

function main()
    measure_factorial();
    measure_fibonacci();

end

main()