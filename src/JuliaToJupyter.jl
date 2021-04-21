module JuliaToJupyter

# Write your package code here.
f = open("test\\Test_1.jl","r")
file = open("writing files\\Test_1.ipynb","w")
line = 0
while !eof(f)
    s = readline(f)
    line+=1

    if (s[1]=='#')
        println("Its a comment!!")
        write(file,"$s")
    else
        println("Its a code line")
    end


end

end
