class Factorial
    def factorial_of(n)
      (1..n).inject(:*)
    end
end

class FunnyTest
  def adds_two(n)
    n+2
  end
end
  