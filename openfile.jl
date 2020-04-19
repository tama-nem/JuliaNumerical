module IO_CSV
    function readCSV(path; header=false)
        # Open/CLose File
        lines=""
        open(path, "r") do readf
            # Generate Splited Lines
            lines = readlines(readf)
        end

        # Reshape Strings
        linesrep = replace.(lines, ["\""=> ""])
        lsplit = split.(linesrep, ",")

        if header
            h = Symbol.(lsplit[1])
            lsplit_dim = lsplit[2:end]
        else
            h=[]
            lsplit_dim = lsplit
        end

        # Convert to 2-Dim Matrix
        # So that we can reconvert it to dataframe.
        ltr = reshape.(lsplit_dim, 1, length(lsplit_dim[1]))
        arr = vcat(ltr...)

        return arr, h
    end

    function writeCSV(path, matrix)
        open(path, "w") do out
            for li in 1:(size(matrix,1))
                line_arr = [matrix[li, i] for i in 1:(size(matrix,2))]
                joined = join(line_arr, ",")
                println(out,joined)
            end
        end
    end

    function convert(matrix, type)
        ans_ar=[]
        for col in 1:(size(matrix,2))
            if haskey(type, col)
                col_data = [parse(type[col], matrix[lin,col]) for lin in 1:(size(matrix,1))]
            else
                col_data = [matrix[lin,col] for lin in 1:(size(matrix,1))]
            end
            push!(ans_ar, col_data)
        end

        #ans_res = reshape.(ans_ar, 1, length(ans_ar[1]))
        #ans = vcat(ans_res...)
        return ans_ar
    end
end

#=
# Example of conert
A=[ "T" "3" "5"
    "U" "2.4" "2"]
using .IO_CSV
@show IO_CSV.convert(A, Dict(2=>Float16, 3=>Int16))
=#
