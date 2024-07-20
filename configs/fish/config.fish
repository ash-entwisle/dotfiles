if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval 'zoxide init fish | source'

abbr --add 'la' 'ls -al'
abbr --add 'ssh' 'kitty +kitten ssh' 
abbr --add 'hxfsh' 'hx ~/.config/fish'
abbr --add 'cls' 'clear'
abbr --add 'hxc' 'hx ~/.config/'
abbr --add 'nv' 'nvim'
abbr --add 'cd' 'z'

# for each script in the scripts directory, create an alias for it with the name of the script

for script in ~/.config/fish/scripts/*

    chmod +x $script

    set script_name (basename $script) 
    set script_name_split (string split -r . $script_name)
    set script_name $script_name_split[1]

    abbr --add $script_name $script
end