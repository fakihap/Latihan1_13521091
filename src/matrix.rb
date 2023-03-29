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

    def solve(from)
        # from = node_from - 1

        solveRoot()
        @costArr = Array.new(@array.length){ Array.new(@array.length)}
        @nodesE = Array.new
        selectedNodes = Array.new

        startNode = from
        selectedNodes += [from]

        for i in (0...@array.length - 1)
            ptr = 0
            to = Array.new(@array.length - 1 - i)
            for node in (asNode(0)...asNode(@array.length))
                puts selectedNodes.inspect, "sn?"
                if not selectedNodes.include?(node)
                    to[ptr] = node
                    ptr += 1
                end
            end

            for node in to
                puts to.inspect, "po?"
                solvePath(asIndex(startNode), asIndex(node))
            end

            to = to.sort_by { |s| @costArr[asIndex(startNode)][asIndex(s)]}
            puts to.inspect, "as?"

            @array, _ = solvePath(asIndex(startNode), asIndex(to[0]))

            @nodesE += [[startNode, to]]

            startNode = to[0]
            selectedNodes += [startNode]
        end
        selectedNodes += [from]

        puts @rootVal.inspect
        puts @nodesE.inspect
        puts @costArr.inspect
        puts selectedNodes.inspect


        
        
    end

    def solveRoot()
        @array, @rootVal = reduceArray(@array)
        # describe()
    end

    def solvePath(from, to)
        arr = deepcopyArray(@array)

        # value of A(from, to)
        _A = arr[from][to]

        # set col inf
        for i in (0...@array.length)
            arr[from][i] = @@inf
        end

        # set row inf
        for j in (0...@array.length)
            arr[j][to] = @@inf
        end

        # set A inf
        arr[to][from] = @@inf
        
        # reduce array
        arr, pathVal = reduceArray(arr)

        # save cost in costArray
        @costArr[from][to] = pathVal + @rootVal + _A

        print @rootVal,"+",_A,"+", pathVal, "=", pathVal + @rootVal + _A, "|",asNode(from), ", ",asNode(to), arr,"\n"

        return arr, pathVal # nanti diganti
    end

    

    # private
    def asNode(idx)
        return idx + 1
    end

    def asIndex(node)
        return node - 1
    end

    def deepcopyArray(arr)
        newArr = Array.new(arr.length){Array.new(arr.length)}

        for i in (0...arr.length)
            for j in (0...arr.length)
                newArr[i][j] = arr[i][j]
            end
        end

        return newArr
    end

    def reduceArray(arr)
        
        array = deepcopyArray(arr)
        
        
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

                # puts "test_min #{array[i][j]} , #{min}"
            end

            # puts "#{min} cosep"
            # min is subtractor
            if min != @@inf
                subtr += min
            end
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
                if array[j][i] != @@inf
                    array[j][i] -= min
                end

                # puts "test_min #{array[j][i]} , #{min}"
            end
            
            # puts "#{min} rosep"
            # min is subtractor
            if min != @@inf
                subtr += min
            end
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