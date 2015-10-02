require "pnglitch"

INPUT_FILE_NAME = 'sample'
INPUT_DIRECTORY = "#{Dir.home}/Desktop/"
OUPUT_DIRECTORY = INPUT_DIRECTORY
OUTPUT_FILE_SUFFIX = '-glitched'

FILTERS = {none: 0, sub: 1,  up: 2, average: 3, paeth: 4}

PNGlitch.open("#{INPUT_DIRECTORY}#{INPUT_FILE_NAME}.png") do |png|
  png.each_scanline do |scanline|
    scanline.change_filter FILTERS[:average]
  end
  png.glitch do |data|
    data.gsub /\d/, 'x'
  end
  png.save "#{OUTPUT_DIRECTORY}#{INPUT_FILE_NAME}#{OUTPUT_FILE_SUFFIX}.png"
end