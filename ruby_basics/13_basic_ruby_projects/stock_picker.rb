def stock_picker(array)

    differences = {}

    j = 0
    while j < array.length

        i = j + 1
        while i < (array.length - 1)
            differences["#{j},#{i}"] = (-array[j] + array[i])

            i += 1
        end

        j += 1
    end

    sorted_values = differences.sort_by{|key, value| value}

    sorted_values[sorted_values.length - 1][0].split(",").map! {|element| element.to_i}

end

stock_picker([17,3,6,9,15,8,6,1,10])