a = 1:10
inta = Int('a')
b='a':'j'
c=zip(a,b)
d=[ar for ar in zip(a,b)] #
@show d
dic = Dict((k,v) for (k,v)=zip(a,b))
@show dic

