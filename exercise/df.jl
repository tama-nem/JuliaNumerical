using DataFrames
using CSV

data = [1 "A" "Tama"
        2 "B" "Tamago"
        3 "C" "Aokazu"]
df = DataFrame(data)
@show df


# |>は関数チェーンに使うそうです。
# f(x)とするところを x |> f とか
# x |> arg->arg.^2などと書けるみたい。
# 実際
#  CSV.write("outputCSV.csv", df, delim=",", writeheader=true)
# でも動く。（しかし、引数dfを最初に持ってきてはダメらしい。
# どうやら、|>が使える引数がどれかは決まっており、それは1番目とは限らない。）
df |> CSV.write("JuliaNumerical/exercise/outputCSV.csv", delim=",", writeheader=true)
