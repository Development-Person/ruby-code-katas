# The new "Avengers" movie has just been released! There are a lot of people at the
# cinema box office standing in a huge line. Each of them has a single 100, 50 or 25 dollar bill.
# An "Avengers" ticket costs 25 dollars.

# Vasya is currently working as a clerk. He wants to sell a ticket to every single person in this line.

# Can Vasya sell a ticket to every person and give change if he initially has no money and sells the
#  tickets strictly in the order people queue?

# Return YES, if Vasya can sell a ticket to every person and give change with the bills he has at hand at that moment.
# Otherwise return NO.

# Examples:
# tickets([25, 25, 50]) # => YES
# tickets([25, 100]) # => NO. Vasya will not have enough money to give change to 100 dollars
# tickets([25, 25, 50, 50, 100]) # => NO. Vasya will not have the right bills to give 75 dollars of change
# (you can't make two bills of 25 from one of 50)

def tickets1(people)
  bills = []
  # p "PEOPLE #{people}"

  people.each_index do |index|
    p "looping on index #{index}"

    p bills

    if people[index] == 25
      bills.push(people[index])
      next
    end

    change_required = people[index] - 25

    p "change required: #{change_required}"

    bills_index = bills.index(change_required)

    p "bills index: #{bills_index || 'nil'}"

    # rubocop:disable Style/NegatedIf
    if !bills_index.nil?
      bills.push(people[index])
      bills.delete_at(bills_index)
      next
    end
    # rubocop:enable Style/NegatedIf

    result = bills.combination(2).find_all { |x, y| x + y == change_required } || []

    p "result1: #{result}, "

    result = bills.combination(3).find_all { |x, y, z| x + y + z == change_required } || [] if result == []

    p "result2: #{result}, "

    return 'NO' if result == []

    bills.push(people[index])
    bills.delete_at(bills.find_index(result[0][0]))
    bills.delete_at(bills.find_index(result[0][1]))
    if result[0].length == 2
    else
      bills.delete_at(bills.find_index(result[0][2]))
    end

    p "finished looping on index #{index}, bills: #{bills}"
  end
  p "bills after loop completes: #{bills}"
  'YES'
end

p tickets1([25, 25, 50]) # 'YES'
p tickets1([25, 25, 50, 100]) # 'YES'
p tickets1([25, 25, 25, 100]) # 'YES'
p tickets1([25, 100]) # 'NO'
p tickets1([25, 25, 25, 25, 50, 100, 50]) # 'YES'
p tickets1([25, 25, 25, 25, 25, 25, 25, 25, 25, 25]) # 'YES'
p tickets1([25, 25, 25, 25, 25, 100, 100]) # 'NO'

# other solutions

def tickets2(people)
  bills_25 = 0
  bills_50 = 0

  people.each do |v|
    if v == 25
      bills_25 += 1        # keep the 25

    elsif (v == 50) && (bills_25 > 0)
      bills_50 += 1        # keep the 50
      bills_25 -= 1        # return 25

    elsif (v == 100) && ((bills_25 >= 3) || ((bills_50 > 0) && (bills_25 > 0)))
      if bills_50 > 0
        bills_50 -= 1    # return 50
        bills_25 -= 1    # return 25
      else
        bills_25 -= 3    # return 3x25
      end

    else
      return 'NO'
    end
  end

  'YES'
end

# crazy solution which I don't understand
ADJ = { 25 => [[1, 0, 0], [0, 0, 0]], 50 => [[-1, 1, 0], [-1, 0, 0]], 100 => [[-1, -1, 1], [-2, 1, 0]] }
def adjusted(adj)
  ($bills = $bills.zip(adj).map { |x| x.sum }).none?(&:negative?)
end

def tickets3(people)
  $bills = [0, 0, 0]
  people.each { |p| return 'NO' if !adjusted(ADJ[p][0]) && !adjusted(ADJ[p][1]) }
  'YES'
end
