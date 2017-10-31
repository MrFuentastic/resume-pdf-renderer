require 'prawn'

Prawn::Document.generate('test.pdf') do
  text 'This is a story pdf'
  text 'Monkeys and Bananas'
  text 'End of file'
end