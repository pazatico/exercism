class Bob
  SHOUTING = /^[^a-z]+[A-Z\!\?]+\Z/
  ASKING = /[a-z\d].*\?\Z/
  SILENCE = /^[\s\t\n]*\Z/

  def hey(remark)
    case remark
    when SILENCE
      'Fine. Be that way!'
    when ASKING
      'Sure.'
    when SHOUTING
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end
end
