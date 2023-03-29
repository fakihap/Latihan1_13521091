class Matrix
    def initialize(w, h)
        @width, @height = w, h
    end

    def setMatrix(array)
        if array.length > 0 and array[0].length > 0
            @height = array.length
            @width = array[0].length

            @array = array
        else
            puts "WARNING : failed to setMatrix"
        end
    end

    def describe()
        puts "width is #{@width}", 
             "height is #{@height}"
    end
end