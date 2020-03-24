# Question:1.5.1
# Oops, I misunderstood the meaning of problem.
# But this code has valid information, so I leave it not removed.

function dec(bin_array, inv)
    ans = 0
    size = length(bin_array)
    for i in 1:5 # Not [1:5]!
        bool = parse(Bool,bin_array[i])
        degit = xor(bool, inv)
        ans += degit*2^(size-i)
    end
    return ans
end

function dec_to_chr(dec)
    return Char(dec+97)
end

# ∘ =  \circ + tab
@show (dec_to_chr∘dec).("00000", false)
@show (dec_to_chr∘dec).(["10101","00100","10101","01011","11001",
                         "00011", "01011", "10101","00100","11001","11010"], true)
