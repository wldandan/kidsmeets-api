require File.dirname(__FILE__) + '/config/boot'
require 'kids_meets'
require 'rack/static'
require 'webrick'

WEBrick::Config::HTTP[:RequestTimeout] = 2300

#use Rack::Static, :urls => ["/hal-browser"], :root => "vendor"

run Rack::URLMap.new(
    '/' => Rack::File.new('public/root.json', { 'Cache-Control' => 'no-cache' }),
    '/events' => KidsMeets::API::Event,
)
