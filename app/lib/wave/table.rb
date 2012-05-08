module Wave
  module Table
    def table
      @table ||= self.class.table      
    end
    
    def tableView(table_view, cellForRowAtIndexPath:path)
      row = table.row_with_path(path)
      cell = table_view.dequeueReusableCellWithIdentifier(row.reuse_identifier) || row.cell_builder.call(row)
            
      row.cell_customizer.call(cell)
      
      cell
    end
    
    def numberOfSectionsInTableView(table_view)
      table.sections.count
    end
    
    def tableView(table_view, numberOfRowsInSection:section)
      table.rows_in_section(section)
    end
    
    def tableView(table_view, titleForHeaderInSection:section)
      table.sections[section].header
    end
    
    def tableView(table_view, titleForFooterInSection:section)
      table.sections[section].footer
    end
    
    def tableView(table_view, commitEditingStyle:editing_style, forRowAtIndexPath:path)
    end
    
    def tableView(table_view, canEditRowAtIndexPath:path)
      false
    end
    
    def tableView(table_view, canMoveRowAtIndexPath:path)
      false
    end
    
    def tableView(table_view, moveRowAtIndexPath:start_path, toIndexPath:dest_path)
    end
    
    def tableView(table_view, didSelectRowAtIndexPath:path)
      row = table.row_with_path(path)

      if row.action
        if row.action.is_a? Proc
          self.instance_exec &row.action
        else
          if row.target
            row.target.send(row.action)
          else
            self.send(row.action)
          end
        end
      end
    end
    
    module ClassMethods
      def table_view_builder
        @table = Table.new
        yield @table
      end
      
      def table
        @table 
      end
    end
    
    def self.included(child)
      child.extend ClassMethods
    end
    
    class Table
      attr_accessor :sections
      
      def initialize
        @sections = []
      end
      
      def section
        new_section = Section.new
        yield new_section
        @sections << new_section
      end
      
      def rows_in_section(section)
        @sections[section].rows.count
      end
      
      def row_with_path(path)
        @sections[path.section].rows[path.row]
      end
    end
    
    class Section
      attr_accessor :header, :footer, :rows
      
      def initialize
        @rows = []
      end
      
      def row
        new_row = Row.new
        yield new_row
        @rows << new_row
      end
    end
    
    class Row
      attr_accessor :title, :detail
      attr_accessor :style, :reuse_identifier
      
      attr_accessor :cell_builder, :cell_customizer
      
      attr_accessor :action, :target
      
      def initialize
        @reuse_identifier = "com.helloresolven.wave"
        @style = UITableViewCellStyleDefault
        @cell_builder = lambda { |row| UITableViewCell.alloc.initWithStyle(row.style, reuseIdentifier:row.reuse_identifier) }
        
        @cell_customizer = lambda do |cell|
          cell.textLabel.text = @title
          cell.detailTextLabel.text = @detail if cell.detailTextLabel 
        end        
      end
    end
  end
end