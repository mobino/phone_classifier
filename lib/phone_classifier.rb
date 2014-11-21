require 'phony'


require 'phone_classifier/mobile'
require 'phone_classifier/forbidden'

class PhoneClassifier

  include Mobile
  include Forbidden

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

end