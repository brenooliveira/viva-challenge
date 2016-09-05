require 'bundler'
require 'rack'
require 'bundler/setup'
require 'rubygems'
require 'erb'
require 'logger'
require 'grape'
require 'json'
require 'ostruct'
require 'roar/representer'
require 'roar/json'
require 'roar/json/hal'
require 'grape-roar'
require 'grape-swagger'
require 'require_all'
require 'mongoid'
require 'autoinc'

ROOT = Pathname.new(File.expand_path('../', __FILE__))

require_all 'app/**/*.rb'

Bundler.require
Bundler.require(:default, ENV['RACK_ENV'] || :development)
Mongoid.load!("config/mongoid.yml", ENV['RACK_ENV'] || :development)
Mongoid.raise_not_found_error=false
