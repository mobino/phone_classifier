Phone Classifier
================

Used to quickly classifiy a phone number into :landline, :mobile or :forbidden

Installation
------------

    gem install phone_classifier

Usage
-----

    PhoneClassifier.new('41791234567').kind        # => :mobile
    PhoneClassifier.new('41791234567').mobile?     # => true
    PhoneClassifier.new('41791234567').forbidden?  # => false


Supported Countries
-------------------

* +1, USA (will only reject service numbers, all other numbers considered mobile). Blame the US numbering systems
* +6, Greece
* +31, Netherlands
* +30, Greece
* +31, Netherlands
* +32, Belgium
* +33, France
* +34, Spain
* +36, Hungary
* +39, Italy
* +40, Romania
* +41, Switerzland
* +43, Austria
* +44, UK
* +45, Denmark
* +46, Sweden
* +47, Norway
* +48, Poland
* +49, Germany
* +212, Morocco
* +213, Algeria
* +233, Ghana
* +234, Nigeria
* +249, Sudan
* +350, Gibraltar
* +351, Portugal
* +352, Luxembourg
* +353, Ireland
* +354, Iceland
* +356, Malta
* +357, Cyprus
* +358, Finland
* +359, Bulgaria
* +370, Lithuania
* +372, Estonia
* +377, Monaco
* +386, Slovenia
* +420, Czech Republic
* +421, Slovakia


Where is it used
----------------

Used in Mobino[http://mobino.com], a mobile payment service, to classifiy client phone numbers

Related
-------

PhoneClassifier uses the fantastic 'Phony'[http://github.com/floere/phony.git] library to normalize numbers. Phony is
the tool of choice if you need to work with phone numbers in Ruby.

Contributing
------------

1. Fork it
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create new Pull Request
