using Plots

function scalar_vector_mult(alpha, v)
	v * alpha
end

exam = [1 3 5 2]
@show scalar_vector_mult(5, exam)

# section 2.5.3 p.89-------------------
# これでも行列定義可能だが
# v = [3 2]
# K = Array(-1:0.01:1)
# xy= K * v

# 二重の内包だと
#（forのイタレーションの順番に注意。
#  行イタレーションが先）
v  = [3 2]
xy = [v[i]*k for k in -1:0.01:1, i in 1:2]
#ま、いまのところはどっちもどっちかな

plot(xy[:,1],xy[:,2],st=:scatter)
# plot(zip(xy),st=:scatter) # 二つの配列でないため、こうはできない

savefig("2_5_3.png")

# section 2.6.1 p.92------------------
# これが内包表記だとどうなるかな
v2 = [0.5 1]
xy2 = xy .+ v2
plot(xy2[:,1], xy2[:,2],st=:scatter)
savefig("2_6_1.png")
