using Plots

gr()
f1(x)=sin(x)
f2(x)=cos(x)
f3(x)=sin(x)^2
α=-2π
x=α:0.2:2π #Array
y1=f1.(x)   #Array Initialize with f
y2=f2.(x)   #. means 'execute calculation for all elements of array.'
y3=f3.(x)
plot(x,y1)

plot!(x,[y2,y3])
