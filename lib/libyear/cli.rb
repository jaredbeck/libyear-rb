require "bundler/cli"
require "bundler/cli/outdated"
require "libyear/report"
require "libyear/query"

module Libyear
  class CLI
    def initialize(argv)
      deprecate
      validate_arguments(argv)
      @gemfile_path = argv.first
    end

    def run
      print Report.new(Query.new(@gemfile_path).execute).to_s
    end

    private

    def deprecate
      $stderr.puts(
        <<-EOS
Deprecated: please use libyear-bundler instead
https://github.com/jaredbeck/libyear-rb/issues/1
Future versions of the libyear gem will run both libyear-bundler and
libyear-npm (or libyear-yarn). How cool would that be?
        EOS
      )
    end

    def validate_arguments(argv)
      # todo
    end
  end
end
