using Plots
#Unnessecary---
gr()
# -------------

# 1.4 complex

z=3+4im
@show conj(z)

# Sometimes function 'plot' constrains our arguments
# to have exact type like Flot32, Int64, or so on.
ar = Array{Complex{Float32}}(undef, 4,4)

# "Array" and "Matrix", or "Vector" have just same meaning. that is,
# You can write like below, instead of above sentence.
#   ar = Matrix{Complex{Float32}}(undef, 4,4)

#Funcion 'plot' reads 2d-Array for vertical(column) direction.
#So we stack data for same dilection
#(That is, not [1, :], but [:, 1]).
ar[:, 1] = [1.2+2im, 3+1.4im, 4-3.5im, 6im]

for i in (2:4)
    ar[:,i] = ar[:, i-1] .* 1im

    # Doesn't work!?
    #plot!(ar[:, i]; seriestype=:scatter)
end
plot(ar; seriestype=:scatter)

@show ℯ^(π * im) # This ℯ can be written with typing \euler{Tab}.

function euler(x)
    ℯ^(2π*im/Float16(x))
end

ary = [1,2,3,4,5,6,7,8,9,10]
# If you want Float or Complex Array,
# It is good to define original function.
eulered =  euler.(ary)
@show eulered
plot(eulered)
