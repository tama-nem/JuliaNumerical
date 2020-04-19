include("../openfile.jl")
using DataFrames

#println("")
data, header = IO_CSV.readCSV("JuliaNumerical/exercise/sample.csv"; header=true)
df = DataFrame(data, header)
#println(df)

IO_CSV.writeCSV("JuliaNumerical/exercise/writetest.csv", data)

#println("")
#println("Example of Type Converting")
data2, header2 = IO_CSV.readCSV("JuliaNumerical/exercise/test.csv"; header=true)
parsed = IO_CSV.convert(data2, Dict(1=>Int16))
#println(DataFrame(parsed))

#println("")
#println("Example of header=false")
data3, header3 = IO_CSV.readCSV("JuliaNumerical/exercise/test.csv")
df3 = DataFrame(data3)
#println(df3)


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
