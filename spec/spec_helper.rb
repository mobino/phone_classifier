begin
  require 'bundler'
rescue LoadError => e
  require 'rubygems'
  require 'bundler'
end
Bundler.setup :test
Bundler.require

SPEC_ROOT = File.expand_path(File.dirname(__FILE__))

require File.expand_path '../../lib/phone_classifier', __FILE__

require 'spec_helper_extensions'
include SpecHelperExtensions