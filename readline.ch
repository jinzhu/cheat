= readline: |
  require 'readline'
  
  while line = Readline.readline('> ', history = true)
    break if line =~ /^(quit|exit)$/
    puts "You typed: #{line.inspect}"
  end
  puts "Bye!"
  
  # completion
  
  require 'abbrev'
  
  Completors = %w[hello world of nifty_completion]
  
  Readline.completion_proc = lambda{|tok| Completors.abbrev[tok] }

