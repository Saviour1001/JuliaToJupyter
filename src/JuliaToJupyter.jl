module JuliaToJupyter

# Write your package code here.
using JSON
f = open("test\\Test_1.jl","r")
file = open("writing files\\Test_1.ipynb","w")
start = "{ \n \"cells\": [\n"
finish = "],"
write(file,start)
while !eof(f)
    s = readline(f)
    if (s[1]=='#')
        println("Its a comment")
        line = Dict(
            "cell_type"=>"markdown",
            "metadata"=>"{}",
            "source"=>"[$s]"
            )
        json_object = json(line,4)
        write(file,json_object)
    else
        println("Its a code line")
        line = Dict(
            "cell_type"=>"code",
            "execution_count"=>"null",
            "metadata"=>"{}",
            "outputs"=>"[]",
            "source"=>"[$s]"
        )
        json_object = json(line,2)
        write(file,json_object)
    end
end
write(file,finish)
metadata_template = open("templates\\metadata.json")
while !eof(metadata_template)
    s = readline(metadata_template)
    write(file,s)
end
write(file,"}")
close(f)
close(file)
end
