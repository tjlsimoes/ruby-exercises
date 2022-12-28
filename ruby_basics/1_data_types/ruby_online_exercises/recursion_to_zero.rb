def down_to_zero (x)
    if x >= 0
        puts x
        down_to_zero(x-1)    
    end
end