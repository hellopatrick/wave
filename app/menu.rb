class Menu < UITableViewController
  include Wave::Table
  
  static_source do |table|
    table.section do |section|
      section.header = "Menu"
      
      section.row do |row|
        row.title = 'Launch Game'
        row.action = 'launch_game'
      end
      
      section.row do |row|
        row.title = 'Preferences'
        row.detail = 'subtitle'
        row.reuse_identifier = 'something.else'
        
        row.action = lambda do 
          alert = UIAlertView.alloc.initWithTitle "Preferences", message:"You pressed the preferences", delegate:nil, cancelButtonTitle:"Okay", otherButtonTitles:nil
          alert.show
        end
        row.style = UITableViewCellStyleSubtitle
      end     
    end
    
    table.section do |section|
      section.header = "Header"
      section.footer = "Footer"
      section.row do |row|
        row.title = 'High Scores'
      end  
    end
  end
  
  def launch_game
    puts "hey, launched game!"
  end
end
