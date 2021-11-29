require 'json'

json_file = File.read("#{Dir.home}/files.json")

data = JSON.parse(json_file)

data.each do |file|
  p file
end

