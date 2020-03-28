using Plots

function add2(vec1, vec2)
    return (vec1 .+ vec2)
end

function add_2(line1, line2)
    return line1 + line2
end

function plotXY(array2D)
    plot(array2D[:,1], array2D[:,2],st=:scatter)
end

# まずpython風に配列定義
# のちに書くが、この方法あんまり良くない
L=[[2,2],[3,2],[1.75,1], [2,1], [2.25,1], [2.5,1],
   [2.75,1],[3,1],[3.25,1]]

# functionなしでも、2次元配列への1次元ベクトル演算はこれでできてしまう
# まるきりpythonだな
ans = [item + [1,2] for item in L]

# あえてfunction
ans = ([add2.(item, [1,2]) for item in L])
# で、ansをplotしてみるとX軸が1と2指定された変な折れ線になるはず。
# 元々plotはX座標配列とY座標配列を与えるものなので、
# そのような配列を作る
X = [i[1] for i in ans]
Y = [i[2] for i in ans]
@show X,Y
#あとは
#plot(X,Y, st=scatter)
#これX,Yへの代入をもっと簡単にできないかな

# よりJuliaらしい行列定義。
# ここら辺の配列定義の考え方は結構複雑っぽいので
# julia 1.4.0.pdfのp.243からを見てくれ。
L=[2 2; 3 2; 1.75 1; 2 1; 2.25 1; 2.5 1; 2.75 1; 3 1; 3.25 1]
# これで 9×2 Array{Float64,2}:
# 2.0   2.0
#  ...
# 3.0   1.0
# 3.25  1.0

# ベクトル加算は
K=add_2.(L, [1 2]) #または
K= L .+ [1 2]
#で、行ごとの取り出しの技が使える
 #plot(K[:,1], K[:,2],st=:scatter)
#なんだけど、だるいので、これこそfunction化
plotXY(L .+ [1 2])
# これでKなんて変数使わず1行。いいでしょう。
