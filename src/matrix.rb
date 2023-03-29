class Matrix
    def initialize(w, h)
        @width, @height = w, h
    end

    def describe()
        puts "width is #{@width}", 
             "height is #{@height}"
    end
end