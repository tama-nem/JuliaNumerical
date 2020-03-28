a = 1:10
inta = Int('a')
b='a':'j'
c=zip(a,b)
d=[ar for ar=zip(a,b)] #やっぱ内包表記嫌い。=じゃないじゃん。
@show d
dic = Dict((k,v) for (k,v)=zip(a,b))
@show dic
