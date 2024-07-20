#!/usr/bin/env fish

# check if the script mac or linux
if test (uname) = "Darwin"
    # run ./errlogs_mac.fish with the provided argument
    fish ./errlogs_mac.fish $argv
    exit 0
end

# check if script is run as root/sudo, if not run as root
if test (id -u) -ne 0
    sudo fish ./errlogs.fish $argv
    exit 0
end

# Check if exactly one argument is passed
if test (count $argv) -ne 1
    echo "Usage: script_name <number>"
    exit 1
end

# Check if the argument is a number
set arg $argv[1]
if not echo $arg | grep -qE '^[0-9]+$'
    echo "Error: The argument must be a number."
    exit 1
end

sudo journalctl -b-&arg -p 3 --no-pager