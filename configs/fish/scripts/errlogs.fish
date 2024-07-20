#!/usr/bin/env fish

# check if the script mac or linux
if test (uname) = "Darwin"
    # run ./errlogs_mac.fish with the provided argument
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

    exit 0
end

# check if script is run as root/sudo, if not run as root
if test (id -u) -ne 0
    sudo errlogs $argv
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