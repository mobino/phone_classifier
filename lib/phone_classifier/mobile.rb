

  module Mobile

    def self.data
      @@mobile ||= {
          '1' => %w{ [2-9].. }, # USA
          '30' => %w{ 6.. }, # Greece
          '31' => %w{ 6 }, # Netherlands
          '32' => %w{4..}, # Belgium
          '33' => %w{6 7}, # France
          '34' => %w{6. 7.}, # Spain
          '36' => %w{ 20 30 31 70 }, # Hungary
          '39' => %w{3..}, # Italy
          '40' => %w{ 7. }, # Romania
          '41' => %w{ 7[6-9] }, # Switerzland
          '43' => %w{ 67 68 644 65. 66. 67. 68. 69. }, # Austria
          '44' => %w{ 7[4-9].. }, # UK
          '45' => %w{ 2[0-9] 30 31 40 41 42 5[0-3] 60 61 71 81 9[1-3] }, # Denmark
          '46' => %w{ 70 72 73 76 }, # Sweden
          '47' => %w{ 9.. 4.. 58. 59. }, # Norway
          '48' => %w{50. 51. 53. 60. 66. 69. 72. 78. 79. 88.}, # Poland
          '49' => %w{ 151 152 157 159 160 162 163 17[0-9] }, # Germany
          '52' => %w{ .. ... }, # Mexico
          '54' => %w{ \d{2} \d{3} \d{4} }, # Argentina (Everything can be mobile)
          '60' => %w{ 10 11 12 13 14 153 154 156 158 16 17 18 19 }, # Malaysia
          '61' => %w{ 4.. }, # Australia
          '65' => %w{ 8... 9... }, # Singapore
          '90' => %w{ 53. 54. 50. 55. }, # Turkey
          '91' => %w{ 91 92 93 94 97 98 99 }, # India
          '94' => %w{ 71 72 75 77 78 }, # Sri Lanka
          '98' => %w{ 91. 92. 93. } , #Iran
          '212' => %w{ 6  }, # Morocco
          '213' => %w{ 55 66 697 699 77 790 796 }, # Algeria
          '233' => %w{ 20 23 24 26 27 28 50 54 57 }, # Ghana
          '234' => %w{ 702[1-9] 70[3-9] 8[01][2-9] }, # Nigeria
          '248' => %w{ 2 }, # Seychelles
          '249' => %w{ 9.  }, # Sudan
          '255' => %w{ 61 65 68 7. }, # Tanzania
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
          '503' => %w{ 6... 7... }, # El Salvador
          '509' => %w{ 32 33 34 35 36 37 38 39 4. }, # Haiti
          '852' => %w{ 5... 6... 9... }, # Hong Kong
          '970' => %w{ 5. }, # Israel (blocked cc)
          '972' => %w{ 5. }, # Israel
      }
    end
  end

