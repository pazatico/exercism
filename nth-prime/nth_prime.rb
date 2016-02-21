class Prime
  VERSION = 1
  @primes = [2, 3]

  class << self
    def nth(n)
      raise ArgumentError if n < 1

      find_next_prime while @primes.size < n
      @primes[n - 1]
    end

    private

    def find_next_prime
      x = @primes.last + 2
      x += 2 until is_next_prime? x
      @primes << x
      x
    end

    def is_next_prime?(n)
      factors = @primes.take_while { |p| p**2 <= n }
      factors.all? { |f| n % f != 0 }
    end
  end
end
