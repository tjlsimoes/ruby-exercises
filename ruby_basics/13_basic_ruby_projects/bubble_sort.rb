def bubble_sort(array)
    j = 0
    while j < array.length do

        i = 0
        while i < (array.length - 1) do

            if array[i] > array[i + 1]
                greater = array[i]
                smaller = array[i + 1]
                array[i] = smaller
                array[i + 1] = greater
            end

            i += 1
        end

        j += 1
    end

    array
end

bubble_sort([4,3,78,2,0,2])
   