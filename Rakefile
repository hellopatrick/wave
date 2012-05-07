$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'wave'
  app.file_dependencies 'app/menu.rb' => ['app/lib/wave/table.rb']
end
