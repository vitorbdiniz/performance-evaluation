using BenchmarkTools;
using DataFrames;
using GLM;


function regression(X::Matrix{Float64}, y::Vector{Float64})
    ols = lm(X, y);
    return ols;
end

randGenerator()::Float64 = rand([1/x for x in 1:100]);
randVec()::Vector{Float64} = [x+(x*randGenerator()) for x in 0:1000000, y in 0:1];

function measure_regression()
    X::Matrix{Float64} = hcat([x+(x*randGenerator()) for x in 0:1000000]);
    y::Vector{Float64} = [x for x in 0:1000000];
    #data::DataFrame = DataFrame(X=X, y=y);
    #data::Vector{Float64, 2} = randVec();
    data = randVec();
    exec_times::Vector{Float64} = zeros(1000);
    for i in 1:length(exec_times)
        println(i);
        result = @timed regression(X, y);
        exec_times[i] = result.time;
    end
    println(median(exec_times));

end


function main()
    measure_regression();
end


main()
