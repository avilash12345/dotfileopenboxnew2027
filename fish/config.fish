if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    #add path 
    # or add sbin to fish PATH permanently
    fish_add_path /usr/sbin
    fish_add_path /sbin
    fish_add_path ~/.bun/bin
    #alias
    alias ls='eza -alh --grid --icons'
    alias install='sudo apt install'
    alias uninstall='sudo apt purge'
    alias search='sudo apt search'
    alias syu='sudo apt update'
    alias syyu='sudo apt upgrade'
    alias syuall='sudo apt update && sudo apt upgrade'
    alias gi='git init'
    alias gs='git status'
    alias ga='git add .'
    alias gc='git commit -m'
    alias gp='git push'
    alias python='python3'
    #terminal prompt
    oh-my-posh init fish --config /home/avilash/.config/oh-my-posh/themes/space.omp.json | source
end
