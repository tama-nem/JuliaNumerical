using Plots

function segment(pt1, pt2)
#=
	内包表記を二重で利用する
	例：mat = [ 10a + b for a in 0:2, b in 0:3]
		3×4 Array{Int64,2}:
		  0   1   2   3
		 10  11  12  13
		 20  21  22  23
=#
	return [pt1[i]*a+pt2[i]*(1-a) for a in 0:0.01:1, i in 1:2]
end

conv_couple=segment([3.5,3],[0.5,1])
plot(conv_couple[:,1],conv_couple[:,2],st=:scatter)
savefig("2_6_9.png")