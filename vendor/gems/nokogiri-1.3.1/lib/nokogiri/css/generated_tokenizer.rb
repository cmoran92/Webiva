#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.3
# from lexical definition file "lib/nokogiri/css/tokenizer.rex".
#++

module Nokogiri
module CSS
class GeneratedTokenizer < GeneratedParser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader :lineno
  attr_reader :filename

  def scan_setup ; end

  def action &block
    yield
  end

  def scan_str( str )
    scan_evaluate  str
    do_parse
  end

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_evaluate  f.read
    end
  end

  def scan_file( filename )
    load_file  filename
    do_parse
  end

  def next_token
    @rex_tokens.shift
  end

  def scan_evaluate( str )
    scan_setup
    @rex_tokens = []
    @lineno  =  1
    ss = StringScanner.new(str)
    state = nil
    until ss.eos?
      text = ss.peek(1)
      @lineno  +=  1  if text == "\n"
      case state
      when nil
        case
        when (text = ss.scan(/[-@]?([_A-Za-z]|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])([_A-Za-z0-9-]|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])*\(\s*/))
           @rex_tokens.push action { [:FUNCTION, text] }

        when (text = ss.scan(/[-@]?([_A-Za-z]|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])([_A-Za-z0-9-]|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])*/))
           @rex_tokens.push action { [:IDENT, text] }

        when (text = ss.scan(/\#([_A-Za-z0-9-]|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])+/))
           @rex_tokens.push action { [:HASH, text] }

        when (text = ss.scan(/[\s\r\n\f]*~=[\s\r\n\f]*/))
           @rex_tokens.push action { [:INCLUDES, text] }

        when (text = ss.scan(/[\s\r\n\f]*\|=[\s\r\n\f]*/))
           @rex_tokens.push action { [:DASHMATCH, text] }

        when (text = ss.scan(/[\s\r\n\f]*\^=[\s\r\n\f]*/))
           @rex_tokens.push action { [:PREFIXMATCH, text] }

        when (text = ss.scan(/[\s\r\n\f]*\$=[\s\r\n\f]*/))
           @rex_tokens.push action { [:SUFFIXMATCH, text] }

        when (text = ss.scan(/[\s\r\n\f]*\*=[\s\r\n\f]*/))
           @rex_tokens.push action { [:SUBSTRINGMATCH, text] }

        when (text = ss.scan(/[\s\r\n\f]*!=[\s\r\n\f]*/))
           @rex_tokens.push action { [:NOT_EQUAL, text] }

        when (text = ss.scan(/[\s\r\n\f]*=[\s\r\n\f]*/))
           @rex_tokens.push action { [:EQUAL, text] }

        when (text = ss.scan(/[\s\r\n\f]*\)/))
           @rex_tokens.push action { [:RPAREN, text] }

        when (text = ss.scan(/[\s\r\n\f]*\[[\s\r\n\f]*/))
           @rex_tokens.push action { [:LSQUARE, text] }

        when (text = ss.scan(/[\s\r\n\f]*\]/))
           @rex_tokens.push action { [:RSQUARE, text] }

        when (text = ss.scan(/[\s\r\n\f]*\+[\s\r\n\f]*/))
           @rex_tokens.push action { [:PLUS, text] }

        when (text = ss.scan(/[\s\r\n\f]*>[\s\r\n\f]*/))
           @rex_tokens.push action { [:GREATER, text] }

        when (text = ss.scan(/[\s\r\n\f]*,[\s\r\n\f]*/))
           @rex_tokens.push action { [:COMMA, text] }

        when (text = ss.scan(/[\s\r\n\f]*~[\s\r\n\f]*/))
           @rex_tokens.push action { [:TILDE, text] }

        when (text = ss.scan(/\:not\([\s\r\n\f]*/))
           @rex_tokens.push action { [:NOT, text] }

        when (text = ss.scan(/-?([0-9]+|[0-9]*\.[0-9]+)/))
           @rex_tokens.push action { [:NUMBER, text] }

        when (text = ss.scan(/[\s\r\n\f]*\/\/[\s\r\n\f]*/))
           @rex_tokens.push action { [:DOUBLESLASH, text] }

        when (text = ss.scan(/[\s\r\n\f]*\/[\s\r\n\f]*/))
           @rex_tokens.push action { [:SLASH, text] }

        when (text = ss.scan(/U\+[0-9a-f?]{1,6}(-[0-9a-f]{1,6})?/))
           @rex_tokens.push action {[:UNICODE_RANGE, text] }

        when (text = ss.scan(/[\s\t\r\n\f]+/))
           @rex_tokens.push action { [:S, text] }

        when (text = ss.scan(/"([^\n\r\f"]|\n|\r\n|\r|\f|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])*"|'([^\n\r\f']|\n|\r\n|\r|\f|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s\n\r\t\f])?|\\[^\n\r\f0-9A-Fa-f])*'/))
           @rex_tokens.push action { [:STRING, text] }

        when (text = ss.scan(/./))
           @rex_tokens.push action { [text, text] }

        else
          text = ss.string[ss.pos .. -1]
          raise  ScanError, "can not match: '" + text + "'"
        end  # if

      else
        raise  ScanError, "undefined state: '" + state.to_s + "'"
      end  # case state
    end  # until ss
  end  # def scan_evaluate

end # class
end
end