##########################
#### Rob's zsh Config ####
####### 30/04/2017 #######
##########################

#### Setup History ###
export HISTFILE=~/.zsh/histfile
export HISTSIZE=10000
export SAVEHIST=10000

#### Enable zcalc ### 
autoload -U zcalc

### Enable extra auto-completion ###
autoload -Uz compinit && compinit

### Enable prompts ###
autoload -Uz promptinit && promptinit
prompt suse

### Set Editor ###
export EDITOR='vim'
bindkey -v

### Aliases ###
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color'
alias V='valgrind --trace-children=yes'

#### Run Stuff ###
archey3

#### Custom Functions ###
# Test terminal for 256 colour
function aa_256 ()
{
    local o= i= x=`tput op` cols=`tput cols` y= oo= yy=;
    y=`printf %$(($cols-6))s`;
    yy=${y// /=};
    for i in {0..256};
    do
        o=00${i};
        oo=`echo -en "setaf ${i}\nsetab ${i}\n"|tput -S`;
        echo -e "${o:${#o}-3:3} ${oo}${yy}${x}";
    done
}

# Test terminal for special characters
function aa_spec ()
{
  i=32
  while [ $i -lt 150 ]; do
    j=`echo "obase=8; $i" | bc`
    printf "%i : %i\t%b\n" "$i" "$j" "\0$j"
    let "i++"
  done
}

# Unmap caps
function caps_unset ()
{
  xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
}

