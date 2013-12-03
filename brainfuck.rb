##
#A simple brainfuck parser written in ruby
#This is my first attempt at a real program in ruby not to mention my first brainfuck parser
#Usage:
#use Brainfuck.new to inilitalize
#use Brainfuck#newprogram to create a new program
# => It expects 2 arguments, the code and an input stream. Both should be strings
#########################################################################################
class Brainfuck

  def initialize
    @ram = Array.new()
  end

  def newprogram(code, input)
    @code = code.gsub(/[^><+\-.,\[\]]/, "")
    @input = input
    @cp = 0
    @ip = 0
    @rm = 0
    @out = ""
    @ram = Array.new()
  end

  def getmatch(tofind, original)
    move = tofind == ']' ? 1 : -1
    nest = 0
    while true
      @cp += move
      if @code[@cp] == original
        nest += 1
      elsif @code[@cp] == tofind
        nest -= 1
      end
      if nest == -1
        return
      end
    end
  end

  def parse
    while at = @code[@cp]
      case at
      when '>'
        move(1)
      when '<'
        move(-1)
      when '+'
        increment
      when '-'
        decrement
      when '.'
        @out += @ram[@rm].chr
      when ','
        @ram[@rm] = @input[@ip].ord
        @ip += 1
      when '['
        getmatch(']', '[') if @ram[@rm] == 0

      when ']'
        getmatch('[', ']') if @ram[@rm]!= 0
      end
      @cp+=1
    end
    @out
  end

  def move direction
    @rm += direction
  end

  def increment
    @ram[@rm] ||= 0
    @ram[@rm] += 1
    @ram[@rm] = 0 if @ram[@rm] > 255
  end

  def decrement
    @ram[@rm] ||= 0
    @ram[@rm] -= 1
    @ram[@rm] = 255 if @ram[@rm] < 0
  end

  private :getmatch, :increment, :decrement, :move

end