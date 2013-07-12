# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

$CFLAGS = "-Wall -Wno-multichar -fPIC"

# Give it a name
extension_name = 'reot'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)
