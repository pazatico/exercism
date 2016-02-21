class Prime
  VERSION = 1
  @primes = [2, 3]

  def self.nth(n)
    raise ArgumentError if n < 1

    x = @primes.last
    @primes << x if prime?(x += 2) while @primes.size < n
    @primes[n - 1]
  end

  def self.prime?(n)
    factors = @primes.take_while { |p| p**2 <= n }
    factors.all? { |f| n % f != 0 }
  end
end
