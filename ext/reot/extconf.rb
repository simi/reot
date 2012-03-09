# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

$CFLAGS = "-Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wpointer-arith -Wwrite-strings"

# Give it a name
extension_name = 'reot'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)
