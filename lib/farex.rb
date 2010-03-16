# expand search path to components subdir.
$: << File.expand_path(File.dirname(__FILE__) + "/farex/")

# load other files
require "grid"
require "agent"
require "bug"

