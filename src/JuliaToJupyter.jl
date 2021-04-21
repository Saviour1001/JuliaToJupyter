module JuliaToJupyter

# Write your package code here.
f = open("test\\Test_1.jl","r")
line = 0
while !eof(f)
    s = readline(f)
    line+=1
    println("$line . $s")
end

end
