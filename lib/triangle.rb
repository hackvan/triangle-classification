class Triangle
  attr_accessor :sides
  
  def initialize( side_1, side_2, side_3 )
    @sides = [ side_1, side_2, side_3 ]
  end
  
  def kind
    validate_triangle

    unique_sides = @sides.uniq.length
    case unique_sides
      when 1 # all sides are equal
        kind = :equilateral
      when 2 # two sides are equal
        kind = :isosceles
      when 3 # no sides are equal
        kind = :scalene
    end
    return kind
  end
  
  def validate_triangle
    # Check for triangle inequality
    a, b, c = @sides
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    # Check for each side must be larger than 0
    real_triangle << !@sides.any? { |side| side <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end
  
  class TriangleError < StandardError
    def message
      "Invalid triangle. Check the lenght of your triangle's sides!"
    end
  end
end