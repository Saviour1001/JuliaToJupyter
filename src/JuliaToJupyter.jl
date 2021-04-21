module JuliaToJupyter

# Write your package code here.
using JSON
f = open("test\\Test_1.jl","r")
file = open("writing files\\Test_1.ipynb","w")
while !eof(f)
    s = readline(f)
    if (s[1]=='#')
        println("Its a comment")
        line = Dict("cell_type"=>"markdown","metadata"=>"{}","source"=>"[$s]")
        json_object = json(line)
        write(file,json_object)
    else
        println("Its a code line")
    end
end
close(f)
close(file)
end
