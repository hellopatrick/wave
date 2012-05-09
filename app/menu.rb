class Menu < UITableViewController
  include Wave::Table
  
  table_view_builder do |table|
    table.section do |section|
      section.header = "Menu"
      
      section.row do |row|
        row.title = "Launch"
        row.action = 'launch_game'
      end
      
      section.row do |row|
        row.title = 'Preferences'
        row.detail = 'View Preferences'
        row.reuse_identifier = 'something.else'
        
        row.action = lambda do 
          alert = UIAlertView.alloc.initWithTitle "Preferences", message:"You pressed the preferences", delegate:nil, cancelButtonTitle:"Okay", otherButtonTitles:nil
          alert.show
        end
        row.style = UITableViewCellStyleSubtitle
      end     
    end
    
    table.section do |section|
      section.header = "I Have A Header"
      section.footer = "I Have A Footer"
      
      section.row do |row|
        row.reuse_identifier = "preferences"
        row.style = UITableViewCellStyleValue1
        
        row.action = lambda do
          controller = storyboard.instantiateViewControllerWithIdentifier("Plus")
          self.navigationController.pushViewController(controller, animated:true)
        end
        
        # return a cell
        row.cell_builder = lambda do |row|
          UITableViewCell.alloc.initWithStyle(row.style, reuseIdentifier:row.reuse_identifier)
        end
        
        # customize your cell
        row.cell_customizer = lambda do |cell|
          cell.textLabel.text = "High Scores"
          cell.detailTextLabel.text = "ho hum."
          cell.detailTextLabel.font = UIFont.italicSystemFontOfSize 12
        end
      end  
    end
  end
  
  def launch_game
    puts "from a method."
  end
end
