a=(1,4,1,2,5,6) #Tuple: Unchangable, but it can contain duplicate items.
for i in a
  if i<2
    println("$(i) less than 2")
  elseif i<4
    println("2 <= $i < 4")
  else
    println("4 <= $i")
  end
end
