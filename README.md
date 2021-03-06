Phone Classifier
================

Used to quickly classifiy a phone number into :landline, :mobile or :forbidden

Current Travis Build Status: [![Build Status](https://secure.travis-ci.org/mobino/phone_classifier.png?branch=master)](https://travis-ci.org/mobino/phone_classifier)

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
* +54, Argentina
* +60, Malaysia
* +61, Australia
* +65, Singapore
* +90, Turkey
* +94, Sri Lanka
* +91, India
* +98, Iran
* +212, Morocco
* +213, Algeria
* +233, Ghana
* +234, Nigeria
* +248, Seychelles
* +249, Sudan
* +255, Tanzania
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
* +503, El Salvador
* +509, Haiti
* +852, Hong Kong
* +972, Israel


Where is it used
----------------

Used in [Mobino](http://mobino.com), a mobile payment service, to classifiy client phone numbers

Related
-------

PhoneClassifier uses the fantastic [Phony](http://github.com/floere/phony.git) library to normalize numbers. Phony is
the tool of choice if you need to work with phone numbers in Ruby.

Contributing
------------

1. Fork it
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create new Pull Request
