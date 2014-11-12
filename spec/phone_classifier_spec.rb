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
      it 'should set mobile numbers' do
        phone_number = "5215531048111"
        PhoneClassifier.new(phone_number).kind.should == :mobile
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

      it "should set Nigeria mobile numbers" do
        phone_number = "2347021 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set Nigeria mobile numbers" do
        phone_number = "234704 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set Nigeria mobile numbers (80x)" do
        phone_number = "234804 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set Nigeria mobile numbers (81x)" do
        phone_number = "234815 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :mobile
      end

      it "should set Nigeria land numbers" do
        phone_number = "2341 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :landline
      end

      it "should set Nigeria forbidden numbers" do
        phone_number = "234800 555 5555"
        PhoneClassifier.new(phone_number).kind.should == :forbidden
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

  context "Iran Numbers" do

    it "should set landline numbers" do
      phone_number = "98 21 1123 1234"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end

    it "should set mobile numbers" do
      phone_number = "98 919 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set service numbers" do
      phone_number = "98 961 123 1234"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
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

  context "Malaysian Numbers" do

    it "should set Malaysian mobile numbers" do
      phone_number = "60 11 1234 5678"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end


  end

  context "Moroccon Numbers" do

    it "should set Moroocan mobile numbers" do
      phone_number = "212 6 52 22 11 44"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set Morocoan landline numbers " do
      phone_number = "212 45 1234 123"
      PhoneClassifier.new(phone_number).kind.should == :landline
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

    it "should set UK mobile numbers" do
      phone_number = "447412121314"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set UK mobile numbers" do
      phone_number = "44778533097"
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it "should set UK land numbers" do
      phone_number = "442012121314"
      PhoneClassifier.new(phone_number).kind.should == :landline
    end

    it "should set UK forbidden numbers" do
      phone_number = "4480012121314"
      PhoneClassifier.new(phone_number).kind.should == :forbidden
    end

  end

  context 'Zambian numbers' do
    it 'recognizes CellZ as mobile' do
      phone_number = '260955123456'
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it 'recognizes MTN as mobile' do
      phone_number = '260966123456'
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end

    it 'recognizes Celtel as mobile' do
      phone_number = '260977123456'
      PhoneClassifier.new(phone_number).kind.should == :mobile

      phone_number = '260978123456'
      PhoneClassifier.new(phone_number).kind.should == :mobile

      phone_number = '260979123456'
      PhoneClassifier.new(phone_number).kind.should == :mobile
    end
  end

end