class LibIXM

  module Interfaces

    module Simple
      
      def attach_reflex( signal_regex, &action )
        adapter.every_packet { |packet|
          action.call(packet) if packet.match( signal_regex )
        }
      end
    
    end
  
  end

end
