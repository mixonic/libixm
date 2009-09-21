require File.join( File.dirname(__FILE__), 'adapters', 'sfbprog' )
require File.join( File.dirname(__FILE__), 'interfaces', 'simple' )

class LibIXM
  attr_accessor :settings

  def initialize( options={} )
    self.settings = {
      :adapter => :SFBProg,
      :interface => :Simple
    }.merge(options)
    self.extend LibIXM::Interfaces.const_get(
      "#{self.settings[:interface]}"
    )
  end

  def adapter
    @adapter ||= LibIXM::Adapters.const_get(
      "#{self.settings[:adapter]}"
    ).new(self.settings)
  end

  ADAPTER_DELEGATED_METHODS = %w{
    <<
    send_packet
  }

  ADAPTER_DELEGATED_METHODS.each do |method|
    eval "def #{method}(*args, &block); adapter.#{method}(*args, &block); end"
  end


end
