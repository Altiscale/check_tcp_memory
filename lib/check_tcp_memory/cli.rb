require 'check_tcp_memory'
require 'optparse'
require 'ostruct'

module CheckTCPMemory
  class CLI
    def self.parse(args)
      options = OpenStruct.new
      options[:warn_percent] = 0.5
      options[:crit_percent] = 0.6

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} -w <warn percent> -c <critical percent>"
        opts.on('-w', '--warn-percent PERCENT', 'Warning when percentage of total TCP memory is over this threashold. Default: 50%') do |ret|
          if ret.to_f > 100 || ret.to_f <= 0
            puts "Warning percent out of range! must be between 1-100"
            exit 1
          end
          options[:warn_percent] = ret.to_f / 100.0
        end

        opts.on('-c', '--crit-percent PERCENT', 'Critical when percentage of total TCP memory is over this threashold. Default: 60%') do |ret|
          if ret.to_f > 100 || ret.to_f <= 0
            puts "Critical percent out of range! must be between 1-100"
            exit 1
          end
          options[:crit_percent] = ret.to_f / 100.0
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        opts.on_tail("--version", "Show version") do
          puts CheckTCPMemory::VERSION
          exit
        end
      end

      opt_parser.parse!(args)

      return options
    end
  end
end
