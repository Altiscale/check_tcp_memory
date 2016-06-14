require 'check_tcp_memory'
require 'nagiosplugin'

module CheckTCPMemory
  class Check < Nagios::Plugin
    def initialize(options)
      @warn_percent = options[:warn_percent]
      @crit_percent = options[:crit_percent]
    end

    def critical?
      @percent_used >= @crit_percent
    end

    def warning?
      @percent_used >= @warn_percent
    end

    def ok?
      true
    end

    def check
      #@mem_max = File.read('/proc/sys/net/ipv4/tcp_mem').split()[2]
      @mem_max = File.read('/tmp/tcp_mem').split()[2].to_f
      #@current_usage = File.read('/proc/net/sockstat').gsub(':','').split("\n")\
      @current_usage = File.read('/tmp/sockstat').gsub(':','').split("\n")\
        .map{|a| b=a.split; Hash[b.shift, Hash[*b]]}\
        .reduce({}, :merge)['TCP']['mem'].to_f
      @percent_used = @current_usage / @mem_max
    end

    def message
      "Percent Used: #{"%5.2f" % (@percent_used * 100)}%, "\
      "Current Usage: #{@current_usage}, Max TCP Memory: #{@mem_max}"
    end
  end
end
