module Wave
  module Delegate
    class Base
      def application(app, didFinishLaunchingWithOptions:options)
        @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
        setup_window
        @window.makeKeyAndVisible
        true
      end
      
      def setup_window
        raise "This method must be overriden."
      end
    end
  
    class Storyboard < Base
      def self.storyboard(name = nil, bundle = nil)
        if name   
          @storyboard = UIStoryboard.storyboardWithName(name, bundle:bundle)
        end
        
        @storyboard ||= nil
      end
      
      def setup_window
        @storyboard = self.class.storyboard
        @window.rootViewController = @storyboard.instantiateInitialViewController
      end
    end
  end
end