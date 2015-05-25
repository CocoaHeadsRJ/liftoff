module Liftoff
  class CarthageSetup
    def initialize(config)
      @config = config
    end

    def setup_carthage()
      if @config.use_carthage
        if carthage_installed?
          move_cartfile
        else
          puts 'Please install Carthage or disable carthage from liftoff'
        end
      end
    end

    def install_carthage()
      if @config.use_carthage
        if carthage_installed?
          run_carthage_update
        end
      end
    end

    private

    def carthage_installed?
      system('which carthage > /dev/null')
    end

    def move_cartfile
      FileManager.new.generate('Cartfile', 'Cartfile', @config)
    end

    def run_carthage_update
      puts 'Running carthage update'
      system('carthage update')
    end
  end
end
