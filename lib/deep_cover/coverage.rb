# frozen_string_literal: true

module DeepCover
  bootstrap

  class Coverage
  end
  require_relative_dir 'coverage'
  Coverage.include Coverage::Istanbul
end
