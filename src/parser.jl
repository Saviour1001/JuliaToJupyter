function parser(julia,jupyter)
    f = open("test\\Test_1.jl","r")
    line = 0
    while !eof(f)
        s = readline(f)
        line+=1
        println("$line . $s")
    end

end
