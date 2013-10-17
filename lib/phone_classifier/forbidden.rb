module Forbidden

  def self.data
    @@forbidden ||= {
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
        '52' => %w{ }, # Mexico
        '54' => %w{ 6.. 8.. }, # Argentina
        '60' => %w{ 100 101 102 103 104 108 112 991 994 995 999 }, # Malaysia
        '61' => %w{ 1 }, # Australia
        '65' => %w{ 3... 800 1800 1900 }, # Singapore
        '90' => %w{ 592 594 596 522 900 800 850 822 512 }, # Turkey
        '91' => %w{ 90 95 96 }, # India
        '94' => %w{ }, # Sri Lanka
        '98' => %w{ 95. 96. 97. 98. 99.} , #Iran
        '212' => %w{ 8. }, # Morocco
        '213' => %w{ 8.. 9.. }, # Algeria
        '233' => %w{ 1 4 6 7 8 9 }, # Ghana
        '234' => %w{ 8.. 9.. }, # Nigeria
        '248' => %w{ 5 6 7 8 9 }, # Seychelles
        '249' => %w{ }, # Sudan
        '255' => %w{ 8.. 9.. }, # Tanzania
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
        '503' => %w{ }, # El Salvador
        '509' => %w{ 8. 9. }, # Haiti
        '852' => %w{ 7... 8...}, # Hong Kong
        '964' => %w{ 0 8 9 }, # Iraq
        '970' => %w{ 1 }, # Israel (blocked cc)
        '972' => %w{ 1 }, # Israel
    }
  end
end
