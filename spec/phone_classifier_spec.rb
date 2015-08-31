# encoding: utf-8
#
require 'spec_helper'


describe PhoneClassifier do


  context "it classifies a phone number" do

    let(:phone_number) { "41791234567" }

    context "mobile numbers" do
      it "correctly classifies a mobile number" do
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "correctly classifies a mobile number" do
        PhoneClassifier.new(phone_number).mobile?.should == true
      end


    end

    context "forbidden numbers" do
      let(:phone_number) { "4180012345" }
      it "correctly classifies a forbidden number" do
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

      it "correctly classifies a forbidden number" do
        PhoneClassifier.new(phone_number).forbidden?.should == true
      end
    end

  end


  context "kinds of numbers" do


    context "Argentinan Numbers" do

      it "should set AG mobile numbers" do
        phone_number = "54111234566"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end


    end

    context "Austrian Numbers" do

      it "should set AT mobile numbers" do
        phone_number = "4369911031234"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end


    end


    context "Australian Numbers" do

      it "should set AU mobile numbers" do
        phone_number = "61412123123"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set AU forbideen numbers" do
        phone_number = "61190123123"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

    end
    context "Belgium Numbers" do

      it "should set BE mobile numbers" do
        phone_number = "32497546747"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set BE land numbers" do
        phone_number = "326279584"
        PhoneClassifier.new(phone_number).kind.should == :landline

      end

    end


    context 'Brazil numbers' do
      # see http://www.itu.int/dms_pub/itu-t/oth/02/02/T020200001D0001PDFE.pdf

      before(:each) do
        @new_mobile_numbering_ndcs = %w{11 12 13 14 15 16 17 18 19 21 22 24 27 28 91 92 93 94 95 96 97 98 99}
        @old_mobile_numbering_ndcs = %w{31 32 33 34 35 37 38 41 42 43 44 45 46 47 48 49 51 52 53 54 55 61 62 63 64 65 66 67 68 69 71 73 74 75 77 79 81 82 83 84 85 86 87 88 89}
      end

      it 'returns "mobile" for special states converted to new numbering plan from ANATEL (9\d{8})' do
        @new_mobile_numbering_ndcs.each do |state_code|
          phone_number = "55#{state_code}993051123"
          PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        end
      end

      it 'returns "mobile" for states still using old mobile numbering plan' do
        # the old numbering plan used 9,8,7,6 as the first digit in the subscriber number to indicate a mobile number
        @old_mobile_numbering_ndcs.each do |state_code|
          6.upto(9).each do |initial_digit|
            phone_number = "55#{state_code}#{initial_digit}3051123"
            PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
          end
        end
      end

      it 'returns "landline" for special states already using the new mobile numbering plan' do
        @new_mobile_numbering_ndcs.each do |state_code|
          0.upto(8).each do |initial_digit|
            phone_number = "55#{state_code}#{initial_digit}3051123"
            PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
          end
        end
      end

      it 'returns "landline" for states still using old mobile numbering plan' do
        @old_mobile_numbering_ndcs.each do |state_code|
          0.upto(5).each do |initial_digit|
            phone_number = "55#{state_code}#{initial_digit}3051123"
            PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
          end
        end
      end

      it 'Mobino distributor checks' do
        %w(5511999089149 5511976076005).each do |phone_number|
          PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        end
      end

    end

    context "Swiss Numbers" do

      it "should set CH mobile numbers" do
        phone_number = "41791234567"
        PhoneClassifier.new(phone_number).kind.should == :mobile

      end

      it "should set CH land numbers" do
        phone_number = "41444010930"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

    end

    context "Swedish Numbers" do

      it "should set SE mobile numbers" do
        phone_number = "46729443333"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it 'properly formats the number' do
        phone_number = '46729443333'
        Phony.format(phone_number, format: :+).should eq('+46 72 944 33 33'), phone_number

        phone_number = '46734177166'
        Phony.format(phone_number, format: :+).should eq('+46 73 417 71 66'), phone_number
      end

    end

    context "Slovenian Numbers" do

      it "should set SL mobile numbers" do
        phone_number = "38651336595"
        PhoneClassifier.new(phone_number).kind.should == :mobile

      end


    end

    context "German Numbers" do

      it "should set DE mobile numbers" do
        phone_number = "49170123456"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set DE land numbers" do
        phone_number = "4977317983830"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

      it "should set DE service and paid numbers" do
        phone_number = "491805878323"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

    end

    context "Danish Numbers" do

      it "should set DK mobile numbers" do
        phone_number = "4540532577"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set DK mobile numbers" do
        phone_number = "4529727515"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set DK forbidden numbers" do
        phone_number = "4580727515"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

      it "should set DK land numbers" do
        phone_number = "4545862577"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

    end

    context "French Numbers" do

      it "should set FR forbidden numbers" do
        phone_number = "33810459827"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

      it "should set FR mobile numbers (6)" do
        phone_number = "33653832227"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set FR mobile numbers (7)" do
        phone_number = "33753832227"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set FR land numbers" do
        phone_number = "33953832227"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

    end

    context "Italian Numbers" do

      it "should set IT mobile numbers" do
        phone_number = "393357210499"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set IT land numbers" do
        phone_number = "390117210499"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

    end

    context 'Mexican Numbers' do
      it 'defines the numbers as mobile numbers' do
        # NOTE: to dial Mexican cell phones from abroad, you need to add 1 following the country code
        # In our case, this is how the numbers are stored and this is why when we check for a mobile/landline
        # we require that the 1 be present following the country code

        phone_number = "5215531048111"
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number

        phone_number = "5216641231212"
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
      end

      it 'defines the numbers as landline numbers' do
        phone_number = "525531048111"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number

        phone_number = "526641231212"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      end
    end
    context "Netherlands Numbers" do

      it "should set NL mobile numbers" do
        phone_number = "31612345678"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set NL land numbers" do
        phone_number = "31201234567"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end
      it "should set NL forbidden numbers" do
        phone_number = "318001234567"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

    end

    context "Polish Numbers" do

      it "should set PL mobile numbers" do
        phone_number = "48501224455"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set PL land numbers" do
        phone_number = "48121123123"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

      it "should set PL forbidden numbers" do
        phone_number = "488001234567"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

    end

    context "Spanish Numbers" do

      it "should set ES mobile numbers" do
        phone_number = "34 611 123 123"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set ES forbidden numbers (800)" do
        phone_number = "34800 123 123"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

      it "should set ES forbidden numbers (900)" do
        phone_number = "34901 123 123"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
      end

      it "should set ES land numbers" do
        phone_number = "34822 123 123"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

    end


    context "Nigerian Numbers" do
      # http://www.ncc.gov.ng/index.php?option=com_content&view=article&id=113&Itemid=102
      # http://www.ncc.gov.ng/index.php?option=com_docman&task=doc_download&gid=92&Itemid=

      %w(70 80 81 90).each do |prefix|
        (0..9).each do |suffix|
          ndc = "#{prefix}#{suffix}"
          phone_number = "234#{ndc}1234567"

          it "classifies the number #{phone_number} as a valid, mobile number" do
            PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
            Phony.plausible?(phone_number).should eq(true), phone_number
          end
        end
      end

      %w(70 80 81 90).each do |prefix|
        (0..9).each do |suffix|
          ndc = "#{prefix}#{suffix}"
          phone_number = "234#{ndc}123456"

          it "classifies the number #{phone_number} as possibly valid mobile number" do
            PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
            Phony.plausible?(phone_number).should eq(false), phone_number
          end
        end
      end

      %w(70 80 81 90).each do |prefix|
        (0..9).each do |suffix|
          ndc = "#{prefix}#{suffix}"
          phone_number = "234#{ndc}12345678"

          it "classifies the number #{phone_number} as a possibly valid mobile number" do
            PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
            Phony.plausible?(phone_number).should eq(false), phone_number
          end
        end
      end
    end


    context "Luxemborgian Numbers" do

      it "should set Luxembourg mobile numbers" do
        phone_number = "352661 555 555"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set Luxemborgian land numbers" do
        phone_number = "3522467 55 55 55"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

      #it "should set Luxemborgian forbidden numbers" do
      #  phone_number = TelephoneNumber.make(:base_number => "800 5 55 55",
      #                                          :country_code => "352",
      #                                          :telephonable => @client)
      #  phone_number.valid?
      #  phone_number.kind.should == :forbidden
      #end

    end

  end


  context "Haitian Numbers" do

    it "should set mobile numbers" do
      phone_number = "509 34 12 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers " do
      phone_number = "509 81 12 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end

  context "Hong Kong Numbers" do

    it "should set mobile numbers" do
      phone_number = "852 6123 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers " do
      phone_number = "852 8123 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end

  context 'Indian Numbers' do

    it 'should set mobile numbers' do
      phone_number = '91 99 111 22 111'
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it 'should set service numbers ' do
      phone_number = '91 96 111 22 111'
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end

  context "Iranian Numbers" do
    # http://en.wikipedia.org/wiki/Telephone_numbers_in_Iran
    # http://www.itu.int/dms_pub/itu-t/oth/02/02/T02020000660001PDFE.pd

    it "should set landline numbers" do
      phone_number = "98 21 1123 1234"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end

    it "should set service numbers" do
      phone_number = "98 961 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end

    [901, 902].push( (910..939).to_a ).flatten.each do |ndc|
      phone_number = "98#{ndc}1234567"

      it "classifies the number #{phone_number} as a valid, mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

    [901, 902].push( (910..939).to_a ).flatten.each do |ndc|
      phone_number = "98#{ndc}123456"

      it "classifies the number #{phone_number} as a possibly valid mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end

    [901, 902].push( (910..939).to_a ).flatten.each do |ndc|
      phone_number = "98#{ndc}12345678"

      it "classifies the number #{phone_number} as a possibly valid mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end
  end

  context "Iraqi Numbers" do

    it "should set landline numbers" do
      phone_number = "964 40 123 456"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end

    it "should set mobile numbers" do
      phone_number = "964 753 123 4567"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

  end

  context 'Israelian numbers' do
    it 'sets landline number' do
      phone_number = "972 2 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end

    it 'sets mobile numbers' do
      phone_number = "972 59 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it 'sets service numbers' do
      phone_number = "972 1 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end


  context 'Ivory Coast numbers' do
    # http://www.itu.int/dms_pub/itu-t/oth/02/02/T02020000310001PDFE.pdf
    # http://en.wikipedia.org/wiki/Telephone_numbers_in_Ivory_Coast

    %w(20 21 22 23 24 30 31 32 33 34 35 36).each do |ndc|
      phone_number = "225#{ndc}123456"

      it "classifies the number #{phone_number} as a valid, landline number" do
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

    %w(01 02 03 04 05 06 07 08 09 44 45 46 47 48 49 50 54 60 66 67 69 77 78).each do |ndc|
      phone_number = "225#{ndc}123456"

      it "classifies the number #{phone_number} as a valid, mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

    %w(01 02 03 04 05 06 07 08 09 44 45 46 47 48 49 50 54 60 66 67 69 77 78).each do |ndc|
      phone_number = "225#{ndc}12345"

      it "classifies the number #{phone_number} as a possibly valid mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end

    %w(01 02 03 04 05 06 07 08 09 44 45 46 47 48 49 50 54 60 66 67 69 77 78).each do |ndc|
      phone_number = "225#{ndc}1234567"

      it "classifies the number #{phone_number} as a possibly valid mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end
  end

  context "Malaysian Numbers" do

    it "should set Malaysian mobile numbers" do
      phone_number = "60 11 1234 5678"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end


  end

  context "Moroccan Numbers" do
    # http://en.wikipedia.org/wiki/Telephone_numbers_in_Morocco

    it "classifies the number 212612345678 as a valid, mobile number" do
      phone_number = "212612345678"

      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
      Phony.plausible?(phone_number).should eq(true), phone_number
    end

    it "classifies the number 21261234567 as a possibly valid mobile number" do
      phone_number = "21261234567"

      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
      Phony.plausible?(phone_number).should eq(false), phone_number
    end

    it "classifies the number 2126123456789 as a possibly valid mobile number" do
      phone_number = "2126123456789"

      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
      Phony.plausible?(phone_number).should eq(false), phone_number
    end

    it "should set Moroccan landline numbers " do
      phone_number = "212 45 1234 123"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end
  end

  context "Myanmar Numbers" do
    it "should set mobile numbers" do
      phone_number = "95 9 250 233 058"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end
  end

  context "Seychelle Numbers" do

    it "should set mobile numbers" do
      phone_number = "248 2 12 34 56"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers " do
      phone_number = "248 8 12 34 56"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end

  context "Singapore Numbers" do

    it "should set mobile numbers" do
      phone_number = "65 8123 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers " do
      phone_number = "65 3123 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end


  context 'South Africa' do
    # http://www.itu.int/dms_pub/itu-t/oth/02/02/T02020000C10001PDFE.pdf
    # Page 25, Table 4
    %w(60 61 62 63 64 65 70 71 72 73 74 76 77 78 79 81 82 83 84).each do |ndc|
      phone_number = "27#{ndc}1234567"
      it "classifies the number #{phone_number} as a valid, mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end
  end

  context "Sri Lanka Numbers" do

    it "should set mobile numbers" do
      phone_number = "94 071 123 12 12"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

  end

  context "Tanzania Numbers" do

    it "should set mobile numbers" do
      phone_number = "255 61 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers " do
      phone_number = "255 801 23 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end
  end

  context 'Turkey numbers' do
    phone_number = "90 532 412 5111"
    PhoneClassifier.new(phone_number).kind.should == :mobile
  end

  context "UK Numbers" do

    %w(447412121314 447785330971).each do |phone_number|
      it "classifies the number #{phone_number} as a valid UK mobile" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

    %w(44741 447412 4474123 44741234 447412345 44741234567 4474123456789 44741234567890).each do |phone_number|
      it "classifies the number #{phone_number} as an invalid UK mobile" do
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end

    it 'classifies the number 442012121314 as a valid UK landline' do
      phone_number = '442012121314'
      PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      Phony.plausible?(phone_number).should eq(true), phone_number
    end

    it 'classifies the number 4480012121314 as a forbidden UK number' do
      phone_number = '4480012121314'
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end

  end

  context 'Uzbekistan' do
    # http://www.itu.int/dms_pub/itu-t/oth/02/02/T02020000E10001MSWE.doc
    %w(90 91 92 93 94 97 98 99).each do |ndc|
      phone_number = "998#{ndc}1234567"
      it "classifies the number #{phone_number} as a valid, mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

    %w(90 91 92 93 94 97 98 99).each do |ndc|
      phone_number = "998#{ndc}123456"
      it "classifies the number #{phone_number} as a possible mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end

    %w(90 91 92 93 94 97 98 99).each do |ndc|
      phone_number = "998#{ndc}12345678"
      it "classifies the number #{phone_number} as a possible mobile number" do
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(false), phone_number
      end
    end

    %w(61 62 65 66 67 69 71 72 73 74 75 76 79).each do |ndc|
      phone_number = "998#{ndc}1234567"
      it "classifies the number #{phone_number} as a valid, landline number" do
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end
  end

  context 'Zambian numbers' do
    # see http://www.itu.int/oth/T02020000E8/en

    it 'returns "mobile" for CellZ' do
      phone_number = '260955123456'
      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
    end

    it 'returns "mobile" for MTN' do
      phone_number = '260966123456'
      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
    end

    it 'returns "mobile" for Celtel' do
      phone_number = '260977123456'
      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number

      phone_number = '260978123456'
      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number

      phone_number = '260979123456'
      PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
    end

    it 'returns "landline" for non-mobile 95xxx numbers' do
      ([*0..9] - [5]).each do |digit|
        # 5 is the mobile indicator for the ndc 95
        phone_number = "26095#{digit}123456"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      end
    end

    it 'returns "landline" for non-mobile 96xxx numbers' do
      ([*0..9] - [6]).each do |digit|
        # 6 is the mobile indicator for the ndc 96
        phone_number = "26096#{digit}123456"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      end
    end

    it 'returns "landline" for non-mobile 97xxx numbers' do
      0.upto(6).each do |digit|
        # 7-9 is the mobile indicator for the ndc 97
        phone_number = "26097#{digit}123456"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      end
    end

    it 'returns "landline" for landline numbers' do
      # 021Y XXXXXX where Y is in [1..8]
      1.upto(8).each do |digit|
        phone_number = "26021#{digit}123456"
        PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
      end
    end
  end

  context 'Zimbabwean numbers' do
    # http://www.itu.int/dms_pub/itu-t/oth/02/02/T02020000E90002PDFE.pdf
    # Page 5, Section 6 (Public Mobile Telecommunication Network Services)

      { 'NetOne Celluar'     => %w(71),
        'Telecel Zimbabwe'   => %w(73),
        'Econet Wireless'    => %w(77 78) }.each do |operator, ndcs|

        ndcs.each do |ndc|
          phone_number = "263#{ndc}2345678"
          it "classifies the number #{phone_number} as a valid, mobile number for the operator '#{operator}'" do
            PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
            Phony.plausible?(phone_number).should eq(true), phone_number
          end
        end

      end
  end

  context 'Brazil numbers' do
    # see http://www.itu.int/dms_pub/itu-t/oth/02/02/T020200001D0001PDFE.pdf

    before(:each) do
      @new_mobile_numbering_ndcs = %w{11 12 13 14 15 16 17 18 19 21 22 24 27 28 91 92 93 94 95 96 97 98 99}
      @old_mobile_numbering_ndcs = %w{31 32 33 34 35 37 38 41 42 43 44 45 46 47 48 49 51 52 53 54 55 61 62 63 64 65 66 67 68 69 71 73 74 75 77 79 81 82 83 84 85 86 87 88 89}
    end

    it 'returns "mobile" for special states converted to new numbering plan from ANATEL (9\d{8})' do
      @new_mobile_numbering_ndcs.each do |state_code|
        phone_number = "55#{state_code}993051123"
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
      end
    end

    it 'returns "mobile" for states still using old mobile numbering plan' do
      # the old numbering plan used 9,8,7,6 as the first digit in the subscriber number to indicate a mobile number
      @old_mobile_numbering_ndcs.each do |state_code|
        6.upto(9).each do |initial_digit|
          phone_number = "55#{state_code}#{initial_digit}3051123"
          PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        end
      end
    end

    it 'returns "landline" for special states already using the new mobile numbering plan' do
      @new_mobile_numbering_ndcs.each do |state_code|
        0.upto(8).each do |initial_digit|
          phone_number = "55#{state_code}#{initial_digit}3051123"
          PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
        end
      end
    end

    it 'returns "landline" for states still using old mobile numbering plan' do
      @old_mobile_numbering_ndcs.each do |state_code|
        0.upto(5).each do |initial_digit|
          phone_number = "55#{state_code}#{initial_digit}3051123"
          PhoneClassifier.new(phone_number).kind.should eq(:landline), phone_number
        end
      end
    end

    it 'Mobino distributor checks' do
      %w(5511999089149 5511976076005).each do |phone_number|
        PhoneClassifier.new(phone_number).kind.should eq(:mobile), phone_number
        Phony.plausible?(phone_number).should eq(true), phone_number
      end
    end

  end

end