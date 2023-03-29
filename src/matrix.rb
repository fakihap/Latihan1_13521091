class Matrix
    def initialize(size)
        @size = size
    end

    def setMatrix(array)
        if isSquare(array)
            @size = array.length

            @array = array
        else
            puts "WARNING : failed to setMatrix"
        end
    end

    def isSquare(array)
        len = array.length

        for i in array do
            if i.length != len
                return false
            end
        end

        return true
    end

    def describe()
        puts "size is #{@size}"
    end
end