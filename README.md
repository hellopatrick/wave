# Wave

A library (soon to be gem) for RubyMotion that smooths some of CocoaTouch's pricklier sides.

## Current Helpers

### Wave::Table mixin

Use with UITableViewController to quickly produce static tables.

    static_source do |table|
      table.section do |section|
        section.header = "Menu"
      
        section.row do |row|
          row.title = 'Launch Game'
          row.action = 'launch_game'
        end
      
        section.row do |row|
          row.title = 'Preferences'
          row.detail = 'So...'
          
          row.style = UITableViewCellStyleSubtitle
          row.reuse_identifier = 'subtitle'
          
          row.action = lambda do 
            puts "or use a block!"
          end
        end     
      end
    end
    
 Check out app/menu.rb for full example.

# License

Copyright (c) 2012 Patrick Rogers

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.