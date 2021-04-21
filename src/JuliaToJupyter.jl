module JuliaToJupyter

# Write your package code here.
f = open("test\\Test_1.jl","r")
line = 0
while !eof(f)
    s = readline(f)
    line+=1

    if (s[1]=='#')
        println("Its a comment!!")
    else
        println("Its a code line")
    end


end

end
