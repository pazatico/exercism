class Prime
  VERSION = 1
  @primes = [2, 3]

  class << self
    def nth(count)
      count > 0 or raise ArgumentError, "The primes count must be at least 1"
      
      cache_next_prime while @primes.size < count
      @primes[count - 1]
    end
    
    def prime?(candidate)
      candidate > 1 or raise ArgumentError, "The number to test must be at least 2"
      
      cache_next_prime while @primes.last < candidate
      @primes.include? candidate
    end

    private

    def cache_next_prime
      x = @primes.last + 2
      x += 2 until next_prime? x
      @primes << x
    end

    def next_prime?(candidate)
      factors = @primes.take_while { |prime| prime**2 <= candidate }
      factors.all? { |factor| candidate % factor != 0 }
    end
  end
end
