# example of builder design patter, a builder is in charge of configuring a complex object. here we can use the builder 
# to piece together all of the different parts of a bed (see underlying classes below) 

# #BedBuilder is comprised of different methods used to configure the bed itself
class BedBuilder
    attr_reader :bed

    def initialize
        @bed = Bed.new
    end

    # raise exception if unacceptable number of legs on bed
    def bed
        raise "A bed must have more than 4 legs." if @bed.number_of_legs < 4
        raise "That's an absurd number of legs for a bed." if @bed.number_of_legs > 10
        @bed
    end

    def specify_number_of_legs(number)
        @bed.build_legs(number)
    end

    def set_leg_specs(length, width, height, material, weight)
        @bed.legs.each do |leg|
            leg.length = length
            leg.width = width
            leg.height = height
            leg.material = material
            leg.weight = weight
        end
    end

    def create_bed_frame(length, width, height, material, weight)
        @bed.frame = Frame.new(length, width, height, material, weight)
    end

    def create_mattress(length, width, height, material, size, weight)
        @bed.mattress = Mattress.new(length, width, height, material, size, weight)
    end

    def specify_number_of_pillows(number)
        @bed.build_pillows(number)
    end

    def set_pillow_specs(size, material, filling)
        @bed.pillows.each do |pillow|
            # e.g. king, queen, full
            pillow.size = size
            pillow.material = material
            pillow.filling = filling
        end
    end

    def create_sheets(size, material, thread_count, color)
        @bed.sheets = Sheet.new(size, material, thread_count, color)
    end

    def create_duvet(size, material, color)
        @bed.duvet = Duvet.new(size, material, color)
    end

end

# underlying classes being utilizied by the BedBuidler design pattern

class Bed
    attr_accessor :legs, :frame, :box_spring, :mattress, :pillows, :sheets, :duvet

    def initialize
        @legs = []
        @pillows = []
    end

    def build_legs(number)
        number.times do 
            @legs.push BedLeg.new
        end
    end

    def number_of_legs
        @legs.length
    end

    def build_pillows(number)
        number.times do 
            @legs.push Pillow.new
        end
    end
end

class BedLeg
    attr_accessor :length, :width, :height, :material, :weight
end

class Frame
    attr_reader :length, :width, :height, :material, :weight

    def initialize(length, width, height, material, weight)
        @length = length
        @width = width
        @height = height
        @material = material
        @weight = weight
    end 
end

class BoxSpring
    attr_reader :length, :width, :height, :material, :weight
    
    def initialize(length, width, height, material, weight)
        @length = length
        @width = width
        @height = height
        @material = material
        @weight = weight
    end 
end

class Mattress
    attr_reader :length, :width, :height, :material, :size, :weight
    
    def initialize(length, width, height, material, size, weight)
        @length = length
        @width = width
        @height = height
        @material = material
        @weight = weight
    end 
end

class Pillow
    attr_reader :size, :material, :filling

    def initialize(size, material, filling)
        @size = size
        @material = material
        @filling = filling
    end
end

class Sheet
    attr_reader :size, :material, :thread_count, :color

    def initialize(size, material, thread_count, color)
        @size = size
        @material = material
        @thread_count = thread_count
        @color = color
    end
end

class Duvet
    attr_reader :size, :material, :color

    def initialize(size, material, color)
        @size = size
        @material = material
        @color = color
    end
end