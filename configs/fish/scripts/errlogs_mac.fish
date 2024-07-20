#!/usr/bin/env fish

# Check if exactly one argument is passed
if test (count $argv) -ne 1
    echo "Usage: script_name <logname>"
    exit 1
end

# Check if the argument is a string
set arg $argv[1]

if not echo $arg | grep -qE '^[a-zA-Z]+$'
    echo "Error: The argument must be a string."
    exit 1
end

# cat the log file
cat /var/log/$arg.log