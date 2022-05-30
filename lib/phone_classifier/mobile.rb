module Mobile

  def mobile?
    cc, *national_parts = Phony.split Phony.normalize(@number)
    mobile_fn = Mobile.data[cc]

    # if we don't know the country, we can make no assumptions
    return false unless mobile_fn
    mobile_fn.(national_parts)
  end


  private

  # Checks the NDC with the given list to see if it corresponds to a mobile device
  #
  # TODO 2014-11-21/tito: we need to merge this code with the regex checking code. I didn't want to make
  # too many changes when adding Zambia and Brazil, this is why only those two countries are currently running
  # through the other method. This method is a copy of is_number_of_type found previously in the PhoneClassifier
  # with one or two bug fixes (check for prefix being a String)
  def self.mobile_via_ndc?(national_parts, ndcs)
    prefix = national_parts.shift

    # countries without NDCs (Denmark) have this parts structure ["45", false, "40", "53", "25", "77"]
    until national_parts.size == 0 || prefix.is_a?(String)
      prefix = national_parts.shift
    end

    # without a valid prefix, there is no check that we can make here
    return false unless prefix.is_a?(String)

    ndcs.each { |n| return true if prefix.match(/^#{n}$/) } unless ndcs.nil?
    false
  end

  # Uses the given regex to check the national number (national destination code + subscriber #) for
  # a mobile device.
  def self.mobile_via_national?(national_parts, regex)
    national = national_parts.join('')
    national.match(regex) != nil
  end

  def self.data
    @@mobile ||= {
        '1'  => ->(x) { mobile_via_ndc?(x, %w{ [2-9].. }) }, # USA
        '27' => ->(x) { mobile_via_ndc?(x, %w{ 6[0-5] 7[0-4] 7[6-9] 8[1-4] }) }, # South Africa
        '30' => ->(x) { mobile_via_ndc?(x, %w{ 6.. }) }, # Greece
        '31' => ->(x) { mobile_via_ndc?(x, %w{ 6 }) }, # Netherlands
        '32' => ->(x) { mobile_via_ndc?(x, %w{4..}) }, # Belgium
        '33' => ->(x) { mobile_via_ndc?(x, %w{6 7}) }, # France
        '34' => ->(x) { mobile_via_ndc?(x, %w{6.. 7[1-9].}) }, # Spain
        '36' => ->(x) { mobile_via_ndc?(x, %w{ 20 30 31 70 }) }, # Hungary
        '39' => ->(x) { mobile_via_ndc?(x, %w{3..}) }, # Italy
        '40' => ->(x) { mobile_via_ndc?(x, %w{ 7. }) }, # Romania
        '41' => ->(x) { mobile_via_ndc?(x, %w{ 7[5-9] }) }, # Switzerland
        '43' => ->(x) { mobile_via_ndc?(x, %w{ 67 68 644 65. 66. 67. 68. 69. }) }, # Austria
        '44' => ->(x) { mobile_via_ndc?(x, %w{ 7[4-9].. }) }, # UK
        '45' => ->(x) { mobile_via_ndc?(x, %w{ 2[0-9] 30 31 40 41 42 5[0-3] 60 61 71 81 9[1-3] }) }, # Denmark
        '46' => ->(x) { mobile_via_ndc?(x, %w{ 70 72 73 76 }) }, # Sweden
        '47' => ->(x) { mobile_via_ndc?(x, %w{ 9.. 4.. }) }, # Norway
        '48' => ->(x) { mobile_via_ndc?(x, %w{50. 51. 53. 60. 66. 69. 72. 78. 79. 88.}) }, # Poland
        '49' => ->(x) { mobile_via_ndc?(x, %w{ 151 152.? 157.? 159 160 162 163 1672 17[0-9] }) }, # Germany
        '52' => ->(x) { mobile_via_national?(x, /^1\d/) }, # Mexico
        '54' => ->(x) { mobile_via_ndc?(x, %w{ \d{2} \d{3} \d{4} }) }, # Argentina (Everything can be mobile)
        '55' => ->(x) { mobile_via_national?(x, /^(11|12|13|14|15|16|17|18|19|21|22|24|27|28|91|92|93|94|95|96|97|98|99)9|^(31|32|33|34|35|37|38|41|42|43|44|45|46|47|48|49|51|52|53|54|55|61|62|63|64|65|66|67|68|69|71|73|74|75|77|79|81|82|83|84|85|86|87|88|89)[6-9]/)}, # Brazil
        '60' => ->(x) { mobile_via_ndc?(x, %w{ 10 11 12 13 14 153 154 156 158 16 17 18 19 }) }, # Malaysia
        '61' => ->(x) { mobile_via_ndc?(x, %w{ 4.. }) }, # Australia
        '65' => ->(x) { mobile_via_ndc?(x, %w{ 8... 9... }) }, # Singapore
        '90' => ->(x) { mobile_via_ndc?(x, %w{ 53. 54. 50. 55. }) }, # Turkey
        '91' => ->(x) { mobile_via_ndc?(x, %w{ [789]. }) }, # India
        '94' => ->(x) { mobile_via_ndc?(x, %w{ 71 72 75 77 78 }) }, # Sri Lanka
        '95' => ->(x) { mobile_via_ndc?(x, %w{ 9 }) }, # Myanmar
        '98' => ->(x) { mobile_via_national?(x, /^(91|92|93)|^(901|902)/) } , #Iran
        '212' => ->(x) { mobile_via_national?(x, /^6/) }, # Morocco
        '213' => ->(x) { mobile_via_ndc?(x, %w{ 55 66 697 699 77 790 796 }) }, # Algeria
        '225' => ->(x) { mobile_via_national?(x, /^(01|02|03|04|05|06|07|08|09|44|45|46|47|48|49|50|54|60|66|67|69|77|78)/) }, # Côte d'Ivoire
        '233' => ->(x) { mobile_via_ndc?(x, %w{ 20 23 24 26 27 28 50 54 57 }) }, # Ghana
        '234' => ->(x) { mobile_via_national?(x, /^(70|80|81|90)[0-9]/) }, # Nigeria
        '242' => ->(x) { mobile_via_ndc?(x, %w{ 01 04 05 06 }) }, #Congo
        '243' => ->(x) { mobile_via_ndc?(x, %w{ 80. 81. 82. 84. 88. 89. 97. 98. 99. }) }, #D.R. Congo
        '248' => ->(x) { mobile_via_ndc?(x, %w{ 2 }) }, # Seychelles
        '249' => ->(x) { mobile_via_ndc?(x, %w{ 9.  }) }, # Sudan
        '254' => ->(x) { mobile_via_ndc?(x, %w{ 7.. }) }, # Kenya
        '255' => ->(x) { mobile_via_ndc?(x, %w{ 61 65 68 7. }) }, # Tanzania
        '260' => ->(x) { mobile_via_national?(x, /^(955)|(966)|(97[7-9])/) },  # Zambia
        '263' => ->(x) { mobile_via_ndc?(x, %w(71 73 77 78)) }, # Zimbabwe
        '350' => ->(x) { mobile_via_ndc?(x, %w{ 5. 6. }) }, # Gibraltar
        '351' => ->(x) { mobile_via_ndc?(x, %w{ 9. }) }, # Portugal
        '352' => ->(x) { mobile_via_ndc?(x, %w{ 621 628 661 668 691 698 }) }, # Luxembourg
        '353' => ->(x) { mobile_via_ndc?(x, %w{ 8[2-9] }) }, # Ireland
        '354' => ->(x) { mobile_via_ndc?(x, %w{ 6.. 7.. 8..}) }, # Iceland
        '356' => ->(x) { mobile_via_ndc?(x, %w{ 77 79 98 99 }) }, # Malta
        '357' => ->(x) { mobile_via_ndc?(x, %w{ 95 96 97 99 }) }, # Cyprus
        '358' => ->(x) { mobile_via_ndc?(x, %w{ 4. 50 }) }, # Finland
        '359' => ->(x) { mobile_via_ndc?(x, %w{ 430 87. 88. 89. 98. }) }, # Bulgaria
        '370' => ->(x) { mobile_via_ndc?(x, %w{ 6.. }) }, # Lithuania
        '372' => ->(x) { mobile_via_ndc?(x, %w{ 5...? 81. 82.}) }, # Estonia
        '375' => ->(x) { mobile_via_ndc?(x, %w{ 25 29 33 44}) }, # Belarus
        '377' => ->(x) { mobile_via_ndc?(x, %w{ 4. 6 }) }, # Monaco
        '381' => ->(x) { mobile_via_ndc?(x, %w{ 6. }) }, # Serbia
        '386' => ->(x) { mobile_via_ndc?(x, %w{ 30 40 31 41 51 71 70 64}) }, # Slovenia
        '420' => ->(x) { mobile_via_ndc?(x, %w{ 60[1-8] 72. 73. 77. 79. 91 }) }, # Czech Republic
        '421' => ->(x) { mobile_via_ndc?(x, %w{ 9.. }) }, # Slovakia
        '503' => ->(x) { mobile_via_ndc?(x, %w{ 6... 7... }) }, # El Salvador
        '509' => ->(x) { mobile_via_ndc?(x, %w{ 32 33 34 35 36 37 38 39 4. }) }, # Haiti
        '852' => ->(x) { mobile_via_ndc?(x, %w{ 5... 6... 9... }) }, # Hong Kong
        '961' => ->(x) { mobile_via_ndc?(x, %w{ 3. 7. }) }, # Lebanon
        '964' => ->(x) { mobile_via_ndc?(x, %w{ 7[1-9] }) }, # Iraq
        '970' => ->(x) { mobile_via_ndc?(x, %w{ 5. }) }, # Israel (blocked cc)
        '972' => ->(x) { mobile_via_ndc?(x, %w{ 5. }) }, # Israel
        '998' => ->(x) { mobile_via_national?(x, /^9[01234789]/) }, # Uzbekistan
    }
  end
end
