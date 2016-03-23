def even_next(n)
  n / 2
end

def odd_next(n)
  3 * n + 1
end

def next_value(n)
  return even_next(n) if n.even?
  odd_next(n)
end

def collatz(n, collatz_sequences = {})
  sequence = []

  until n == 1
    #Append cached collatz sequence at previously determined integer
    if collatz_sequences[n]
      sequence << collatz_sequences[n]

      return sequence.flatten
    end

    sequence << n

    n = next_value(n)
  end

  sequence << 1
end

def longest_collatz
  n = 1
  collatz_sequences = {}

  until n > 1_000_000
    sequence = collatz(n, collatz_sequences)
    collatz_sequences[sequence[0]] = sequence

    n += 1
  end

  longest_sequence = collatz_sequences.max_by do |integer, sequence| 
    sequence.length
  end

  longest_sequence[0]
end