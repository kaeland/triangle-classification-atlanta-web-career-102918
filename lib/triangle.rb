require 'pry'

class Triangle
  # write code here

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @arr = [side1, side2, side3]
  end

  def kind
    if @arr.any?(&:negative?)
      raise TriangleError
    end

    if triangle_inequality_exist? 
      raise TriangleError
    end

    if @side1 == @side2 && @side1 == @side3
      if @side1 == 0
        raise TriangleError
      else
        :equilateral
      end
    elsif @side1 != @side2 && @side1 != @side3 && @side2 != @side3
      :scalene
    else
      :isosceles
    end
  end

  def triangle_inequality_exist?
    n1, n2, n3 = @arr 
    evaluated_array = [check(n1, n2, n3), check(n1, n3, n2), check(n3, n2, n1)]
    status = evaluated_array.all? {|inequality_check| inequality_check == true }
    flippped_status = !status
  end

  def check(a, b, num)
    sum = a + b
    sum > num
  end

  class TriangleError < StandardError
  end
end
