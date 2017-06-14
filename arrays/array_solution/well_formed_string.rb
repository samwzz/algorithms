# A string with the characters [,],{,},(,) is said to be well-formed if the
# different types of brackets match in the correct order. For example, ([]){()}
# is well-formed, but [(]{)} is not. Write a function to test whether a string is well-formed.

MATCH = {
  "(" => ")",
  "[" => "]",
  "{" => "}"
}
def well_formed?(str)
  stack = []
  (0..str.length - 1).each do |i|
    p stack
    if MATCH[stack[-1]] == str[i]
      stack.pop
    else
      stack.push(str[i])
    end
  end
  stack.empty?
end

p well_formed?("[(]{)}")
p well_formed?("([]){()}")
