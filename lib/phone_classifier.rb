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
    ndcs = numbers[parts.shift]
    prefix = parts.shift

    return false unless ndcs # if we don't know the country, we can make no assumptions

    # countries without NDCs (Denmark) have this parts structure ["45", false, "40", "53", "25", "77"]
    until parts.size == 0 || prefix.is_a?(String)
      prefix = parts.shift

    end


    ndcs.each { |n| return true if prefix.match(/^#{n}$/) } unless ndcs.nil?

    false
  end

end