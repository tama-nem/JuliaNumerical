# Question 1.7.2
function my_lists(number)
    return Array(1:number)
end

@show my_lists.([1,2,4])
@show my_lists.([0])

# Question 1.7.3
# Cannot use map for Dictionary???
function value(dic1, dic2)
    pushed=Dict()
    for k in keys(dic1)
        pushed[k]=dic2[dic1[k]]
    end
    return pushed
end

dict1 = Dict(0 => "a", 1 => "b")
dict2 = Dict("a" => "apple" , "b" => "banana")
@show value(dict1, dict2)


# Question 1.7.12
function trans_form(a,b,z)
    return a*z+b
end

L=[5im, 1im, -2+3im]
@show trans_form.(2im,2im-2,L)
