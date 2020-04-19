include("../openfile.jl")
using DataFrames
using .IO_CSV

println("")
data, header = readCSV("JuliaNumerical/exercise/sample.csv"; header=true)
df = DataFrame(data, header)
println(df)

writeCSV("JuliaNumerical/exercise/writetest.csv", data)

println("")
println("Example of Type Converting")
data2, header2 = readCSV("JuliaNumerical/exercise/test.csv"; header=true)
parsed = convertColumn(data2, Dict(1=>Int16))
println(DataFrame(parsed))

println("")
println("Example of header=false")
data3, header3 = readCSV("JuliaNumerical/exercise/test.csv")
df3 = DataFrame(data3)
println(df3)


#現在、CSVモジュールは使用できない？？-----------------

#df = CSV.read("JuliaNumerical/exercise/sample.csv")
#@show df

# |>は関数チェーンに使うそうです。
# f(x)とするところを x |> f とか
# x |> arg->arg.^2などと書けるみたい。
# 実際
#  CSV.write("outputCSV.csv", df, delim=",", writeheader=true)
# でも動く。（しかし、引数dfを最初に持ってきてはダメらしい。
# どうやら、|>が使える引数がどれかは決まっており、それは1番目とは限らない。）
#df |> CSV.write("JuliaNumerical/exercise/outputCSV.csv", delim=",", writeheader=true)
