module Logging
  module Collins

    def self.collins
      Genesis::Framework::Utils.collins
    end

    def self.facter
      Genesis::Framework::Utils.facter
    end

    def self.log message, level = nil
      asset_tag = facter['asset_tag']

      # The AssetCreation task may try to log before the asset exists in Collins
      if asset_tag && collins.exists?(asset_tag)
        collins.log! facter['asset_tag'], message, level
      end
    end
  end
end
