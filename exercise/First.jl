# %%
i =1
j = 2
k= 3
@show i,j, k
# %%
@show 2i+3j-1k
@show 3i*3j-10k

mat=[1 2 3
     4 5 6]
@show mat[2,3]
@show mat[2,:]
b=3
mat2=mat .* b
@show mat2
@show mat .* mat2
s=Set([1,4,5,2,25,25,3,1,4])
@show s

for i=[1,2,3,4], j=[2,3,4,5]
    print(ifelse((i+j)%2==0,"$i,$j\n",""))
end

d = Dict("a"=>1, "b"=>2)
ditem = get(()->time(), d, "a")
@show ditem
@show d["b"]
@show (1,2)
@show (3,)

baz(a,b)=a+b
args=[1,2]
@show baz(args...)
#baz(args) <- ERROR, because
#             args is not expanded
