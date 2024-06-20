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
