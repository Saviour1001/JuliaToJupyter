module JuliaToJupyter

# Write your package code here.
using JSON
f = open("test\\Test_1.jl","r")
file = open("writing files\\Test_1.ipynb","w")
squareBrackets="[]"
curlyBrackets="{}"
while !eof(f)
    s = readline(f)
    if (s[1]=='#')
        println("Its a comment")
        line = Dict(
            "cell_type"=>"markdown",
            "metadata"=>curlyBrackets,
            "source"=>"[$s]"
            )
        json_object = json(line,4)
        write(file,json_object)
    else
        println("Its a code line")
        line = Dict(
            "cell_type"=>"code",
            "execution_count"=>"null",
            "metadata"=>curlyBrackets,
            "outputs"=>squareBrackets,
            "source"=>"[$s]"
        )
        json_object = json(line,2)
        write(file,json_object)
    end
end
close(f)
close(file)
end
