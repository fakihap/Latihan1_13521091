class Matrix
    @@inf = -1 # placeholder for infinite number

    def initialize(size)
        @size = size
    end

    public
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
    
        if @array == nil
            return
        end

        for i in @array do
            for j in i do
                print "#{j} "
            end
            puts ""
        end
    end

    def solve()
        solveRoot()
        solvePath()
    end

    def solveRoot()
        @array, subtr = reduceArray(@array)

        puts subtr

        describe()
    end

    def solvePath()
        
    end

    

    # private
    def reduceArray(array)
        if isReduced(array)
            return array, 0
        end

        subtr = 0

        # column sweep
        for i in (0...array.length)
            min = array[i][0]

            # get min
            for j in (0...array.length)
                # move min from -1
                if min == @@inf
                    min = array[i][j]
                end

                if min > array[i][j] and array[i][j] != @@inf
                    min = array[i][j] 
                end
            end

            # subtract by min
            for j in (0...array.length)
                if array[i][j] != @@inf
                    array[i][j] -= min
                end
            end

            puts "#{min} cosep"
            # min is subtractor
            subtr += min
        end

        # row sweep
        for i in (0...array.length)
            min = array[0][i]

            # get min
            for j in (0...array.length)
                # move min from -1
                if min == @@inf
                    min = array[j][i]
                end

                if min > array[j][i] and array[j][i] != @@inf
                    min = array[j][i] 
                end
            end

            # subtract by min
            for j in (0...array.length)
                if array[i][j] != @@inf
                    array[i][j] -= min
                end
            end
            
            puts "#{min} rosep"
            # min is subtractor
            subtr += min
        end
        
        return array, subtr
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

            if numOf0 == 0 
                if numOfNonPositive != array.length
                    return false
                end
            end
        end

        return true
    end
    
end