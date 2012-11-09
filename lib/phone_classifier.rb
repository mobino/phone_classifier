require 'phony'


require 'phone_classifier/mobile'
require 'phone_classifier/forbidden'

class PhoneClassifier

  # authorative info: http://www.itu.int/oth/T0202.aspx?parent=T0202
  # Numbering schemes for mobile numbers
  #

  def initialize number
    @number = number
  end

  def kind
    case
      when self.mobile? then
        :mobile
      when self.forbidden? then
        :forbidden
      else
        :landline
    end
  end

  def mobile?
    return is_number_of_type Mobile.data
  end


  def forbidden?
    return is_number_of_type Forbidden.data
  end

  def is_number_of_type numbers
    parts = Phony.split Phony.normalize(@number)
    forbidden_numbers = numbers[parts.shift]
    prefix = parts.shift

    # This is a hotfix for strange behaviour.
    # I don't know why but some numbers are split ["45", false, "40", "53", "25", "77"]
    until prefix.is_a? String
      prefix = parts.shift
    end

    forbidden_numbers.each { |n| return true if prefix.match(/^#{n}$/) } unless forbidden_numbers.nil?
    false
  end

end