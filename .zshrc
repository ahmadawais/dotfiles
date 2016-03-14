# Path to your oh-my-zsh installation.
export ZSH=/Users/ahmadawais/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zs="source ~/.zshrc"
alias zso="subl ~/.zshrc"
alias stgc="st ~/.gitconfig"


# cd related
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# QUICK FOLDERS
alias html="cd ~ && cd /Users/ahmadawais/html"
alias dot="cd ~ && cd /Users/ahmadawais/dotFiles"
alias gtest="cd ~ && cd /Users/ahmadawais/gtest"
alias dfiles="cd ~ && cd /Users/ahmadawais/dotFiles"
alias wtdev="cd ~ && cd /Users/ahmadawais/html/writablehtml.dev"
alias cfcdev="cd ~ && cd cfc"
alias vrcdev="cd ~ && cd vrcoredev"
alias vrc="cd ~ && cd vrcore"
alias vrwpdev="cd ~ && cd vrwpdev"
alias vrhtmldev="cd ~ && cd /Users/ahmadawais/html/vrhtml.dev"
alias rpdev="cd ~ && cd /Users/ahmadawais/websites/rp.dev/wp-content/plugins/inspiry-real-estate"
alias ntdev="cd ~ && ntdev"
alias web="cd ~ && cd /Users/ahmadawais/websites/"
alias wtwpdev="cd ~ && cd wtwp"
alias ldev="cd ~ && cd localdev"

function gstreak(){
 cd /Users/ahmadawais/websites/git_test_repo/wpdev ;
 python file.py "$*"
}

# Projects I am working on
alias wt="cd /Users/ahmadawais/html/writablehtml.dev"



# Removes dotfile or dotfolder in the pwd e.g. .git
alias deldot="rm -rf .*"
# Removes everything in pwd
alias delpwd="rm -rf "$(pwd -P)"/*"

# trash is better
alias tdot="t .*"
alias tpwd="t "$(pwd -P)"/*"
alias ta="tdot ; tpwd"


# GIT
alias g="git"
alias gi="git init"
alias gco="git checkout"
alias gb="git branches"
alias gbd="git branch -D"
#create new branch and checkout
alias gbn='git checkout -b'

#git merge branch
alias gm="git merge $* && git push"

#git clone realted
alias gcl="git clone"

# show contributors by commits
alias gcontributors="git shortlog -sn"

# git commit count
alias gccount="git rev-list HEAD --count"

#remove local branch
function gbdel {
  git branch -D "$1"
  git push origin :"$1"
}

#get a list of conflicts
alias conflicts='git diff --name-only --diff-filter=U'

function gammend(){
  git rebase -i @~"$*"
}

alias gref="git reflog"
alias greset="git reset $@"
alias ghist="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"

# All remotes
alias grall="git remotes"

# Add Origin
alias grao="git remote add origin"

# Remove remote origin
alias gdelro="git remote remove origin"

# Be careful that this will create an "alternate reality" for people who
# have already fetch/pulled/cloned from the remote repository. But in fact, it's quite simple:
function gdelc() {
  git reset HEAD^ ; # remove commit locally
  git push origin +HEAD # force-push the new HEAD commit
}

#delete remote branch
function gbrdel {
  git push origin :"$1"
}


alias gsclear="git stash clear"
alias gfo="git fetch origin"
alias grh="git reset --hard"
alias gromg="git reset --hard origin/master"
# reset to head and remove all untracked files (including npm installs)
alias gitreseteverything='git clean -d -x -f; git reset --hard'


alias gcdf="git clean -d -f"
alias gbrename="git branch -m"

alias gst="git status"
alias gss="git status -s"
alias gsb="git status -sb"

alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(reset) —— %C(bold blue)%an%C(reset): %C(white)%s%C(reset) %C(dim white)  %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(red)%h%C(reset) —— %C(bold blue)%an%C(reset): %C(white)%s%C(reset) %C(dim white)  %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"

alias gad="git add ."
alias gc="git ci -m"
alias gcmall="git add . && git ci -m"
function gcma() {
    git add . && git ci -m "$*"
}

alias gp="git push"
alias gpf="git push --force"

# delete git and re-inialize git
alias gdelinit="trash .git && git init"

# git add all, git commit with the message and git push
# git commit all push
function gcmap() {
    git add . && git ci -m "$*" && gp
}
function gcap() {
    git add . && git ci -m "$* 💯" && gp # With 100 emoji
}

# git add commit and then fix an issue on github
# usage: gifix 5
# Where 5 is the issue number
function gifix() {
  issue=$* ;
  git add . && git ci -m "ISSUE: Fixes #$(echo -e "$issue")" && gp
}

alias gpsuom="git push --set-upstream origin master"
alias gpsuo="git push --set-upstream origin"
alias gpdt="git push --delete origin"

# Git fethc & Pull
alias gf="git fetch"
alias gpl="git pull"
alias gfp="git fetch && git pull"

# Git Tags
# list all tags
alias gtag="git tag"
alias gtagd="git tag -d $*"
alias gtagdp="git push origin :refs/tags/$*"
function gtagdel(){
  the_tag=$*

  echo "${whitef}———————————————————${reset}"
  echo "${greenb} ${blackf}0. Listing all tags...${reset}"
  git tag

  echo "${whitef}———————————————————${reset}"
  echo "${redb} ${whitef}1. Deleting the tag...${reset}"
  git tag -d $the_tag

  echo "${whitef}———————————————————${reset}"
  echo "${redb} ${whitef}2. Deleting the tag at remote origin...${reset}"
  git push origin :refs/tags/$the_tag

  echo "${whitef}———————————————————${reset}"
  echo "${greenb} ${blackf}3. Listing all tags again...${reset}"
  git tag

  echo "${whitef}———————————————————${reset}"
  echo "${greenb} ${blackf}Completed!...${reset}"



}

# Type `git open` to open the GitHub page or website for a repository.
# npm install -g git-open
alias gio="git open"

# git diff last commit
alias gd1="git diff HEAD^"

# git diff word diffing
alias gdw="git diff --word-diff"

# Check the changes in last Git Pull/Fetch
# Usage: gpfchanges branch_name
alias gfpchanges="git diff --stat $1@{1} $1"

# Fun commit messages
alias yolo="git commit -am '`curl -s http://whatthecommit.com/index.txt`'"
alias yoloo="git commit -am '`curl -s http://whatthecommit.com/index.txt`' && git push origin master --force"

# Open the pwd in the finder
alias o="open ."

# SVN related
# https://wordpress.org/plugins/about/svn/
alias s="svn"
alias sst="svn st"
alias sci="svn ci -m $*"
alias saddall="svn add --force ."


# Add SVN tag
# Usage: stag tags/1.0
alias stag="svn cp trunk"
#  SVN revert deletes added folders which are not commited but only added
alias sr="svn revert $@ --depth infinity"

# SVN revert everything like reset hard
alias sra="svn st  | grep '!' | sed 's/!M      \(.*\)$/"\1"/' | xargs svn revert --depth infinity"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"


# List ALL files (colorized() in long format, show permissions in octal
alias la="ls -l | awk '
{
  k=0;
  for (i=0;i<=8;i++)
    k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));
  if (k)
    printf(\"%0o \",k);
  printf(\" %9s  %3s %2s %5s  %6s  %s %s %s\n\", \$3, \$6, \$7, \$8, \$5, \$9,\$10, \$11);
}'"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Enable aliases to be sudo’ed
# alias sudo='sudo '

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Copy backup
# http://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/
alias copybuildit="rsync -avz --exclude 'node_modules' --exclude 'build' ./* ./build"

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}
# cd Shortcuts
alias des="cd Desktop"

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"
alias et="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"

# yes I occasionally 127.0.0.1 twitter.com ;)
alias hosts='sudo subl /etc/hosts'

alias cask='brew cask' # i <3 u cask
# alias where=which # sometimes i forget
alias brwe=brew  #typos

# brew install speedtest-cli
alias sts='speedtest-cli --share'
alias stss='speedtest-cli --simple --share'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Recursively delete `.DS_Store` files
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killchrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias relaod="reload" #typo addressed
alias reld="reload"


alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'";

alias vup="vagrant up && vagrant provision && vagrant ssh"
alias vp="vagrant provision"
alias vs='sites && vagrant ssh'
alias vag="vagrant"

alias bell='echo "\a"'

alias cdate='date "+%d—%m—%Y"'

#tree structures
alias ll1="tree --dirsfirst -ChFL 1"
alias ll2="tree --dirsfirst -ChFL 2"
alias ll3="tree --dirsfirst -ChFL 3"
alias ll4="tree --dirsfirst -ChFupDaL 1"
alias ll5="tree --dirsfirst -ChFupDaL 2"
alias ll6="tree --dirsfirst -ChFupDaL 3"

#show hidden files and everything
alias lla="ll -a"


alias pc='phpcs --standard="WordPress" $@'
alias pcf='phpcbf --standard="WordPress" $@'
alias pcfall='find . | grep .php | xargs phpcbf --standard="WordPress"'

alias rl="release-it"

alias clive="caffeinate -t $*"
alias nosleep="caffeinate -t 50000"

# NPM Quickes   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Npm
alias n='npm'

#NPM Install.
alias ni="npm install"

# Search Packages
alias n:='npm search'

# Install
alias ni='npm install'
alias nis='sudo npm install'

# Install Globally
alias nig='npm install -g'

# Install Globally and Save
alias nigs="npm install -g $@ --save"

# Install and Save
alias niss="npm install $@ --save"

# npm-check to update npm packages https://www.npmjs.com/package/npm-check
alias ncupg='sudo npm-check -g -u'
alias ncup='sudo npm-check -u'

# Fix Issues --Hard
function nf() {
  rm -rf ./node_modules;
  npm clear cache;
  npm clean cache;
  npm install;
}

# Fix Issues
function nfh() {
  npm clear cache;
  npm clean cache;
}

alias t="trash"

# {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ WP CLI }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

# WP DesktopServer Setup ready
# ---Updates the Core and 2015 theme
# ---Deletes 2013, 2014 and Aksimet
# Usage
#     1. First argument is the url E.g. aa.dev
#     2. Second argument is the Site Title E.g. AA
# Example: wpdsready local.dev Local
function wpdsready() {
  echo "${whitef}———————————————————${reset}"
    echo "${whiteb} ${blackf}WP: Core Installing...${reset}"
    wp core install --url=$1 --title=$2 --admin_user=root --admin_password=root --admin_email=mrahmadawais@gmail.com

    echo "${whiteb} ${blackf}WP: Core Updating...${reset}"
    wp core update ;

    echo "${whiteb} ${blackf}WP: twentyfifteen Update...${reset}"
    wp theme update twentyfifteen;

    echo "${redb} ${blackf}WP: Removing twentythirteen...${reset}"
    wp theme delete twentythirteen ;

    echo "${redb} ${blackf}WP: Removing twentyfourteen...${reset}"
    wp theme delete twentyfourteen ;

    echo "${redb} ${blackf}WP: Removing akismet...${reset}"
    wp plugin delete akismet ;

    echo "${redb} ${blackf}WP: Removing Hello Dolly...${reset}"
    wp plugin delete hello ;

    echo "${redb} ${blackf}WP: Setting permalinks to postname...${reset}"
    wp option update permalink_structure '/%postname%'

    echo "${greenb} ${blackf}WP: DS Setup Ready. DONE!${reset}"
  echo "${whitef}———————————————————${reset}"

}


# Install WPTest.io
function wptest(){
  wp plugin install wordpress-importer --activate
  curl -OL https://raw.githubusercontent.com/manovotny/wptest/master/wptest.xml
  wp import wptest.xml --authors=create
  rm wptest.xml
}




# WP Plugin Install
# Usage: wpp plugin-slug
alias wpp="wp plugin install $* --activate"

# WP Theme Install
# Usage: wpt plugin-slug
alias wpt="wp theme install $* --activate"

# WP Theme Activate
# Usage: wpta plugin-slug
alias wpt="wp theme activate $*"

# WP Plugins Activate all
alias wppaall="wp plugin activate --all"

# Trash all posts in a CPT replace the post-type.
# alias wpdb="wp post delete $(wp post list --post_type='vr_booking' --format=ids)"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd-mm-yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract sublime web-search svn npm bower brew composer wp-cli emoji)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/.wp-cli:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
# setopt RM_STAR_WAIT


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# include z rupa
. ~/z.sh

#
# [functions]{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
#
# colors from tput
# http://stackoverflow.com/a/20983251/950111
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
#
# tput setab [1-7] # Set the background colour using ANSI escape
# tput setaf [1-7] # Set the foreground colour using ANSI escape
# tput sgr0    # Reset text format to the terminal's default
# tput bel     # Play a bell
#
# Usage:
# red=`tput setaf 1`
# green=`tput setaf 2`
# reset=`tput sgr0`
# echo "${red}red text ${green}green text${reset}"

blackb=`tput setab 0` #set background black
blackf=`tput setaf 0` #set foreground black

greenb=`tput setab 2` # set background green
greenf=`tput setab 2` # set background green

blueb=`tput setab 4` # set background blue
bluef=`tput setaf 4` # set foreground blue

redb=`tput setab 1` # set background red
redf=`tput setaf 1` # set foreground red

whiteb=`tput setab 7` # set background white
whitef=`tput setaf 7` # set foreground white

reset=`tput sgr0`     # reset to defaults

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}


# git checkout branch
function gcb() {
  git fetch
    git checkout -b $@ origin/$@
}


# checks if pwd is empty or not
function dirempty() {
  # DIR=pwd
  # look for empty dir
  if [ "$(ls -A $(pwd -P))" ]; then
       echo "$(pwd -P) is NOT Empty"
  else
      echo "$(pwd -P) is Empty"
  fi
  # rest of the logic
}


# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}


# Create a git.io short URL
function gitio() {
  if [ -z "${1}" -o -z "${2}" ]; then
    echo "Usage: \`gitio slug url\`"
    return 1
  fi
  curl -i http://git.io/ -F "url=${2}" -F "code=${1}"
}


# git clone repo . i.e. inside current directory
# usage: gclhere GitRepoURL
# Equal to rm -rf .* && rm -rf "$(pwd -P)"/* && git clone "$*" .
#
# TODO: Caution! This is a dangerous function and needs to be debugged, it deleted
# pwd's parent folders files. So it should not do that, it should delete the pwd and
# recreate it instead.
function gclhere() {

  echo "${whitef}———————————————————${reset}"
  echo "${whiteb} ${blackf}0. Initializing...${reset}"

  #if not empty
  if [ "$(ls -A $(pwd -P))" ]; then

    echo "${redb} ${blackf}1. PWD is not empty, let's delete it...${reset}"

    # PWD variable
    aa_pwd=$PWD
    # go back
    cd ..
    # trash the old PWD where git repo needs to be cloned
    sudo trash $aa_pwd
    # recreate the old PWD and cd in it
    mkdir $aa_pwd && cd $aa_pwd

    echo "${redb} ${blackf}2. PWD deleted and recreated...${reset}"
    echo "${blueb} ${whitef}3. Starting git repo clone...${reset}"

    git clone --recursive "$*" .
    echo "${greenb} ${blackf}4. Git repo cloned. DONE!${reset}"

  # if empty
  else

    echo "${blueb} ${whitef}1. Directory is empty. Cloning the repo...${reset}"

    echo "${blueb} ${whitef}2. Starting git repo clone...${reset}"
    git clone "$*" .
    echo "${greenb} ${blackf}3. Git repo cloned! DONE!${reset}"

  fi

  echo "${whitef}———————————————————${reset}"

}


function emptypwd() {

 echo "${whitef}———————————————————${reset}"
   echo "${whiteb} ${blackf}0. Initializing...${reset}"

   #if not empty
   if [ "$(ls -A $(pwd -P))" ]; then

     echo "${redb} ${blackf}1. PWD is not empty, let's delete it...${reset}"

     # PWD variable
     aa_pwd=$PWD
     # go back
     cd ..
     # trash the old PWD where git repo needs to be cloned
     trash $aa_pwd
     # recreate the old PWD and cd in it
     mkdir $aa_pwd && cd $aa_pwd

     echo "${greenb} ${blackf}2. PWD deleted and recreated!!!${reset}"

   # if empty
   else

     echo "${greenb} ${blackf}1. Directory is already empty!!!${reset}"

   fi

   echo "${whitef}———————————————————${reset}"

}


#
# Git Checkout a Pull Request locally.
#
# Usage: gfpr 8
#
# Where 8 is the number of pull request (can be found right after the PR's title).
#
function gfpr(){
  echo "${whitef}———————————————————${reset}"
    echo "${whiteb} ${blackf}0. Fetching the pull request...${reset}"

    git fetch origin pull/"${1}"/head:pull_"${1}"

    echo "${whiteb} ${blackf}1. PR fetched creating a branch...${reset}"

    git checkout pull_"${1}"

    echo "${whiteb} ${blackf}2. Checking out to a new PR branch...${reset}"

    echo "${greenb} ${blackf}3. PR Branch Created!!!${reset}"
  echo "${whitef}———————————————————${reset}"
}

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    local data=""
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Get gzipped file size
function gz() {
    echo "orig size (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# Change Finder window to show current terminal directory
function finder {
 osascript -e 'set cwd to do shell script "pwd"'\
 -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
 -e 'else' -e "open (POSIX file cwd) as string"\
 -e 'end if' -e 'end tell';\
};

# Find the CNAMEs
alias thecname="dig $* +nostats +nocomments +nocmd"

# how2 StackExchange search
alias how="how2 $*"
alias howwp="how2 -l wordpress $*"
alias howphp="how2 -l php $*"

# Usage: how lang then question
# E.g. howl php create array in OOP
# $1 is agrument 1
# ${@:2} is everything from argument 2 to end
alias howl="how2 -l $1 ${@:2}"

# Copy sublime user folder and delete stuff
function syncsbl(){
  echo "${whitef}———————————————————${reset}"

    echo "${redb} ${whitef}0. Deleting old user folder...${reset}"

    cd SublimeText
    sudo trash User

    echo "${whiteb} ${blackf}1. Copying the `USER` files and folders from Sublime...${reset}"

    cp -rfp /Users/ahmadawais/Library/Application\ Support/Sublime\ Text\ 3/Packages/User /Users/ahmadawais/dotFiles/SublimeText

    echo "${whiteb} ${blackf}2. Deleting useless stuff...${reset}"

    cd user
    # rm -rf Package\ Control.cache
    sudo trash Package\ Control.cache
    sudo trash bh_unicode_properties.cache

    # removes the token
    change_line 'remove before GitHub' '' Gist.sublime-settings

    cd Color\ Highlighter
    sudo trash ColorPicker_osx_x64

    ...

    echo "${greenb} ${blackf}3. Sync Done!!!${reset}"
  echo "${whitef}———————————————————${reset}"
}


# Copy .zshrc to dotfiles
function synczsh(){
  echo "${whitef}———————————————————${reset}"

    echo "${redb} ${whitef}0. Deleting old .zshrc...${reset}"

    dfiles
    sudo trash .zshrc

    echo "${whiteb} ${blackf}1. Copying new `.zshrc` file...${reset}"

    cp ~/.zshrc /Users/ahmadawais/dotFiles/

    echo "${greenb} ${blackf}3. Sync zshrc Done!!!${reset}"
  echo "${whitef}———————————————————${reset}"
}


# Major Sync dotfiles function
function syncdfiles(){
  echo "${whitef}———————————————————${reset}"

    dfiles

    echo "${whiteb} ${blackf}1. Syncing Sublime...${reset}"

    syncsbl

    echo "${whiteb} ${blackf}2. Syncing .zshrc...${reset}"

    synczsh

    gcap DotFiles Synced

    echo "${greenb} ${blackf}3. Sync dotFiles Done!!!${reset}"
  echo "${whitef}———————————————————${reset}"
}

#
# Change Line text in a file
#
# via http://stackoverflow.com/a/28262057/950111
#
# Usage: `change_line "TEXT_TO_BE_REPLACED" "This line is removed by the admin." yourFile`
function escape_slashes {
    sed 's/\//\\\//g'
}
function change_line {
    local OLD_LINE_PATTERN=$1; shift
    local NEW_LINE=$1; shift
    local FILE=$1

    local NEW=$(echo "${NEW_LINE}" | escape_slashes)
    sed -i .bak '/'"${OLD_LINE_PATTERN}"'/s/.*/'"${NEW}"'/' "${FILE}"
    mv "${FILE}.bak" /tmp/
}
