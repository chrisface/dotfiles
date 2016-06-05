#!/usr/bin/env ruby
require('fileutils')

CONFIG_FILES = {
	'terminator'           => File.join(ENV['HOME'], '.config', 'terminator', 'config')
}

COLORS = {red: 31, green: 32, yellow: 33}

def install_config(config_file, destination)
	print "Installing #{config_file} to #{destination}"
	FileUtils.cp(config_file, destination)
  puts colour_string("\tsuccess!", :green)
end

def install
  puts colour_string('#####Installing DotFiles#####', :yellow)
	CONFIG_FILES.each do |config_file, destination|
		install_config(config_file, destination)
	end
end

def colour_string(string, colour)
  "\e[#{COLORS[colour]}m#{string}\e[0m"
end

install()
