module JuliaToJupyter

# Write your package code here.
f = open("test\\Test_1.jl","r")
line = 0
file = open("writing files\\Test_1.ipynb","w")
write(file,"{ \"cells\":[ ")
while !eof(f)
    line+=1
    s = readline(f)
    if (s[1]=='#')
        md = open("templates\\markdown_cell.json","r")
        println("Its a comment!!")
        println("Line Number: $line")
        while !eof(md)
            mdr = readline(md)
            write(file,"$mdr")
        end
        write(file,",")
        close(md)
    else
        cc = open("templates\\code_cell.json","r")
        println("Its a code line")
        println("Line Number: $line")
        while !eof(cc)
            ccr = readline(cc)
            write(file,"$ccr")
        end
        write(file,",")
        close(cc)
    end

end
write(file,"],")
template = open("templates\\metadata.json","r")
while !eof(template)
    metaR = readline(template)
    write(file,"$metaR")
end
write(file,"}")
close(file)
end
