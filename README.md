# Wave

A library (soon to be gem) for RubyMotion that smooths some of CocoaTouch's pricklier sides.

## Current Helpers

### Wave::Table mixin

Use with UITableViewController to quickly produce static tables.

    class Menu < UITableViewController
      # this includes table_view_builder DSL
      # and the required methods for UITableViewDataSource and UITableViewDelegate
      include Wave::Table
      
      # creates a new table, only call once.
      table_view_builder do |table|
        # create a new section in the table
        table.section do |section|
          section.header = "Menu"
          section.footer = "You may also footer!"
          
          # now add your rows!
          section.row do |row|
            # if you want to use a standard UITableViewCell...
            row.style = UITableViewCellStyleSubtitle
            
            # otherwise...
            row.cell_builder = lambda { |row| MyCell.alloc.init }
            
            # don't forget your reuse_identifier. You'll want to use this in cell builder, too.
            row.reuse_identifier = 'subtitled'
            
            # customizing is as simple as...
            row.title = 'Launch Game'
            row.detail = 'Start playing.'
            
            # but also...
            row.cell_customizer = lambda do |cell|
              cell.textLabel.text = NSDate.date.description
              cell.imageView.image = NSImage.imageNamed 'something_cool.png'
            end
            
            # handling taps on row
            # target-action calls a particular action on a target.
            # by default row.target = nil; this calls the method on your controller.
            row.action = 'action'
            row.target = nil
            
            # you may also use a proc.
            # this is evaluated in the controller's context
            # this gives you access to controller's properties, such as storyboard
            row.action = lambda { puts "i'm a block and so can you!" }
          end
        end
      end
    end
    
    
 Check out app/menu.rb for fuller example.

# License

Copyright (c) 2012 Patrick Rogers

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.