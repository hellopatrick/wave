$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'wave'
  app.files = Dir.glob('./app/lib/**/*.rb') | Dir.glob('./app/**/*.rb') 
end

Rake::Task['build:simulator'].enhance ['build:compile_resources']
Rake::Task['build:device'].enhance ['build:compile_resources']

namespace :build do
  desc "Compiles .xib and .storyboard files in ./ui and places them in ./resources"
  task :compile_resources do
    Dir.glob("ui/**/*.{storyboard,xib}").each do |r|
      extension = File.extname(r)
      basename = File.basename(r, extension)
      
      new_extension = (extension == ".xib") ? ".nib" : ".storyboardc"
      new_filename = basename + new_extension
      
      system "ibtool --compile resources/#{new_filename} #{r}"
    end
  end
end