class Matrix
    @@inf = -1 # placeholder for infinite number

    def initialize(size)
        @size = size
    end

    # public
    def setMatrix(array)
        if isSquare(array)
            @size = array.length

            @array = array
        else
            puts "WARNING : failed to setMatrix"
        end
    end

    def describe()
        puts "size is #{@size}"
    end

    # private
    def isSquare(array)
        len = array.length

        for i in array do
            if i.length != len
                return false
            end
        end

        return true
    end

    def isReduced(array) 
        # column check
        for i in (0...array.length) do
            numOf0 = 0
            numOfNonPositive = 0
            
            for j in (0...array.length) do
                
                if array[i][j] == 0 or array[i][j] == @@inf
                    numOfNonPositive += 1

                    if array[i][j] == 0
                        numOf0 += 1
                    end
                end
            end
            
            if numOf0 == 0 
                if numOfNonPositive != array.length
                    return false
                end
            end
        end

        #row check
        for i in (0...array.length) do
            numOf0 = 0
            numOfNonPositive = 0
            
            for j in (0...array.length) do
                if array[j][i] == 0 or array[j][i] == @@inf
                    numOfNonPositive += 1

                    if array[j][i] == 0
                        numOf0 += 1
                    end
                end
            end

            if numOf0 == 0 and numOfNonPositive == array.length
                return false
            end
        end

        return true
    end
    
end