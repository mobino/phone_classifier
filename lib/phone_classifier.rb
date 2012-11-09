require 'phony'

class PhoneClassifier

  # authorative info: http://www.itu.int/oth/T0202.aspx?parent=T0202
  # Numbering schemes for mobile numbers
  #
  @@mobile = {
      '1' => %w{ [2-9].. }, # USA
      '30' => %w{ 6.. }, # Greece
      '31' => %w{6}, # Netherlands
      '32' => %w{4..}, # Belgium
      '33' => %w{6 7}, # France
      '34' => %w{6. 7.}, # Spain
      '36' => %w{ 20 30 31 70 }, # Hungary
      '39' => %w{3...}, # Italy
      '40' => %w{ 7. }, # Romania
      '41' => %w{ 7[6-9] }, # Switerzland
      '43' => %w{ 67 68 644 65. 66. }, # Austria
      '44' => %w{ 7[4-9].. }, # UK
      '45' => %w{ 2[0-9] 30 31 40 41 42 5[0-3] 60 61 71 81 9[1-3] }, # Denmark
      '46' => %w{ 70 72 73 76 }, # Sweden
      '47' => %w{ 9.. 4.. 58. 59. }, # Norway
      '48' => %w{50. 51. 53. 60. 66. 69. 72. 78. 79. 88.}, # Poland
      '49' => %w{ 151 152 157 159 160 162 163 17[0-9] }, # Germany
      '212' => %w{ 6.  }, # Morocco
      '213' => %w{ 55 66 697 699 77 790 796 }, # Algeria
      '233' => %w{ 20 23 24 26 27 28 50 54 57 },
      '234' => %w{ 702[1-9] 70[3-9] 8[01][2-9] },
      '249' => %w{ 9.  }, # Sudan
      '350' => %w{ 5. 6. }, # Gibraltar
      '351' => %w{ 9. }, # Portugal
      '352' => %w{ 621 628 661 668 691 698 }, # Luxembourg
      '353' => %w{ 8[2-9] }, # Ireland
      '354' => %w{ 6.. 7.. 8..}, # Iceland
      '356' => %w{ 77 79 98 99 }, # Malta
      '357' => %w{ 95 96 97 99 }, # Cyprus
      '358' => %w{ 4. 50 }, # Finland
      '359' => %w{ 430 87. 88. 89. 98. }, # Bulgaria
      '370' => %w{ 6.. }, # Lithuania
      '372' => %w{ 5.. 81. 82.}, # Estonia
      '377' => %w{ 4. 6 }, # Monaco
      '386' => %w{ 30 40 31 41 51 71 70 64}, # Slovenia
      '420' => %w{ 60[1-8] 72. 73. 77. 79. 91 }, # Czech Republic
      '421' => %w{ 9.. }, # Slovakia
  }

  @@forbidden = {
      '1' => %w{ 1.. }, # USA
      '30' => %w{ 8.. 9.. }, # Greece
      '31' => %w{84 85 87 88 91 112 676 800 900 906 909}, # Netherlands
      '32' => %w{70 800 90[0-9]}, # Belgium
      '33' => %w{8}, # France
      '34' => %w{10 11 80 90}, # Spain
      '36' => %w{ 40 41 50 55 60 71 80 90 91 }, # Hungary
      '39' => %w{1 7 8}, # Italy
      '40' => %w{ 8. 9. }, # Romania
      '41' => %w{ 74 800 840 842 844 848 860 868 900 901 906 }, # Switzerland
      '43' => %w{ 718 720 780 8.. 9.. }, # Austria
      '44' => %w{800 808 842 843 844 845 870 871 872 873 900 908 909 982}, # UK
      '45' => %w{10 11 18 70 80 90}, # Denmark
      '46' => %w{ 900 939 944 99. },
      '47' => %w{ 8.. }, # Norway
      '48' => %w{70., 80.}, # Poland
      '49' => %w{ 1. 164 168 169 180 181 19[0-4] 800 900 }, # Germany
      '212' => %w{ 8. }, # Morocco
      '213' => %w{ 8.. 9.. }, # Algeria
      '233' => %w{ 1 4 6 7 8 9 },
      '234' => %w{ 8.. 9.. },
      '249' => %w{ }, # Sudan
      '350' => %w{ 8... }, # Gibraltar
      '351' => %w{ 800 80. }, # Portugal
      '352' => %w{ 118 12 13 800 801 900 901 905 }, # Luxembourg
      '353' => %w{ 76 80 81 800 }, # Ireland
      '354' => %w{ 8.. 9.. }, # Iceland
      '356' => %w{ }, # Malta
      '357' => %w{ 80 90 }, # Cyprus
      '358' => %w{ 6.. 7.. 8.. }, # Finland
      '359' => %w{ 800 900 }, # Bulgaria
      '370' => %w{ 800 9.. }, # Lithuania
      '372' => %w{ 1.. 800 }, # Estonia
      '377' => %w{  }, # Monaco
      '386' => %w{ 80 89 90 }, # Slovenia
      '420' => %w{ 8.. 9.. }, # Czech republic
      '421' => %w{ }, # Slovakia
  }

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
    return is_number_of_type @@mobile
  end


  def forbidden?
    return is_number_of_type @@forbidden
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