class LibIXM

  module Adapters

    class SFBProg
      attr_accessor :packet_callbacks

      def initialize(options)
        options = {
          :sfbprog_path => 'sfbprog',
          :sfbprog_args => '',
          :sfbprog_device => '/dev/ttyUSB0',
          :sfbprog_sketch => File.join( File.dirname(__FILE__), '..', '..', 'sketches', 'packet_echo.hex' )
        }.merge(options)

        @sfbprog = IO.popen( "
#{options[:sfbprog_path]} \
-n #{options[:sfbprog_device]} \
-S - \
-t 0 \
#{options[:sfbprog_args]} \
-f #{options[:sfbprog_sketch]}",
          'w+'
        )

        @packet_callbacks = []
        start
      end

      def start
        3.times { build_line }
        send_packet('') # SFBProg needs a dummy packet first.
        sleep 2 # Disgusting, but it takes time.
        @read_thread = Thread.new {
          loop {
            line = build_line
            respond_to( line )
            Thread.pass
          }
        }
      end

      def build_line
        line = String.new
        loop {
          begin
            char = @sfbprog.read_nonblock(1)
            break if char == "\n"
            line << char
          rescue Errno::EAGAIN
          end
        }
        line
      end

      def every_packet( &callback )
        @packet_callbacks << callback
      end

      def send_packet( packet )
        @sfbprog.puts packet.chomp
      end

      alias :<< :send_packet

      # On IO read fire @reflexes for each packet
      #
      def respond_to( packet )
        @packet_callbacks.each { |callback|
          callback.call( packet )
        }
      end

    end

  end

end
