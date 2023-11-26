# Profiling ZSH performance.
# zmodload zsh/zprof
# Dummy testing.
# alias gpmt="rmnm && rmv package.json rmv package-lock.json && npm init -y && rmv yarn.lock && rmv yarn-error.log && /Users/ahmadawais/.aCHANGEsdf/installs/nodejs/12.13.0/.npm/bin/gpm"

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="shades-of-purple"

#.# zsh-syntax-highlighting
# @link: http://github.com/zsh-users/zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# plugins=(git git-extras extract npm bower brew composer wp-cli emoji z zsh-autosuggestions)
plugins=(git git-extras npm zsh-autosuggestions)

# PATH
export PATH="/usr/local/sbin:$PATH"

export VISUAL="code-insiders -w"
export EDITOR="code-insiders -w"

# Python from brew
# https://stackoverflow.com/a/51912712/950111
# export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

## OLD
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/git:/usr/local/git/bin:$HOME/.wp-cli:~/bin:~/.composer/vendor/bin:/Users/$USER/Library/Python/2.7/bin"
## To use PHP7.1 on CLI, add this to .bash_profile
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
# export PATH="/usr/local/opt/php@7.1/bin:$PATH"
# export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew completions.
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

# Oh My Zsh.
# Should inlcude after themes and plugins are set.
source $ZSH/oh-my-zsh.sh

# Aliases
alias zs="source ~/.zshrc"
alias zso="subl ~/.zshrc"
alias zco="code ~/.zshrc"
alias zci="code-insiders ~/.zshrc"
alias mco="code ~/.mackup.cfg"
# alias bco="code `bat --config-file`"
alias stgc="st ~/.gitconfig"

# Private exports are shy, they stay in Dropbox.
if [ -f ~/Dropbox/bin/.exports ]; then
	source ~/Dropbox/bin/.exports
else
	print "Hey ~/Dropbox/bin/.exports not found."
fi

alias rldexpo="source ~/Dropbox/bin/.exports"

# PrivateRC is shy, they stay in Dropbox.
if [ -f ~/Dropbox/bin/.privaterc ]; then
	source ~/Dropbox/bin/.privaterc
else
	print "Hey ~/Dropbox/bin/.privaterc not found."
fi

# Project paths.
if [ -f ~/Dropbox/bin/.paths ]; then
	source ~/Dropbox/bin/.paths
else
	print "Hey ~/Dropbox/bin/.paths not found."
fi

# Open Exports in VSCode.
alias expo="code-insiders --folder-uri $HOME/Dropbox/bin"
alias expi="code-insiders --folder-uri $HOME/Dropbox/bin"

# VSCode open folder
alias co="code ."

# VSCodeInsider open folder
alias ci="code-insiders ."
alias coi="code-insiders ."
alias cio="code-insiders ."

# Easier directory navigation.
alias ~="cd ~"
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias cd..="cd .." # Typo addressed.

# Type `-` only to go back to prev directory.
alias -- -="cd -"

# Projects.
# alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias sbx="cd ~/sbx"

# Git Blame Someone else (used for when my wife uses my laptop to code and forgets to switch profiles).
gbse() {
	git blame-someone-else "$@"
}
# Same as above
gmb() {
	git blame-someone-else "Maedah Batool <root@gmail.com>" "$@"
}

# gbsb() {
# 	git branch --set-upstream-to=origin/"$@" "$@"
# }

gbsu() {
	if [[ -z "$@" ]]; then
		# git branch --set-upstream-to=origin/main main
		git branch --set-upstream-to=upstream/main main
	else
		# git branch --set-upstream-to=origin/"$@" "$@"
		git branch --set-upstream-to=upstream/"$@" "$@"
	fi
}

gstrk() {
	cd /Users/$USER/Documents/web/Git/WPDev
	python file.py "$*"
}

# Removes dotfile or dotfolder in the pwd e.g. .git
alias deldot="rm -rf .*"
# Removes everything in pwd
alias delpwd="rm -rf "$(pwd -P)"/*"

# trash is better
# alias t="sudo trash"
alias tpwd="t "$(pwd -P)"/*"
alias tdot="t .*"
alias ta="tdot ; tpwd"

# GIT
alias g="git"
alias gi="git init"
alias gco="git checkout"
alias gb="git branches"
alias gbd="git branch -D"

# Create new branch and checkout.
alias gbn='git checkout -b'
alias gfu='git fetch upstream && git pull upstream master'
alias gpu='git pull upstream master'

# Create a new branch on top of (by fetching) the latest origin/main branch.
gbno() {
	git fetch origin
	git checkout -b $@ origin/main
}

gbnu() {
	git fetch --all
	git checkout -b $@ upstream/main
}

# git merge branch
alias gm="git merge $* && git push"

# git clone realted
function gcl {
	git clone "$1" && cd "$(basename "$1" .git)"
}

# show contributors by commits
alias gcontributors="git shortlog -sn"

# git commit count
alias gccount="git rev-list HEAD --count"

# Checkout to master
alias gcm="git checkout main"

# Create new branch and checkout.
alias gbn='git checkout -b'

# Remove local branch
gbdel() {
	# Branch name present?
	if [[ -z "$1" ]]; then
		echo "\n🤔 Oops… you forgot to provide the branch name"
		echo "👉 E.g. gbdel branch_name\n"
	else
		# Start deleteing.
		echo "\n⏳ Deleting…\n"
		git branch -D "$1"            # Local delete.
		git push origin --delete "$1" # Remote delete.
		echo "\n✅ Git branch $1 was deleted from local and remote.\n"
	fi
}

# Get a list of conflicts
alias conflicts='git diff --name-only --diff-filter=U'

grebase() {
	git rebase -i @~"$*"
}

alias gref="git reflog"
alias gr="git r $@"
alias ghist="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"

# All remotes
alias gremotes="git remotes"

# Add Origin
alias grao="git remote add origin"

# Remove remote origin
alias gdelro="git remote remove origin"

# Be careful that this will create an "alternate reality" for people who
# have already fetch/pulled/cloned from the remote repository. But in fact, it's quite simple:
gdelc() {
	git r HEAD^           # remove commit locally
	git push origin +HEAD # force-push the new HEAD commit
}

#delete remote branch
gbrdel() {
	git push origin :"$1"
}

alias gsclear="git stash clear"
# alias gsc="git stash clear"
alias gsa="git stash apply"
alias gfo="git fetch origin"
alias grh="git reset --hard"
alias grhom="git reset --hard origin/master"
# r to head and remove all untracked files (including npm installs)
alias gitreverything='git clean -d -x -f; git reset --hard'
alias grhc='git clean -d -x -f; git reset --hard'

alias gcdf="git clean -d -f"
alias gbrename="git branch -m"

alias gst="git status"
alias gss="git status -s"
alias gsb="git status -sb"

alias gad="git add ."
alias gc="git ci -m"
alias gcmall="git add . && git ci -m"
gcma() {
	git add . && git ci -m "$*"
}

alias gp="git push"
alias gpp="git push -u"
alias gpf="git push --force"
alias gpt="git push --tags"

# delete git and re-inialize git
alias gdelinit="trash .git && git init"

# git add commit and then fix an issue on github
# usage: gifix 5
# Where 5 is the issue number
gifix() {
	issue=$*
	git add . && git ci -m "ISSUE: Fixes #$(echo -e "$issue")" && gp
}

alias gdel="rm -rf .git"

alias gpsuom="git push --set-upstream origin master"
alias gpsuo="git push --set-upstream origin"
alias gpdt="git push --delete origin"

# Amend the last commit message.
# Push the changes to remote by force.
# USAGE: gamend "Your New Commit Msg"
gamend() {
	git commit --amend -m "$@"
	git push --force-with-lease
}

# Git fethc & Pull
alias gf="git fetch"
alias gpl="git pull"
alias gfp="git fetch && git pull && git submodule update"

# Open git config file
alias gconfig="git config --global --edit"

# Git Tags
# list all tags
alias gtag="git tag"
alias gtagd="git tag -d $*"
alias gtagdp="git push origin :refs/tags/$*"

gtagit() {
	git tag $@
	git push origin --tags
}

wprlz() {
	grlz $@
	gtagit $@
}

gtagdel() {
	the_tag=$*

	echo "${rb}${wf}1. Deleting the tag...${r}"
	git tag -d $the_tag

	echo "${rb}${wf}2. Deleting the tag at remote origin...${r}"
	git push origin :refs/tags/$the_tag

	echo "${gb}${bf}Completed!...${r}"
}

# Type `git open` to open the GitHub page or website for a repository.
# npm install -g git-open
alias gio="git open"

# git diff last commit
alias gd1="git diff HEAD^"

# git diff word diffing
alias gdw="git diff --word-diff"

# Git Diff so fancy
alias gdsf="git diff --color | diff-so-fancy"

# Check the changes in last Git Pull/Fetch
# Usage: gpfchanges branch_name
alias gfpchanges="git diff --stat $1@{1}$1"

# Git archive the current directory and ignore everything in .gitignore file.
# Usage: garc zipname
alias garc="git archive -o $1.zip HEAD"

# Fun commit messages
alias yolo="git commit -am '$(curl -s http://whatthecommit.com/index.txt)'"
alias yoloo="git commit -am '$(curl -s http://whatthecommit.com/index.txt)' && git push origin master --force"

# Open the pwd in the finder
alias o="open ."

# SVN related
# https://wordpress.org/plugins/about/svn/
alias s="svn"
alias sst="svn st"
alias sci="svn ci -m $*"
alias saddall="svn add --force ."

# SVN Add the assets.
alias sassets="saddall && svn ci -m 'Adding the assets...'"

# Add SVN tag
# Usage: stag tags/1.0
alias stag="svn cp trunk"
#  SVN revert deletes added folders which are not commited but only added
alias sr="svn revert $@ --depth infinity"

# SVN revert everything like r hard
alias sra="svn st  | grep '!' | sed 's/!M      \(.*\)$/"\1"/' | xargs svn revert --depth infinity"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="curl ipecho.net/plain ; echo"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"

alias l="exa --long --all --header --git-ignore --group-directories-first --git --ignore-glob=\".git|node_modules\" --sort=\"ext\""

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

# List only dot files
alias lsdot="ls -ld .??*"

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
tre() {
	tree -a --ignore '.git|node_modules|bower_components|.DS_Store' "$@"
}

alias t="tree -a --ignore '.git|node_modules|bower_components|.DS_Store' -l 3"
# cd Shortcuts
alias des="cd Desktop"

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"
alias et="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"

# yes I occasionally 127.0.0.1 twitter.com ;)
alias hosts='sudo code /etc/hosts'

alias cask='brew cask' # i <3 u cask
# alias where=which # sometimes i forget
alias brwe=brew #typos

# brew install speedtest-cli
alias sts='speedtest-cli --share'
alias stss='speedtest-cli --simple --share'

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'

# Sublime's subl.
# Install subl as st by running the following
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/st
# Relaod the terminal.
# Now Open a file with → st filename.ext
# Open a folder in Sublime.
alias stt="st ."

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Recursively delete all `.DS_Store` files in the pwd.
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

alias rmlockfiles="find . -type f -name 'package-lock.json' -ls -delete"

# Recursively delete all `.nfo` files in the pwd.
alias rmnfo="find . -type f -name '*.nfo' -ls -delete"

# Del all node modules from current dir and inside there in more dirs recursively.
alias delnm="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"
alias nmrmv="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"
alias rmnm="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"

# Show/Hide hidden files/directories in macOS Finder.
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/Hide all desktop icons (useful when presenting or recording).
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide a directory or file.
# @usage: hidden fileOrDirName
hidden() {
	chflags hidden "$@"
}

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Decrypt a password-protected PDF
# Needs brew install qpdf
# https://superuser.com/a/1735907
decryptpdf() {
	echo "Enter password followed by <enter> followed by <ctrl-D>"
	qpdf --decrypt --password-file=- --replace-input "${1}"
}

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killchrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell).
alias reload="exec $SHELL -l"
alias rf="source ~/.zshrc"

# Typos addressed.
alias relaod="reload"
alias reld="reload"
alias rld="reload"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to clipboard.\n'"

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
# Another useful flag we can use with ls is -S, which will sort the results of ls by file size, instead of the default sorting by name.
alias lls="ls -lhS"

alias pc='phpcs --standard="WordPress" $@'
alias pcf='phpcbf --standard="WordPress" $@'
alias pcfall='find . | grep .php | xargs phpcbf --standard="WordPress"'

alias clive="caffeinate -t $*"
alias nosleep="caffeinate -t 50000"
alias nsl="caffeinate -t 50000"

# NPM Quickes   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# npm
# alias n='npm'
# alias nx='/usr/local/bin/n'
# alias n='/usr/local/bin/n'

# npm aliases
alias ni="npm install"
alias nrm="npm rm"
alias nd="npm run dev"
alias nl="npm link"
alias nu="npm unlink"
alias s="npm start"
alias b="npm run build"
alias d="npm run dev"
alias ni='npm install'
alias nig='npm install -g'
alias nrmg='npm uninstall -g'
# npm-check to update npm packages https://www.npmjs.com/package/npm-check
alias ncupg='npm-check -g -u'
alias ncup='npm-check -u'

# pnpm aliases
alias p="pnpm"
alias pi="pnpm install"
alias pr="pnpm"
alias prm="pnpm rm"
alias pd="pnpm dev"
alias pl="pnpm link"
alias pu="pnpm unlink"
alias pb="pnpm run build"
alias pd="pnpm run dev"
# alias ps="pnpm start" # Conflict with ps.

# Fix Issues --Hard
nf() {
	rm -rf ./node_modules
	npm install
}

# Fix Issues
ncc() {
	npm clear cache
	npm clean cache
}

# {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ WP CLI }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

# WP DesktopServer Setup ready
# ---Updates the Core and 2015 theme
# ---Deletes 2013, 2014 and Aksimet
# Usage
#     1. First argument is the url E.g. aa.dev
#     2. Second argument is the Site Title E.g. AA
# Example: wpdsready local.dev Local
wpdsready() {
	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}WP: Core Installing...${r}"
	wp core install --url=$1 --title=$2 --admin_user=root --admin_password=root --admin_email=root@root.com

	echo "${wb}${bf}WP: twentyfifteen Update...${r}"
	wp theme update twentyfifteen
	wp theme activate twentyfifteen

	echo "${rb}${bf}WP: Removing twentythirteen...${r}"
	wp theme delete twentythirteen

	echo "${rb}${bf}WP: Removing twentyfourteen...${r}"
	wp theme delete twentyfourteen

	echo "${rb}${bf}WP: Removing twentysixteen...${r}"
	wp theme delete twentysixteen

	echo "${rb}${bf}WP: Removing twentyseventeen...${r}"
	wp theme delete twentyseventeen

	echo "${rb}${bf}WP: Removing akismet...${r}"
	wp plugin delete akismet

	echo "${rb}${bf}WP: Removing Hello Dolly...${r}"
	wp plugin delete hello

	echo "${rb}${bf}WP: Setting permalinks to postname...${r}"
	wp option update permalink_structure '/%postname%'

	echo "${wb}${bf}WP: Core Updating...${r}"
	wp core update

	echo "${gb}${bf}WP: DS Setup Ready. DONE!${r}"
	echo "${wf}———————————————————${r}"

}

alias wpppn="wp option update permalink_structure '/%postname%'"

# Install WPTest.io
wptest() {
	wp plugin install wordpress-importer --activate
	curl -OL https://raw.githubusercontent.com/manovotny/wptest/master/wptest.xml
	wp import wptest.xml --authors=create
	rm wptest.xml
}

# WP Plugin: Install & Acticate
# Usage: wpp plugin-slug
alias wpp="wp plugin install $* --activate"

# WP Theme: Install
# Usage: wpt plugin-slug
alias wpt="wp theme install $* --activate"

# WP Theme: Activate
# Usage: wpta plugin-slug
alias wpt="wp theme activate $*"

# Activate all WP Plugins
alias wppaall="wp plugin activate --all"

# Launch WP with logged in as root admin
# @link https://aaemnnost.tv/2016/08/26/going-plaidinum/
#
# Install dependencies:
# 	wp package install aaemnnosttv/wp-cli-login-command
# 	On a WP install run wpli.
#
alias wplr="wp login create root --launch"
alias wpli="wp login install --activate --yes"

# Install WP Log Viewer.
alias wplv="wpp wp-log-viewer"

# Trash all posts in a cpT replace the post-type.
# alias wpdb="wp post delete $(wp post list --post_type='vr_booking' --format=ids)"
# alias wpdtall="wp post delete $(wp post list --post_status=trash --format=ids)"

# One Click Demo Import and friends.
alias ocdis="wpp one-click-demo-import && wpp widget-importer-exporter && wpp customizer-export-import"

# Dev Setup.
alias wpds="wpp query-monitor && wpp debug-bar && wpp debug-meta-data && wpp wp-log-viewer && wpp wp-reset"

# {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ WP CLI END }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

# NVM install
# export NVM_DIR="$HOME/.nvm"
#   . "/usr/local/opt/nvm/nvm.sh"
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
# alias load_nvm=". /usr/local/opt/nvm/nvm.sh"

# nvm now.
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm.

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# asdf
# source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load_nvm() {
# 	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm.
# 	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }
# alias node='unalias node ; unalias npm ; load_nvm ; nvm use default ; node $@'
# alias npm='unalias node ; unalias npm ; load_nvm ; nvm use default ; npm $@'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
# setopt RM_STAR_WAIT

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# I don't use z.
# include z rupa
# . ~/z.sh

####.#### ———————————————————————————————————————————— COLORS ———————————————————————————————————————————— ####.####
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
# r=`tput sgr0`
# echo "${rb}red text ${green}green text${r}"

bb=$(tput setab 0) #set background black
bf=$(tput setaf 0) #set foreground black

gb=$(tput setab 2) # set background green
gf=$(tput setaf 2) # set foreground green

yb=$(tput setab 3) # set background yellow
yf=$(tput setaf 3) # set foreground yellow

blb=$(tput setab 4) # set background blue
blf=$(tput setaf 4) # set foreground blue

mb=$(tput setab 5) # set background magenta
mf=$(tput setaf 5) # set foreground magenta

rb=$(tput setab 1) # set background red
rf=$(tput setaf 1) # set foreground red

wb=$(tput setab 7) # set background white
wf=$(tput setaf 7) # set foreground white

r=$(tput sgr0) # r to defaults

# Create a new directory and cd into it.
# USAGE: mkd new-dir
mkd() {
	mkdir -p "$@" && cd "$@"
}

# git checkout branch
function gcb {
	git fetch
	git checkout -b $@ origin/$@
}

# Remove .DS_Store files from a Git repository?
alias grmds="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch && addgitignore"

# checks if pwd is empty or not
dirempty() {
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
dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Create a git.io short URL
gitio() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`gitio slug url\`"
		return 1
	fi
	curl -i https://git.io/ -F "url=${2}" -F "code=${1}"
}

#
# Git Clone repo inside current director even if it is not empty.
#
# git clone repo . i.e. inside current directory
# usage: gclhere Repo URL
# usage: gclhere https://github.com/user/repo
# Equal to rm -rf .* && rm -rf "$(pwd -P)"/* && git clone "$*" .
#
gclhere() {

	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Initializing...${r}"

	#if not empty
	if [ "$(ls -A $(pwd -P))" ]; then

		echo "${rb}${bf}1. PWD is not empty, let's delete it...${r}"

		# PWD variable
		aa_pwd=$PWD
		# go back
		cd ..
		# trash the old PWD where git repo needs to be cloned
		sudo trash $aa_pwd
		# recreate the old PWD and cd in it
		mkdir $aa_pwd && cd $aa_pwd

		echo "${rb}${bf}2. PWD deleted and recreated...${r}"
		echo "${blb}${wf}3. Starting git repo clone...${r}"

		git clone --recursive "$*" .
		echo "${gb}${bf}4. Git repo cloned. DONE!${r}"

	# if empty
	else

		echo "${blb}${wf}1. Directory is empty. Cloning the repo...${r}"

		echo "${blb}${wf}2. Starting git repo clone...${r}"
		git clone --recursive "$*" .
		echo "${gb}${bf}3. Git repo cloned! DONE!${r}"

	fi

	echo "${wf}———————————————————${r}"

}
alias gclh="gclhere"

emptypwd() {

	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Initializing...${r}"

	#if not empty
	if [ "$(ls -A $(pwd -P))" ]; then

		echo "${rb}${bf}1. PWD is not empty, let's delete it...${r}"

		# PWD variable
		aa_pwd=$PWD
		# go back
		cd ..
		# trash the old PWD where git repo needs to be cloned
		trash $aa_pwd
		# recreate the old PWD and cd in it
		mkdir $aa_pwd && cd $aa_pwd

		echo "${gb}${bf}2. PWD deleted and recreated!!!${r}"

	# if empty
	else

		echo "${gb}${bf}1. Directory is already empty!!!${r}"

	fi

	echo "${wf}———————————————————${r}"

}

#
# Git Checkout a Pull Request locally.
#
# Usage: gfpr 8
#
# Where 8 is the number of pull request (can be found right after the PR's title).
#
gfpr() {
	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Fetching the pull request...${r}"

	git fetch origin pull/"${1}"/head:PR#"${1}"

	echo "${wb}${bf}1. PR fetched creating a branch...${r}"

	git checkout PR#"${1}"

	echo "${wb}${bf}2. Checking out to a new PR branch...${r}"

	echo "✅ — ${gb}${bf}3. PR Branch Created!${r}"
	echo "${wf}———————————————————${r}"
}

function gpr {
	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Fetching the pull request...${r}"

	git fetch origin pull/"${1}"/head:PR#"${1}"

	echo "${wb}${bf}1. PR fetched creating a branch...${r}"

	git checkout PR#"${1}"

	echo "${wb}${bf}2. Checking out to a new PR branch...${r}"

	echo "✅ — ${gb}${bf}3. PR Branch Created!${r}"
	echo "${wf}———————————————————${r}"
}

gfupr() {
	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Fetching the pull request...${r}"

	git fetch upstream pull/"${1}"/head:PR#"${1}"

	echo "${wb}${bf}1. PR fetched creating a branch...${r}"

	git checkout PR#"${1}"

	echo "${wb}${bf}2. Checking out to a new PR branch...${r}"

	echo "✅ — ${gb}${bf}3. PR Branch Created!${r}"
	echo "${wf}———————————————————${r}"
}

#
# Git Fetch a Pull Request locally to current branch.
#
# Usage: gfpr 8
#
# Where 8 is the number of pull request (can be found right after the PR's title).
#
gfpronly() {
	echo "${wf}———————————————————${r}"
	echo "${wb}${bf}0. Fetching the pull request...${r}"

	git fetch origin pull/"${1}"/head:pull_"${1}"

	echo "${gb}${bf}1. PR Fetched Created!${r}"
	echo "${wf}———————————————————${r}"
}

# Create a data URL from a file
dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	local data=""
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Compare original and gzipped file size
gz() {
	local origsize=$(wc -c <"$1")
	local gzipsize=$(gzip -c "$1" | wc -c)
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)
	printf "orig: %d bytes\n" "$origsize"
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Change Finder window to show current terminal directory
finder() {
	osascript -e 'set cwd to do shell script "pwd"' \
		-e 'tell application "Finder"' \
		-e "if (${1-1} <= (count Finder windows)) then" \
		-e "set the target of window ${1-1} to (POSIX file cwd) as string" \
		-e 'else' -e "open (POSIX file cwd) as string" \
		-e 'end if' -e 'end tell'
}

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
syncsbl() {
	echo "${wf}———————————————————${r}"

	echo "${rb}${wf}0. Deleting old user folder...${r}"

	cd SublimeText
	rm -rf User

	echo "${wb}${bf}1. Copying the USER files and folders from Sublime...${r}"

	cp -rfp /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User /Users/$USER/web/dotFiles//SublimeText

	echo "${wb}${bf}2. Deleting useless stuff...${r}"

	cd user
	# rm -rf Package\ Control.cache
	sudo trash Package\ Control.cache
	sudo trash bh_unicode_properties.cache

	# removes the token
	change_line 'remove before GitHub' '' Gist.sublime-settings

	cd Color\ Highlighter
	sudo trash ColorPicker_osx_x64

	...

	echo "${gb}${bf}3. Sync Done!!!${r}"
	echo "${wf}———————————————————${r}"
}

# Copy .zshrc to dotfiles
synczsh() {
	echo "${wf}———————————————————${r}"

	echo "${rb}${wf}0. Deleting old .zshrc and .bash files...${r}"

	dfiles
	rm .zshrc
	rm .bash_history
	rm .bash_profile
	rm .bashrc

	echo "${wb}${bf}1. Copying new $(.zshrc) and .bash files ...${r}"

	cp ~/.zshrc /Users/$USER/web/dotFiles/

	# TODO: Should we do that?
	# cp ~/.bash_history /Users/$USER/web/dotFiles/
	cp ~/.bash_profile /Users/$USER/web/dotFiles/
	cp ~/.bashrc /Users/$USER/web/dotFiles/
	cp ~/.gitconfig /Users/$USER/web/dotFiles/

	echo "${gb}${bf}3. Sync of ZSH and BASH Done!!!${r}"
	echo "${wf}———————————————————${r}"
}

# Sync dotfiles.
alias syncd="syncdfiles"
syncdfiles() {
	clear
	echo "\n${yf}❯ BACKING UP DOTFILES! ${r}"
	REMEMBERERD_DIR="$(cd "$(dirname "$0")" && pwd)"

	echo "${yf}❯ Copying files${r}"
	# dfiles
	mkdir -p ~/dotfiles && cd ~/dotfiles
	git clone https://github.com/ahmadawais/dotfiles . >/dev/null 2>&1
	git pull >/dev/null 2>&1
	rmds >/dev/null 2>&1
	rsync -aL ~/.zshrc ~/.bashrc ~/.bash_profile ~/.gitconfig . >/dev/null 2>&1
	rsync -aL "/Users/ahmadawais/Library/Application Support/Code/User/spellright.dict" ./VSCode/ >/dev/null 2>&1

	# Not needed anymore.
	# echo "${yf}❯ Listing brew files${r}"
	# mkdir -p ./brew/
	# brew list > ./brew/brew-list.txt
	# brew list --cask > ./brew/cask-list.txt

	# echo "${yf}❯ Listing npm files${r}"
	# npm list -g --depth 0 > ./npm/global-packages-list.txt

	echo "${yf}❯ Git commit/push in progress…${r}"
	gimp 'Sync dotfiles' >/dev/null 2>&1
	echo "${gf}❯ https://github.com/ahmadawais/dotfiles.git${r}"
	cd $REMEMBERERD_DIR

	echo "\n${gf}✅ DONE!${r}\n"
}

# Pull Dotfiles
pulldfiles() {
	# Access dotfiles.
	dfiles

	# Trash it.
	#if not empty
	if [ "$(ls -A $(pwd -P))" ]; then

		echo "${rb}${bf}PWD is not empty, let's delete it...${r}"

		# PWD variable
		DFILES_DIR=$PWD
		# go back
		cd ..
		# trash the old PWD where git repo needs to be cloned
		rm -rf $DFILES_DIR
		# recreate the old PWD and cd in it
		mkdir $DFILES_DIR && cd $DFILES_DIR

		echo "${rb}${bf}PWD deleted and recreated...${r}"
	fi

	# Clone the repo.
	git clone https://github.com/ahmadawais/dotfiles/ .
	echo "${gb}${bf}Git repo cloned for dotfiles cloned. DONE!${r}"
}

# Pull Sublime settings.
pullsubl() {
	echo "${wf}———————————————————${r}"
	echo "${rb}${wf}Pulling dotfiles...${r}"
	pulldfiles
	echo "${wb}${bf}Copying the USER files and folders to Sublime...${r}"
	cp -rfp /Users/$USER/web/dotFiles/SublimeText/User/* /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
	echo "${gb}${bf}Sync Done!!!${r}"
	echo "${wf}———————————————————${r}"
}

#
# Change Line text in a file
#
# via http://stackoverflow.com/a/28262057/950111
#
# Usage: `change_line "TEXT_TO_BE_REPLACED" "This line is removed by the admin." yourFile`
escape_slashes() {
	sed 's/\//\\\//g'
}
change_line() {
	local OLD_LINE_PATTERN=$1
	shift
	local NEW_LINE=$1
	shift
	local FILE=$1

	local NEW=$(echo "${NEW_LINE}" | escape_slashes)
	sed -i .bak '/'"${OLD_LINE_PATTERN}"'/s/.*/'"${NEW}"'/' "${FILE}"
	mv "${FILE}.bak" /tmp/
}

#
# Zip the current folder and exclude
# folders and files that are not needed
# as per Theme Check.
#
# Usage: wpzip zipname
# Link: http://askubuntu.com/a/28482/521222
# Note: It will not include any .zip files
# in the theme so if you bundle plugins with
# TGMPA then beware.
#
wpzip() {
	echo "${wf}———————————————————${r}"

	zip_name=$1 # $1 is agrument 1

	# exclude more files (does not work for folders)
	more_exclude_file=${@:2} # ${@:2} is everything from argument 2 to end

	echo "${wb}${bf}0. Deleting the old "$zip_name".zip file if present...${r}"
	rm $zip_name".zip"

	echo "${wb}${bf}1. Zipping the current folder as "$zip_name".zip...${r}"

	# Using noglob to avoid ZSH to trip over *, can also use back slash \
	noglob zip -r $zip_name.zip . -x *.git* *node_modules* *.zip *.DS_Store $more_exclude_file

	echo "${gb}${bf}3. "$zip_name".zip is ready! 💯  ${r}"
	echo "${wf}———————————————————${r}"
}

# Bulk Resize Images in Terminal
#
# Usage: rimg extension size
# Example: rimg jpg 640
rimg() {
	sips -Z "$2" *."$1"
}

# Rename Bullk files.
# Renames all the files in PWD with the given extension.
#
# @param extension | jpg
# @param new_name | name
# Usage: rname jpg new_name
rname() {
	echo "${wb}${bf}———————————————— STARTED ————————————————${r}"

	# Counter.
	COUNTER=1

	# For do loop.
	for file in *."$1"; do
		mv "$file" "$2-$COUNTER.$1"
		COUNTER=$(($COUNTER + 1))
	done
	echo "${gb}${bf}———————————————— ✔✔✔ RENAMED Every $1 file in the PWD! ✔✔✔︎ ————————————————${r}"
}

pngtojpg() {
	for i in *.png; do convert "$i" "${i%.*}.jpg"; done
}

# JPEG Optimization.
# Usage: jpegoptim 90 | where 90 is the quality.
jpgoptim() {
	if [[ "-h" == "$1" ]]; then
		clear
		echo "${wb}${bf}———————————————— Help! ————————————————${r}"
		echo "${wb}${bf}——— Usage: jpegoptim 90 | where 90 is the quality. ———${r}"
		return 1
	else
		echo "${wb}${bf}———————————————— STARTED ————————————————${r}"
		find . -iname "*.jpg" -exec jpegoptim -m"$1" -o -p --strip-all {} \;
		find . -iname "*.JPG" -exec jpegoptim -m"$1" -o -p --strip-all {} \;

		echo "${gb}${bf}———————————————— ✔✔✔ OPTIMZED Every JPG file in the PWD! ✔✔✔︎ ————————————————${r}"
	fi
}

# Handle Stock images optimization.
#
# @param $1 rname | new_name.
# @param $2 resize | 1920 (only width).
# @param $3 optimize | 85 (quality).
#
# Usage: soptim new_name 1920 85
soptim() {
	if [[ "-h" == "$1" ]]; then
		clear
		echo "${wb}${bf}———————————————— Help! ————————————————${r}"
		echo "${wb}${bf}——— Usage: soptim new_name width jpq_quality ———${r}"
		echo "${wb}${bf}——— Usage: soptim new_name 1920 85 ———${r}"
		return 1
	else
		clear
		echo "—"
		echo "${wb}${bf}———————————————— STARTED ————————————————${r}"
		echo "—"

		echo "—"
		echo "${blb}${bf}———————————————— STEP #1. RENAMING to $1-#.jpg ————————————————${r}"
		echo "—"
		rname JPG $1
		rname jpg $1

		echo "—"
		echo "${blb}${bf}———————————————— STEP #2. RESIZING to $2 width ————————————————${r}"
		echo "—"
		rimg JPG $2
		rimg jpg $2

		echo "—"
		echo "${blb}${bf}———————————————— STEP #3. OPTIMZING to $3 JPG qulity ————————————————${r}"
		echo "—"
		jpgoptim $3

		echo "—"
		echo "${gb}${bf}———————————————— ✔✔✔ RENAMED, RESIZED, & OPTIMZED Every Stock JPG file in the PWD! ✔✔✔︎ ————————————————${r}"
		echo "—"
	fi
}

# Update composer global
alias cupdate="/usr/local/bin/composer self-update"

#
# Git Reflow Aliases.
#
# @link https://github.com/reenhanced/gitreflow
#

# Usage: grf start aa-feature
alias grf="git reflow $@"

# 1. Start.
# Usage: grfs aa-feature
alias grfs="git reflow start $@"

# 2. Review.
# Usage: grfr
alias grfr="git reflow review"

# 3. Deliver.
# Usage: grfd
alias grfd="git reflow deliver"

# Usage: grfrefresh
alias grfrefresh="git reflow refresh"

# Usage: grfst
alias grfst="git reflow status"

#
# Download and install WPGulp
#
# Usage: addwpgulp
addwpgulp() {
	echo "${wf}———————————————————${r}"

	echo "${wb}${bf}0. Downloading gulpfile.js and pacakge.json in the current folder...${r}"

	curl -O https://raw.githubusercontent.com/$USER/WPGulp/master/package.json
	curl -O https://raw.githubusercontent.com/$USER/WPGulp/master/gulpfile.js
	curl -O https://raw.githubusercontent.com/$USER/WPGulp/master/.gitignore

	echo "${wb}${bf}1. Installing NPM dependencies (will take upto 5 minutes)...${r}"

	sudo npm install

	echo "${gb}${bf}2. WPGulp is ready! Run the command $(gulp)  ${r}"
	echo "${wf}———————————————————${r}"
}

# DNS cache Flush
alias dnscacheflush="sudo killall -HUP mDNSResponder"
alias dnscf="sudo killall -HUP mDNSResponder"
alias dcf="sudo killall -HUP mDNSResponder"

# Creates README.md, LICENSE.md and CHANGELOG.md files in the current folder.
alias clr='touch README.md && touch LICENSE.md && touch CHANGELOG.md  && echo "${gb}${bf} Created README.md, LICENSE.md and CHANGELOG.md files. 💯 ${r}" && ll'
alias gfiles='touch README.md && touch LICENSE.md && touch CHANGELOG.md  && echo "${gb}${bf} Created README.md, LICENSE.md and CHANGELOG.md files. 💯 ${r}" && ll'

# This will add a 10 second wait before you can confirm a wildcard deletion.
# Lots of people, myself included, are so used to confirming the removal of files,
# that we don’t stop to actually read what will be deleted. Better to have it now then
# add it after you make a mistake!
setopt RM_STAR_WAIT

# Some options for our Zsh history. These will set our history to allow a ton more entires,
# ignore duplicate commands, and ignore some of the commands we don’t need a history of.
# This is useful because if you want to search for that command you ran a few weeks ago,
# you can do that a lot easier.
# export HISTSIZE=32768;
export HISTSIZE=1000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export SAVEHIST=1000

# Build a Mac App.
#
alias nfrmac="nativefier --full-screen -n "$1" $2"

# Silently add git ignore but if it fails, then show the error.
alias addgitignore="curl --fail --silent --show-error -O https://raw.githubusercontent.com/ahmadawais/dotfiles/master/.gitignore"

# Silently add .prettierrc but if it fails, then show the error.
alias addprettier="curl --fail --silent --show-error -O https://raw.githubusercontent.com/ahmadawais/dotfiles/master/.prettierrc"

# Remove cached but now gitignored files from remote after adding gitignore
alias grmcached="git rm -r --cached . && gfix 'Sync .gitignore'"

# Copy pictures to desktop
#
# Click on the picture in Photos. Press command i to read its Info. Double-click on the file name then copy it by pressing command c.
cpic() {
	cp "$(find Pictures -name "$@" -print)" ~/Desktop/
}

cimg() {
	cp "$(find Pictures -name "$@" -print)" ~/Desktop/
}

# Youtube DL
# @link https://github.com/rg3/youtube-dl
# Command-line program to download videos from
# YouTube.com and other video sites http://rg3.github.io/youtube-dl/
#
# YouTube disabled youtube-dl by speed limiting it. Now using yt-dlp
# https://github.com/yt-dlp/yt-dlp
# Old Command: youtube-dl
# New Command: dvid
dvid() {
	yt-dlp "$@" -o '%(title)s.%(ext)s' --format mp4
	#  youtube-dl "$@" -o '%(title)s.%(ext)s'
}

yt() {
	# yt-dlp -f "bv*[height<=1080,ext=mp4]+ba[ext=m4a]" --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
	#  yt-dlp -f 'bv*[height<=1080,ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b' --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
	yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080] / bv*+ba/b" --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
}

dvidbesta() {
	youtube-dl -f 'bestvideo[height<=1080,ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
}

dvidbesta2() {
	yt-dlp -f 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b' --merge-output-format mp4 "$@" --add-metadata --embed-thumbnail -o '%(title)s.%(ext)s'
}

dvidbest() {
	yt-dlp -f "bestvideo+bestaudio/best" --merge-output-format mp4 --add-metadata --embed-thumbnail -o "%(title)s.%(ext)s" "$@"
}

lsvid() {
	yt-dlp --list-formats "$@"
}

dvidfb() {
	youtube-dl --format best --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
}

dvideh() {
	youtube-dl --download-archive "$1/archive.txt" -o "$1/%(playlist_index)s_%(title)s" "https://egghead.io/courses/$1"
}

dwistia() {
	youtube-dl http://fast.wistia.net/embed/iframe/"$@"
}

dwisfile() {
	filename='wistia.md'
	echo "Start"
	while read p; do
		echo "⚡️ DOWNLOADING — $p"
		youtube-dl http://fast.wistia.net/embed/iframe/"$p"
		echo "✅ DONE — $p"
	done <$filename
	echo "End"
}

# Dvid config
alias dvidconfig="code /etc/youtube-dl.conf"

# DVIDRC
alias dvidrc="code ~/.netrc"

# Dropbox Uploader
# @link https://github.com/rg3/youtube-dl
# Dropbox Uploader is a BASH script which can be used to upload,
# download, list or delete files from Dropbox, an online file sharing,
# synchronization and backup service. http://www.andreafabrizi.it/?dropbox_uploader
#
# Old Command: ./dropbox_uploader.sh
# New Command: dbx
dbx() {
	~/dropbox_uploader.sh "$@"
}

# Open ssh config file
alias sshco="code ~/.ssh/config"

# Setup SSH key
# Usage: sshkey name
sshkey() {
	# First parameter
	path_name=$1

	echo "${wf}———————————————————${r}"
	echo "${wb}${bf} Let's Add an SSH Key...${r}"
	# Add the ssh key
	ssh-keygen -t rsa

	echo "${gb}${bf} Copy the key below and add it to your host ${r}"
	cat /Users/$USER/.ssh/"$path_name".pub

	echo "${gb}${bf} ✔✔✔ KEY ADDED! ✔✔✔︎ ${r}"
	echo "${wf}———————————————————${r}"

	sshconfig

	echo "${wf}———————————————————${r}"
}

# Add host to ~/.ssh/config
sshconfig() {
	echo "${wb}${bf} Have you added the key to your host? [y/n]: ${r}"
	read -r key_added

	if [[ "$key_added" == "y" ]]; then
		echo "${gb}${bf} Let's add the host to ~/.ssh/config ${r}"
		#st ~/.ssh/config

		echo "${wb}${bf} Enter the host NAME: ${r}"
		read -r host_name

		echo "${wb}${bf} Enter the IP Address: ${r}"
		read -r ip_address

		echo "${wb}${bf} Enter the IdentityFile's name ~/.ssh/NAME [just the name]: ${r}"
		read -r id_name

		echo "\nHost $host_name" >>~/.ssh/config
		echo "    HostName $ip_address" >>~/.ssh/config
		echo "    Port 22" >>~/.ssh/config
		echo "    User root" >>~/.ssh/config
		echo "    IdentityFile ~/.ssh/$id_name" >>~/.ssh/config

		echo "${gb}${bf} Added the following new host to ~/.ssh/config ${r}"
		echo "\nHost $host_name"
		echo "    HostName $ip_address"
		echo "    Port 22"
		echo "    User root"
		echo "    IdentityFile ~/.ssh/$id_name"
		echo "${gb}${bf} ✔✔✔ Host ADDED! ✔✔✔︎ ${r}"
	else
		echo "${rb}${wf} ⅹⅹⅹ No Host Added! ⅹⅹⅹ ${r}"
	fi
}

# Trash $PWD
alias rmpwd="trash $(pwd)"

# Open SSH config
alias osc="st ~/.ssh/config"

# Extract links from a site and save them in a file.
#
# Usage: elinks URL Filename.extension
#        elinks http://domain.com/ links.md
elinks() {
	url=$1
	domain=$(echo $1 | cut -d'/' -f3 | cut -d':' -f1)
	links=$2

	echo "${wb}${bf} -----------STARTING------------- ${r}"
	echo "${gb}${bf} Downloading the file... ${r}"
	wget $url -O file.html
	echo "${gb}${bf} Generating links... ${r}"
	pup 'a.lesson-index__lesson-link[href] attr{href}' <file.html >$links

	echo "${gb}${bf} Prefixing links... ${r}"
	sed -e 's#^#https://'$domain'#' $links >links_new.txt
	mv links_new.txt $links

	rm file.html
	echo "${gb}${bf} ✔︎✔︎✔︎ Find links in $links file ✔︎✔︎✔︎ ${r}"
	echo "${wb}${bf} -----------END------------- ${r}"
}

# Complete Lynda Download & Upload To Dropbox and Removal from VPS
ldu() {
	# folder_name=$1
	LYNDA_LINK=$1

	folder_name=$(wget -qO- $1 | grep -o "<title>[^<]*" | sed -e 's/<[^>]*>//g')

	mkd "$folder_name"

	echo "${gb}${bf} CREATED THE DIRECTORY CALLED $folder_name ${r}"

	echo "${wb}${bf} STARTED DOWNLOADING FROM LYNDA ${r}"

	dvidl "$LYNDA_LINK"
	echo "${gb}${bf} DOWNLOAD COMPELTED ✔︎ ✔︎ ✔︎ $folder_name ${r}"

	echo "${wb}${bf} UPLOADING TO DROPBOX... ${r}"
	dbxupwd
	echo "${wb}${bf} UPLOAD TO DROPBOX COMPELTED ✔︎ ✔︎ ✔︎ ${r}"

	cd ..
	rmv "$folder_name"

	echo "${wb}${rf} The folder $folder_name REMOVED!${r}"

	echo "${gb}${bf} ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ${r}"
	echo "${gb}${bf} ✔︎ ✔︎ ✔︎ DONE! DONE! ✔︎ ✔︎ ✔︎ ${r}"
	echo "${gb}${bf} ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ✔︎ ${r}"
	echo "${wf}———————————————————${r}"
}

# DBX Upload
dbxu() {
	dbx upload "$@"
}

# DB Upload PWD
dbxupwd() {
	dbx upload "$PWD" '%q\n' "${PWD##*/}"
}

# Easy Remove (I know what I am doing)
rmv() {
	rm -rf "$@"
}

# Animated Gifs workflows with Gifify
# Usage: gifit file.gif file.mov
gifit() {
	gifify --colors 255 --compress 0 --fps 30 -o "$1" "$2"
}

# Open host
alias hostso="code /etc/hosts"
alias khostso="code ~/.ssh/known_hosts"

# Reboot PTCL router.
alias ptclr="ptcli -r"

# DBX cpanel backup.
# Usage: dbxcu site.com
# Make sure the backup is in the root and called b.tar.gz.
dbxcu() {
	SITE=$1

	echo "——————————————————————————————————"
	echo "⚡️  Downloading backup for: $SITE..."
	echo "——————————————————————————————————"

	# Make dir.
	mkd $SITE"/cpanel/"

	# Download the backup
	wget $SITE/b.tar.gz

	echo "——————————————————————————————————"
	echo "✔︎✔︎✔︎  DOWNLOADED backup for: $SITE ✔︎✔︎✔︎"
	echo "——————————————————————————————————"

	# Go back.
	..

	echo "——————————————————————————————————"
	echo "⚡️  UPLOADING to Dropbox for: $SITE..."
	echo "——————————————————————————————————"

	# Upload the backup.
	dbxupwd

	# Go back.
	..

	echo "——————————————————————————————————"
	echo "✔︎✔︎✔︎  UPLOADED backup for: $SITE ✔︎✔︎✔︎"
	echo "——————————————————————————————————"

	# Remove PWD.
	rm -rf $SITE
}

# Run this to get a random tip from this document (parses Markdown and extracts an item):
# @link https://github.com/jlevy/the-art-of-command-line
taocl() {
	curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md |
		pandoc -f markdown -t html |
		xmlstarlet fo --html --dropdtd |
		xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
		xmlstarlet unesc | fmt -80
}

####.#### ———————————————————————————————————————————— PHPCS ———————————————————————————————————————————— ####.####

# Check standards installed.
alias phpcsi="phpcs -i"

# Use PHPCS with WPCS.
# Usage: checkwpcs file.php
checkwpcs() {
	phpcs --standard=WordPress "$@"
}

# Use PHPCS with WPCS.
addphpcs() {
	# cp ~/bin/phpcs.xml .
	cp ~/bin/wpaa/wpaa/ruleset.xml ./phpcs.xml
}

openWPAA() {
	code ~/bin/wpaa/wpaa/ruleset.xml
}

# Use PHPCS with WPCS.
lpcs() {
	phpcs -q --standard='./phpcs.xml' "$@"
}

# Use PHPCS with Custom Ruleset.
pcsc() {
	phpcs . --standard='~/bin/phpcs.xml' -n "$@"
}

alias phpcss="phpcs -s --extensions=php --report=emacs . | ack -o '(?<=\()\w+(\.\w+)+(?=\)$)' | sort | uniq -c | sort -nr"
# Update PHPCS, PHPMD, and WPCS
# Usage: updatewpcs
updatewpcs() {
	clear
	cd ~/bin/
	echo "${wb}${bf}———————————————— STARTED ————————————————${r}"
	echo "—"
	echo "${blb}${wf}———————————————— ⏲  PHPCS updating... ————————————————${r}"
	# cd phpcs && git fetch && git pull && git checkout 2.9
	cd phpcs && git pull
	echo "—"
	echo "${gb}${bf}———————————————— PHPCS UPDATED!  ✔︎ ————————————————${r}"
	echo "—"
	echo "${blb}${wf}———————————————— ⏲  PHPMD updating... ————————————————${r}"
	cd .. && cd phpmd && git pull
	echo "—"
	echo "${gb}${bf}———————————————— PHPMD UPDATED! ✔︎ ————————————————${r}"
	echo "—"
	echo "${blb}${wf}———————————————— ⏲  WPCS updating... ————————————————${r}"
	cd .. && cd wpcs && git pull && git checkout master
	echo "—"
	echo "${gb}${bf}———————————————— WPCS UPDATED! ✔︎ ————————————————${r}"
	echo "—"
	echo "${gb}${bf}———————————————— Reconfiguring... ✔︎ ————————————————${r}"
	./phpcs/bin/phpcs --config-set installed_paths ../wpcs
	./phpcs/bin/phpcs -i
	./phpcs/bin/phpcs --config-show
	echo "${gb}${bf}———————————————— ✔✔✔ Everything is UPDATED! ✔✔✔︎ ————————————————${r}"
}

# Set right permissions.
# Usage: perms
perms() {
	echo "-"
	echo "--------------- ⏲  LET' START... ---------------"
	echo "-"
	echo "${wb}${bf}- ⏲️  Setting the right permissions for: $PWD... -${r}"
	echo "-"
	sudo find $PWD/ -type f -exec chmod 644 {} +
	sudo find $PWD/ -type d -exec chmod 755 {} +
	echo "-"
	echo "${gb}${bf}--------------- ✔︎✔︎✔︎ DONE!!! 💯 🎉 ✔✔✔ ---------------${r}"
	echo "-"
}

# PWD Size.
size_pwd() {
	clear
	echo "-"
	echo "${wb}${bf}- ⚡️️ The total size of PWD is:${r}"
	echo "-"
	echo "${gb}${bf}----------->${r}$(du -hd 2 .)${r}"
	echo "-"
}

# Record terminal.
recterm() {
	asciinema rec
}

####.#### ———————————————————————————————————————————— RELEASE IT ———————————————————————————————————————————— ####.####
xxrl() {
	release-it "$@" -c ~/workflow/.release.json
}

####.#### ———————————————————————————————————————————— TEACHING ———————————————————————————————————————————— ####.####

lsn() {
	clear
	name=$@
	echo "${wb}${bf}--------------- ⏲  LET' START... ---------------${r}"
	mkdir "$name"
	echo "# $name" >>"$name"/content.md
	echo "${gb}${bf}--------------- 🎯  Done: "$name"... ---------------${r}"
}

####.#### ———————————————————————————————————————————— Browser Sync ———————————————————————————————————————————— ####.####
bsstrt() {
	browser-sync start "$@" -s './' --cors -w -f '**/*'
}
alias bstrt="bsstrt"

bsr() {
	browser-sync start "$@" -s -f './index.html' --index './index.html'
}

bsstrtd() {
	browser-sync start --proxy "$1" -f '**/*' --cors
}

####.#### ———————————————————————————————————————————— UTILITIES ———————————————————————————————————————————— ####.####

# Open man page as PDF.
# USAGE: manpdf cat
manpdf() {
	man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar -jxvf "$1" ;;
		*.tar.gz) tar -zxvf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.dmg) hdiutil mount "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar -xvf "$1" ;;
		*.tbz2) tar -jxvf "$1" ;;
		*.tgz) tar -zxvf "$1" ;;
		*.zip) unzip "$1" ;;
		*.ZIP) unzip "$1" ;;
		*.pax) cat "$1" | pax -r ;;
		*.pax.Z) uncompress "$1" --stdout | pax -r ;;
		*.Z) uncompress "$1" ;;
		*) echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file to extract"
	fi
}

# Change working directory to the top-most Finder window location
cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
targz() {
	local tmpFile="${@%/}.tar"
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

	size=$(
		stat -f"%z" "${tmpFile}" 2>/dev/null # macOS `stat`
		stat -c"%s" "${tmpFile}" 2>/dev/null # GNU `stat`
	)

	local cmd=""
	if ((size < 52428800)) && hash zopfli 2>/dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli"
	else
		if hash pigz 2>/dev/null; then
			cmd="pigz"
		else
			cmd="gzip"
		fi
	fi

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…"
	"${cmd}" -v "${tmpFile}" || return 1
	[ -f "${tmpFile}" ] && rm "${tmpFile}"

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2>/dev/null # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2>/dev/null # GNU `stat`
	)

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully."
}

# Determine size of a file or total size of a directory.
fs() {
	if du -b /dev/null >/dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* ./*
	fi
}

# UTF-8-encode a string of Unicode symbols.
escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	# print a newline unless we’re piping the output to another program.
	if [ -t 1 ]; then
		echo "" # newline
	fi
}

# Decode \x{ABCD}-style Unicode escape sequences.
unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	# print a newline unless we’re piping the output to another program.
	if [ -t 1 ]; then
		echo "" # newline.
	fi
}

# Get a character’s Unicode code point
codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo "" # newline
	fi
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified."
		return 1
	fi

	local domain="${1}"
	echo "Testing ${domain}…"
	echo "" # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" |
		openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1)

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" |
			openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version")
		echo "Common Name:"
		echo "" # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//"
		echo "" # newline
		echo "Subject Alternative Name(s):"
		echo "" # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" |
			sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2
		return 0
	else
		echo "ERROR: Certificate not found."
		return 1
	fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

# Get week number
alias week='date +%V'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# ⭐️ Gaze at repos you've starred
# https://github.com/jez/stargaze
alias bored='stargaze random'

# Ratio Ghost
alias rg="/Applications/RG/Ratio\ Ghost; exit;"

# MkDocs.
mk() {
	mkdocs "$@"
}

# mkdocs build
alias mkb="mk build"

# mkdocs serve
alias mks="mk serve"

# mkdocs gh-deploy
alias mkgd="mk gh-deploy --force -m BUILD!"

# Mkdocs build and deploy
mkdp() {
	echo "-"
	echo "${wb}${bf}--------------- ⏲  DOCS: Let's deploy em... ---------------${r}"
	echo "-"

	echo "${wb}${bf}--------------- ✔︎  DOCS: Deploying... ---------------${r}"
	mkgd

	echo "${wb}${bf}--------------- ✔︎  DOCS: Git pushing... ---------------${r}"
	gcap '👉 '

	echo "-"
	echo "${gb}${bf}--------------- ✔︎✔︎✔︎ DONE!!! 💯 🎉 ✔✔✔ ---------------${r}"
	echo "-"
}

#  You can use existing Terminal window and cd to selected directory in Finder by cdf command.
alias cdf="eval \"cd \\\"\\\`osascript -e 'tell app \\\\\\\"Finder\\\\\\\" to return the POSIX path of (target of window 1 as alias)'\\\`\\\"\""

# Delet .DS_Store
alias dstdel="find . -name ‘*.DS_Store’ -type f -delete"

# Remove query strings from ExerciseFiles
rmquery() {
	for file in *.zip\?*; do mv "$file" "${file%%\?*}"; done
}
alias rmq="rmquery"

# Remove query strings from custom files.
rmqc() {
	for file in *."$@"\?*; do mv "$file" "${file%%\?*}"; done
}

alias diffh="diff2html"

# Bitly short URL
# @link https://github.com/specious/bitly-client
# @usage surl http://url.com/file/
surl() {
	bitly-client --domain ahmda.ws "$@"
}

# RSYNC FTP type server trasnfer.
# @usage rsyncsendy local_path IP server_path
# @usage rsyncserver local_path IP server_path
rsyncsendy() {
	rsync -chavz --partial --progress --stats "$1" root@"$2":"$3"
}
rsyncserver() {
	rsync -chavz --partial --progress --stats "$1" root@"$2":"$3"
}

# Add Normalize CSS.
alias addncss="curl -O https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css"

# Create a DIff/patch.
wpcp() {
	if [[ "-h" == "$1" ]]; then
		echo "-"
		echo "${wb}${bf}———————————————— Help! ————————————————${r}"
		echo "${wb}${bf}————————————————-------————————————————${r}"
		echo "${wb}${bf}——— Usage: wpcp ———${r}"
		echo "-"
		return 1
	else
		echo "-"
		echo "${wb}${bf}--------------- ⏲  START: Let's create a patch... ---------------${r}"
		echo "-"

		wpcore

		echo "-"
		echo "—————————————————————————————"
		echo "${yf}❯  Ticket # (3456 or 3456.1):${r}"
		echo "—————————————————————————————"
		read -r WPC_PATCH_NAME

		git diff -- . ':(exclude)Gruntfile.js' >$WPC_PATCH_NAME.diff

		echo "-"
		echo "${gb}${bf}--------------- ✔︎✔︎✔︎ DONE!!! "$WPC_PATCH_NAME".diff Created! 💯 🎉 ✔✔✔ ---------------${r}"
		echo "-"
	fi
}

# Better SSH Tunnel Persistance
# @link http://ashayhumane.blogspot.com/2014/11/autossh-mac-os-x.html
alias autossh='autossh -M $(($RANDOM%6400 + 1024))'
alias assh='autossh -M $(($RANDOM%6400 + 1024))'

# FreeDNS Update and SSH.
ash() {
	# Update FDNS.
	curl -k -s -L "https://ahmda.ws/srv_fdns" # > /dev/null 2>&1

	# Keep assh as is.
	ssh "$@"
}

# Update FDNS.
# # > /dev/null 2>&1
alias fdns="curl -k -s -L 'https://ahmda.ws/srv_fdns'"

####.#### ———————————————————————————————————————————— Todolist http://todolist.site/ ———————————————————————————————————————————— ####.####
# Alias it all.
td() {
	todolist "$@"
}

# Init.
alias tdi="todolist init"

# Add.
tda() {
	todolist add "$@"
}

# List.
tdl() {
	todolist list "$@"
}

# List by priority.
alias tdgc="todolist l p"

# Due.
tdld() {
	todolist list due "$@"
}

# Edit.
tde() {
	todolist e "$@"
}

# Complete.
tdc() {
	todolist c "$@"
}

# Archive Complete.
tdac() {
	todolist ac "$@"
}

# Prioritize.
tdp() {
	todolist p "$@"
}

# Delete.
tdd() {
	todolist d "$@"
}

# Expanding existing todos.
tdex() {
	todolist ex "$@"
}

# Archived todos will only show up when running.
alias tdla="todolist list archived"

# The web view.
alias tdla="todolist web"

# Garbage Collection. Deletes all archived todos.
alias tdgc="todolist gc"

# Todo Dir.
alias tdir="cd ~ && cd tdir"

# Empty mail.
alias emptymail="echo > /var/mail/ahmadawais && echo 'DONE!!! 💯'"

# http://stackoverflow.com/a/26655887/950111
parse_json() {
	echo $1 |
		sed -e 's/[{}]/''/g' |
		sed -e 's/", "/'\",\"'/g' |
		sed -e 's/" ,"/'\",\"'/g' |
		sed -e 's/" , "/'\",\"'/g' |
		sed -e 's/","/'\"---SEPERATOR---\"'/g' |
		awk -F=':' -v RS='---SEPERATOR---' "\$1~/\"$2\"/ {print}" |
		sed -e "s/\"$2\"://" |
		tr -d "\n\t" |
		sed -e 's/\\"/"/g' |
		sed -e 's/\\\\/\\/g' |
		sed -e 's/^[ \t]*//g' |
		sed -e 's/^"//' -e 's/"$//'
}

####.#### ———————————————————————————————————————————— REST API ———————————————————————————————————————————— ####.####

# Get summary of 10 latest posts.
get_summary() {
	curl https://"$1"/wp-json/wp/v2/posts | jq '[.[] | { title: .title.rendered, link: .link, excerpt: .excerpt.rendered}]'
}

alias cl="clear"

# Squash last X commits with a Commit message.
# Usage: squash X COMMIT_MSG
# where X= Number of last commits.
# where COMMIT_MSG= New commit msg.
squash() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`squash X COMMIT_MSG\`"
		echo "X= Number of last commits."
		echo "COMMIT_MSG= New commit msg."
		return 1
	fi

	git reset --soft HEAD~"$1"
	git add . && git ci -m "$2"
	git push --force
}

sq() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`squash X COMMIT_MSG\`"
		echo "X= Number of last commits."
		echo "COMMIT_MSG= New commit msg."
		return 1
	fi

	git reset --soft HEAD~"$1"
	git add . && git ci -m "$2"
	git push --force
}

# Right perms for gulp-notify
alias fixgnotify="sudo chmod -R a+rwx ..."

####.#### ———————————————————————————————————————————— Babel ———————————————————————————————————————————— ####.####

# Babel
babel() {
	# echo '---NOTE: Running local babel via zshrc ---'
	./node_modules/.bin/babel "$@"
}

####.#### ———————————————————————————————————————————— TLDR ———————————————————————————————————————————— ####.####

# TLDR Master wrapper.
tl() {
	tldr -t ocean "$@"
}

# doctoc Master wrapper.
toc() {
	doctoc --title '**Table of Contents**' "$@"
}

alias ej="emoji-finder --dango"

####.#### ———————————————————————————————————————————— GIT ———————————————————————————————————————————— ####.####

#.# Better Git Logs.

# git add all, git commit with the message and git push
# git commit all push
gcmap() {
	git add . && git ci -m "$*" && gp
}

# Git Commit, Add all and Push — in one step.
gcap() {
	git add . && git commit -m "$*" && git push
}

# Git Add, Commit (Msg + Desc), and Push — in one step.
# @usage gcapd "Message" "Description"
gcapd() {
	git add . && git commit -m "$1" -m "$2" && git push
}

gcall() {
	git add . && git ci -m "$*"
}

# NEW.
gnew() {
	gcap "📦 NEW: $@"
}
gnewx() {
	gcall "📦 NEW: $@"
}

# IMPROVE.
gimp() {
	gcap "👌 IMPROVE: $@"
}
gimpx() {
	gcall "👌 IMPROVE: $@"
}

# FIX.
gfix() {
	gcap "🐛 FIX: $@"
}
gfixx() {
	gcall "🐛 FIX: $@"
}

# RELEASE.
grlz() {
	gcap "🚀 RELEASE: $@"
}
grlzx() {
	gcall "🚀 RELEASE: $@"
}

# DOC.
gdoc() {
	gcap "📖 DOC: $@"
}
gdocx() {
	gcall "📖 DOC: $@"
}

# TEST.
gtst() {
	gcap "🤖 TEST: $@"
}
gtstx() {
	gcapll "🤖 TEST: $@"
}

# BREAKING CHANGE.
gbrk() {
	gcap "‼️ BREAKING: $@"
}
gbrkx() {
	gcapll "‼️ BREAKING: $@"
}

gtype() {
	NORMAL='\033[0;39m'
	GREEN='\033[0;32m'
	echo "$GREEN gnew$NORMAL — 📦 NEW
$GREEN gimp$NORMAL — 👌 IMPROVE
$GREEN gfix$NORMAL — 🐛 FIX
$GREEN grlz$NORMAL — 🚀 RELEASE
$GREEN gdoc$NORMAL — 📖 DOC
$GREEN gtst$NORMAL — 🧪️ TEST
$GREEN gbrk$NORMAL — ❗️ BREAKING"
}

# Git Stash all.
stash() {
	git stash save --include-untracked
}

#.# Create Git Repo + Add Repo on GitHub.
grinit() {
	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯  Are you inside the right folder? (y/n):${r}"
	echo "—————————————————————————————"
	read -r THE_GH_REPO_RIGHT

	if [[ 'y' != THE_GH_REPO_RIGHT ]]; then
		return 0
	fi

	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯  GitHub Repo Name:${r}"
	echo "—————————————————————————————"
	read -r THE_GH_REPO_NAME

	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯  GitHub Repo Description:${r}"
	echo "—————————————————————————————"
	read -r THE_GH_REPO_DSC

	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯  Is It:${r}"
	echo "—————————————————————————————"
	read -r THE_GH_REPO_DSC
}

# GH New repo.
ghinit() {
	echo "\n${yf}❯ Creating the GitHub Repo in PWD…${r}\n"
	gh re --new "$1" --description "$2" --type "$3" --homepage "https://twitter.com/MrAhmadAwais/"
	gh re --user "ahmadawais" --repo "$1" --clone
	cd "$1"
	addgitignore
	echo "# $1 \n\n > $2" >>readme.md
	gnew 'First commit'
	echo "\n${gf}✅ DONE! Repo → https://github.com/ahmadawais/$1${r}\n"
}

# GH New repo private.
ghinitp() {
	ghinit "$1" "$2" "private"
}

ghinitx() {
	git init >/dev/null 2>&1
	echo "${yf}❯  Creating the GitHub Repo in PWD…${r}"
	gh re --new "$1" --description "$2" --type "$3" --homepage "https://twitter.com/MrAhmadAwais/" >/dev/null 2>&1
	git remote remove origin >/dev/null 2>&1
	git remote add origin "https://github.com/ahmadawais/$1" >/dev/null 2>&1
	addgitignore >/dev/null 2>&1
	gnew 'First commit' >/dev/null 2>&1
	echo "\\n✅ DONE! Repo → https://github.com/ahmadawais/$1\\n"
}

ghinitpx() {
	ghinitx "$1" "$2" "private"
}

# Del a repo.
ghdel() {
	gh re --delete "$1"
}

# GITHUB CLI.
# Create a new dir and repo.
grc() {
	if [[ -z "$1" ]]; then
		echo "\n${rf}Please provide a repo name.${r}\n"
		return 1
	else
		NAME="$1"
	fi

	if [[ -z "$3" ]]; then
		TYPE="--public"
	else
		TYPE="$3"
	fi

	if [ -z "$2" ]; then
		DESC="$1 by Awais.dev"
	else
		DESC="$2"
	fi

	gh repo create "$NAME" --description "$DESC" "$TYPE" --homepage "https://twitter.com/MrAhmadAwais" --confirm

	cd "$NAME"
	echo "# $NAME \n\n > $DESC" >>readme.md
	addgitignore >/dev/null 2>&1
	gnew 'First commit' >/dev/null 2>&1
	echo "\n${gf}✅ https://github.com/ahmadawais/$1${r}\n"
}

grcp() {
	grc "$1" "$2" "--private"
}

# Create a GitHub repository from pwd.
grcpwd() {
	NAME=${PWD##*/}
	DESC="$NAME by Awais"

	if [[ -z "$1" ]]; then
		TYPE="--public"
	else
		TYPE="$1"
	fi

	git init
	gh repo create "$NAME" --description "$DESC" "$TYPE" --homepage "https://twitter.com/MrAhmadAwais" --confirm
	git remote add origin "https://github.com/ahmadawais/$NAME.git"

	echo "\n${gf}✅ https://github.com/ahmadawais/$NAME${r}\n"
}

grcpwdp() {
	grcpwd "--private"
}

scarf() {
	echo "\n${yf}❯ Adding scarf analytics (npm i)${r}"
	npm i @scarf/scarf >/dev/null 2>&1
	echo "${yf}❯ Commiting to GitHub${r}"
	gnewx 'Analyze' >/dev/null 2>&1
	echo "${yf}❯ Releasing on npm${r}"
	rlz patch | tail -n 3
	echo "${gf}❯ All done!${r}\n"
}

rmscarf() {
	echo "\n${yf}❯ Removing scarf analytics (npm rm)${r}"
	npm rm @scarf/scarf >/dev/null 2>&1
	echo "${yf}❯ Commiting to GitHub${r}"
	gimpx "Remove Scarf" >/dev/null 2>&1
	echo "${yf}❯ Releasing on npm${r}"
	rlz patch | tail -n 3
	echo "${gf}❯ All done!${r}\n"
}

####.#### ———————————————————————————————————————————— Command line magic ———————————————————————————————————————————— ####.####
# Command line magic.
rainbow() {
	yes "$(seq 231 -1 16)" | while read i; do
		printf "\x1b[48;5;${i}m\n"
		sleep .02
	done
}

# Trash all the node modules in the PWD
trash_node_modules() {
	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯ Trash all the node modules in the PWD? (y/n):${r}"
	echo "—————————————————————————————"
	read -r IS_MOVE_FORWARD

	if [[ 'y' != IS_MOVE_FORWARD ]]; then
		return 0
	fi

	echo "Trashing all the node modules in the PWD."
	find . -name node_modules -type d -prune -exec trash {} +
}

####.#### ———————————————————————————————————————————— Mac Backups ———————————————————————————————————————————— ####.####
# Backup Entire Photos Library.
bkpics() {
	echo "-"
	echo "—————————————————————————————"
	echo "${yf}❯ Backing up Entire Photos Library. :${r}"
	echo "—————————————————————————————"
	RSP_PARAM="-av"
	BKP_DST="/Volumes/AhmadAwais.com/BACKUPS/Users/ahmadawais/Pictures"
	rsync "$RSP_PARAM" ~/Pictures/ "$BKP_DST" |
		pv -lep -s $(rsync "$RSP_PARAM"n ~/Pictures/ "$BKP_DST" | awk 'NF' | wc -l)

	echo "-"
	echo "${gb}${bf}--------------- ✔︎✔︎✔︎ DONE!!! 💯 🎉 ✔✔✔ ---------------${r}"
	echo "-"
}

# Rsync based backup for Mac.
# .
# Usage: bk ~/path/to/backup/
# E.g. bk ~/Documents/Audio will create /Volumes/AhmadAwais.com/BACKUPS/Users/Documents/Audio backup.
bk() {
	# Halt the script on any errors.
	# set -e
	echo "-"

	#  -a is archive mode so it keeps your original created and modified properties.
	#  -v is verbose mode to get a bit of extra output (useful for debugging).
	#  -R is relative mode. It ensures the included paths get created on the target.
	RS_PARAM="-avR"

	# The input from user.
	BK_SRC="$1"

	# Your backup HDD's volume path.
	BK_DST="/Volumes/AhmadAwais.com/BACKUPS/"

	echo "—————————————————————————————"
	echo "➤ ${wb}${bf} Backing up "$1" :${r}"
	echo "—————————————————————————————"

	rsync "$RS_PARAM" --exclude="node_modules" --exclude=".git" "$BK_SRC" "$BK_DST" |
		pv -lep -s $(rsync "$RS_PARAM"n --exclude="node_modules" --exclude=".git" "$BK_SRC" "$BK_DST" | awk 'NF' | wc -l)
	echo "-"
	echo "✅  DONE!"
	echo "-"
}

# Rsync based backup from WD to Transcend HDD for Mac.
# .
# Usage: bkwt ~/path/to/backup/
# E.g. bkwt /Volumes/AhmadAwais.com/BACKUPS/Users/Documents/Audio will create /Volumes/AATranscend/BACKUPS/Users/Documents/Audio backup.
bkwt() {
	# Halt the script on any errors.
	set -e
	echo "-"

	#  -a is archive mode so it keeps your original created and modified properties.
	#  -v is verbose mode to get a bit of extra output (useful for debugging).
	#  -R is relative mode. It ensures the included paths get created on the target.
	RS_PARAM="-avR"

	# The input from user.
	BK_SRC="$1"

	# Your backup HDD's volume path.
	BK_DST="/Volumes/AATranscend/BACKUPS/"

	echo "—————————————————————————————"
	echo "➤ ${wb}${bf} Backing up "$1" :${r}"
	echo "—————————————————————————————"

	rsync "$RS_PARAM" --exclude="node_modules" --exclude=".git" "$BK_SRC" "$BK_DST" |
		pv -lep -s $(rsync "$RS_PARAM"n --exclude="node_modules" --exclude=".git" "$BK_SRC" "$BK_DST" | awk 'NF' | wc -l)
	echo "-"
	echo "✅  DONE!"
	echo "-"
}

# Rsync based backup for Mac.
# .
# Usage: bkt ~/path/to/backup/
# E.g. bkt ~/Documents/Audio will create /Volumes/AATranscend/BACKUPS/Volumes/AhmadAwais.com/BACKUPS/Users/Documents/Audio backup.
bkt() {
	# Halt the script on any errors.
	# set -e
	echo "-"

	#  -a is archive mode so it keeps your original created and modified properties.
	#  -v is verbose mode to get a bit of extra output (useful for debugging).
	#  -R is relative mode. It ensures the included paths get created on the target.
	RS_PARAM="-avR"

	# The input from user.
	BK_SRC="$1"

	# Your backup HDD's volume path.
	BK_DST="/Volumes/AATranscend/BACKUPS/"

	echo "—————————————————————————————"
	echo "➤ ${wb}${bf} Backing up "$1" :${r}"
	echo "—————————————————————————————"

	rsync "$RS_PARAM" --exclude="node_modules" --exclude=".git" --exclude=".next" --exclude=".cache" "$BK_SRC" "$BK_DST" |
		pv -lep -s $(rsync "$RS_PARAM"n --exclude="node_modules" --exclude=".git" --exclude=".next" --exclude=".cache" "$BK_SRC" "$BK_DST" | awk 'NF' | wc -l)
	echo "-"
	echo "✅  DONE!"
	echo "-"
}

bkpwd() {
	bkt "$(pwd -P)"
}

# Restore from External to Internal HDD.
rbkt() {
	# Halt the script on any errors.
	# set -e
	echo "-"

	#  -a is archive mode so it keeps your original created and modified properties.
	#  -v is verbose mode to get a bit of extra output (useful for debugging).
	#  -R is relative mode. It ensures the included paths get created on the target.
	RS_PARAM="-avR"

	# The input from user.
	SOURCE_PATH="$1"

	# Your backup HDD's volume path.
	DESTINATION_PATH="/Volumes/Macintosh\ HD/"

	echo "—————————————————————————————"
	echo "➤ ${wb}${bf} Backing up "$1" :${r}"
	echo "—————————————————————————————"

	rsync "$RS_PARAM" --exclude="node_modules" --exclude=".git" --exclude=".next" --exclude=".cache" "$SOURCE_PATH" "$DESTINATION_PATH" |
		pv -lep -s $(rsync "$RS_PARAM"n --exclude="node_modules" --exclude=".git" --exclude=".next" --exclude=".cache" "$SOURCE_PATH" "$DESTINATION_PATH" | awk 'NF' | wc -l)
	echo "-"
	echo "✅  DONE!"
	echo "-"
}

rbkpwd() {
	rbkt "$(pwd -P)"
}

bkmac() {
	# Halt the script on any errors.
	set -e

	# This would be the path to your external HD or wherever you're backing up
	# your files. If you're on WSL, all of your drives can be found in /mnt.
	target_path="/Volumes/AhmadAwais.com/BACKUPS/"

	# Create the target path if it doesn't exist. This command is smart enough to
	# not do anything if it already exists, which is important for later because
	# we'll be running this script on an automated schedule.
	mkdir -p "${target_path}"

	# A list of absolute paths to backup. In the case of WSL, ${HOME} is inside of
	# the WSL file system. This is where most of your dotfiles would be located.
	#
	# The /mnt/e paths happens to be an internal HD I use to store all of my data.
	include_paths=(
		"${HOME}/documents"
		"/.ssh/"
		"/.dotfiles/"
		"/Library/Keychains/*"
		"/Library/Application?Support/Paragon?Software/"
		"/Library/Application?Support/Paragon?Updater/"
		"/Library/Application?Support/GitHub?for?Mac/"
	)

	# A list of folder names and files to exclude. There's no point backing up
	# massive folders such as node_modules, plus you'll likely end up getting max
	# file path copy errors because npm nests directories so deep it breaks Windows.
	exclude_paths=(
		".asset-cache"
		".bundle"
		".jekyll-cache"
		".tweet-cache"
		"_site"
		"node_modules"
		"tmp"
		".git"
	)

	# rsync allows you to exclude certain paths. We're just looping over all of the
	# excluded items and build up separate --exclude flags for each one.
	for item in "${exclude_paths[@]}"; do
		exclude_flags="${exclude_flags} --exclude=${item}"
	done

	# rsync allows you to pass in a list of paths to copy. It expects a space separated
	# string, so that's what we're building up here.
	for item in "${include_paths[@]}"; do
		include_args="${include_args}${item}"
	done

	echo "—————————————————————————————"
	echo "${yf}❯ Backing up "$1" :${r}"
	echo "—————————————————————————————"

	# Finally, we just run rsync with a few flags:
	#  -a is archive mode so it keeps your original created and modified properties.
	#  -v is verbose mode to get a bit of extra output (useful for debugging).
	#  -R is relative mode. It ensures the included paths get created on the target.
	#  --dry-run ensures nothing gets written to the target (for testing purposes).
	rsync -avR --dry-run ${exclude_flags}${include_args}${target_path} |
		pv -lep -s $(rsync "$RS_PARAM"n "$BK_SRC" "$BK_DST" | awk 'NF' | wc -l)
	echo "-"
	echo "✅  DONE!"
	echo "-"
}

####.#### ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————— ####.####

####.#### ———————————————————————————————————————————— Everything Else: Other Snippets ———————————————————————————————————————————— ####.####
# Show Battery Percentage
battery() {
	pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
}

# Show Wi-Fi Network Passwords
# Exchange SSID with the SSID of the access point you wish to query the password from.
wifipswd() {
	security find-generic-password -D "AirPort network password" -a "$@" -gw
}

# Turn on Wi-Fi Adapter
offwifi() {
	networksetup -setairportpower en0 on
}

# Delete all node_modules inside the current dir.
del_node_modules_here() {
	find . -name "node_modules" -exec rm -rf '{}' +
}

# Use Git to find total lines of code in a repository.
# @usage: Browse a git repo and run `gloc`.
gloc() {
	git ls-files | xargs wc -l
}

# Use Git to find total lines of code in a repo by each author.
# Usage: Browse a git repo and run `glocba``
glocba() {
	git ls-files -z | xargs -0n1 git blame -w | perl -n -e '/^.*\((.*?)\s*[\d]{4}/; print $1,"\n"' | sort -f | uniq -c | sort -n
}

# Run QB64.
alias qb="/Users/ahmadawais/Documents/QB/qb64/qb64_start_osx.command"

# Chrome.
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Project Writy
alias wtp="cd ~/wtp"
alias wtt="cd ~/wtt"

# Writy update.
wtupdate() {
	echo "-"
	echo "${wb}${bf}--------------- ⏲  Updating Writy Plugin Pro... ---------------${r}"
	echo "-"
	cd ~/wtp
	git fetch && git pull

	echo "-"
	echo "${wb}${bf}--------------- ⏲  Updating Writy Theme... ---------------${r}"
	echo "-"

	cd ~/wtt
	git fetch && git pull

	echo "-"
	echo "${gb}${bf}--------------- ✅ DONE! ---------------${r}"
	echo "-"
}

# Show ANSI Colors in the terminal.
showansicolors() {
	for attr in 0 1 4 5 7; do
		echo "----------------------------------------------------------------"
		printf "ESC[%s;Foreground;Background - \n" $attr
		for fore in 30 31 32 33 34 35 36 37; do
			for back in 40 41 42 43 44 45 46 47; do
				printf '\033[%s;%s;%sm %02s;%02s  ' $attr $fore $back $fore $back
			done
			printf '\n'
		done
		printf '\033[0m'
	done
}

# Rename files by removing Query String names of static files downloaded via wget.
# Usage rmqs jpg
rmqs() {
	for file in *."$1"\?*; do mv "$file" "${file%%\?*}"; done
}

# Personal tfoo.
rt() {
	REMEMBERERD_DIR="$(cd "$(dirname "$0")" && pwd)"
	cd ~/tfoo
	node rtl.js $*
	cd $REMEMBERERD_DIR
}

tl() {
	REMEMBERERD_DIR="$(cd "$(dirname "$0")" && pwd)"
	cd ~/tfoo
	node l.js $*
	cd $REMEMBERERD_DIR
}

tr() {
	REMEMBERERD_DIR="$(cd "$(dirname "$0")" && pwd)"
	cd ~/tfoo
	node r.js $*
	cd $REMEMBERERD_DIR
}

tq() {
	REMEMBERERD_DIR="$(cd "$(dirname "$0")" && pwd)"
	cd ~/tfoo
	node quote.js
	cd $REMEMBERERD_DIR
}

# Start a PHP Server.
phpServer() {
	if [[ -z "$1" ]]; then
		php -S localhost:8000
	else
		php -S localhost:"$1"
	fi
}

# Composer Alias.
pcmp() {
	composer "$@"
}

# Helpfulp quick definitions. Like the idea.
commandsfx() {
	echo ""
	echo "TO THE POINT EXPLANATIONS:"
	echo "${gb}${bf} Symlink ${r}: ln -s /path/to/file /path/to/symlink"
	echo "${gb}${bf} Copy ${r}: cp /file/to/copy /destination/to/send/copy"
	echo ""
}

alias 'cmds'=commandsfx

alias timezsh="time  zsh -i -c exit"

alias rmhist="rm $HISTFILE"

alias diskspace="df -P -kHl"

# File size
alias fs="stat -f \"%z bytes\""

# List all files, long format, colorized, permissions in octal
function la {
	ls -l "$@" | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
    }'
}

# Check the whois of a domain or form a URL.
# @usage: whois google.com
# @usage: whois https://google.com
# @link: https://gist.github.com/56261539c39a9f66c762989b14c510a4
whois() {
	# Get domain from URL and strip http or https.
	local domain=$(echo "$1" | awk -F/ '{print $3}')
	if [ -z $domain ]; then
		domain=$1
	fi

	echo "Getting whois record for: $domain …"

	# Avoid recursion
	# This is the best whois server AFAIK.
	# Strip extra fluff
	/usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# who is using the laptop's iSight camera?
camerausedby() {
	echo "Checking to see who is using the iSight camera… 📷"
	usedby=$(lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps)
	echo -e "Recent camera uses:\n$usedby"
}

# direct it all to /dev/null
nullify() {
	"$@" >/dev/null 2>&1
}

# `shellswitch [bash |zsh]`
#   Must be in /etc/shells
shellswitch() {
	chsh -s $(brew --prefix)/bin/$1
}

# Create a Symlink and dump its alias to paths.
lns() {
	THE_PWD=$PWD
	cd ~
	ln -s $THE_PWD $1
	echo "alias $1='cd ~ ; cd $1'" >>~/Dropbox/bin/.paths
	source ~/Dropbox/bin/.paths
	cd $1
	echo "✅ DONE!"
}

# Default screenshots format.
shotpng() {
	defaults write com.apple.screencapture type png
	killall SystemUIServer
}
shotjpg() {
	defaults write com.apple.screencapture type jpg
	killall SystemUIServer
}
shotpdf() {
	defaults write com.apple.screencapture type pdf
	killall SystemUIServer
}

# RUBY
#  eval "$(rbenv init -)"
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# HTTP Header Checker
headerCheck() {
	wget "$@" --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --header="Accept: image/png,image/*;q=0.8,*/*;q=0.5" --header="Accept-Language: en-US,en;q=0.5" --header="Accept-Encoding: gzip, deflate" --header="Referer: https://referring.site/"
}

# GitHub Contributors List.
gclist() {
	npx github-contributors-list --owner ahmadawais --repo "$1" --cols 6 --sortOrder desc --showlogin true --imagesize "117" --filter gitter-badger,abdullah1908 | pbcopy
	echo "✅  Copied!"
}

# Course: Rename final files.
cPrepFinal() {
	echo '\n'
	echo "⏲  ${wb}${bf}Preparing final files… ${r}"
	mkdir -p "__FINAL"
	echo "💥 ${wb}${bf}CREATE DIR: __FINAL ${r}"
	echo '\n'

	for i in *; do
		FOLDER_NAME=$(basename $i)
		[[ $FOLDER_NAME =~ ^(__FINAL|_RENDER_TEMPLATE|_AUDITION_PRESET)$ ]] && continue # Ignore all these folders.

		if [ -f "$i/_FINAL.mp4" ]; then
			mv "$i/_FINAL.mp4" "$i/$i.mp4"                  # Renames _FINAL.mp4 file to the same name as the folder name.
			mv "$i/$i.mp4" "$i/_$(echo $i.mp4 | cut -c 3-)" # Renames the files by removing '✅ ' from their names
			# cp "$i/_`echo $i.mp4 | cut -c 3-`" ./__FINAL # Copy files to __FINAL folder.
		fi

		cp "$i/_$(echo $i.mp4)" ./__FINAL # Copy files to __FINAL folder.

		echo "	→ DONE: _$i.mp4"
	done

	cd __FINAL
	for FILE in *; do
		NEW_NAME=$(echo $FILE | cut -c 2-)
		mv "$FILE" "$(echo $NEW_NAME | tr " " "-" | tr -s "\--")" # Renames the files by removing '_' from their names
		# mv "$NEW_NAME" "`echo $FILE | tr " " "-" | tr -s "\--"`" ; # Renames the files by removing '_' from their names
	done
	cd ..

	echo '\n'
	echo "️✅ ${gb}${bf} DONE ${r}"
	echo '\n'

}

# Course files length in seconds.
alias cptime="courseLength"
alias cplength="courseLength"

courseLength() {
	echo "\\n⏲  ${wb}${bf} Calculating… ${r}\\n"

	SECONDS=$(find . -maxdepth 1 -iname '*.mp4' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | paste -sd+ - | bc)

	echo "TOTAL SECONDS: $SECONDS"
	echo "\\n $(convertSeconds $SECONDS) \\n"
}

alias cpduration="dur"
alias cpdurcpy="dur |pbcopy"
alias cpdur="dur"
alias filenameDuration="dur"
dur() {
	exiftool -T -Duration -FileName *
}

# Convert seconds to hr min sec.
convertSeconds() {
	h=$(bc <<<"${1}/3600")
	m=$(bc <<<"(${1}%3600)/60")
	s=$(bc <<<"${1}%60")
	printf "${blb}${bf} %02d ${r} HOURS : ${yb}${bf} %02d ${r} MINUTES : ${mb}${bf} %05.2f ${r} SECONDS \n" $h $m $s
}

vtimes() {
	for f in *.mp4; do
		_t=$(ffmpeg -i "$f" 2>&1 | grep "Duration" | grep -o " [0-9:.]*, " | head -n1 | tr ',' ' ' | awk -F: '{ print ($1 * 3600) + 	($2 * 60) + $3 }')
		times+=("$_t")
	done
	echo "${times[@]}" | sed 's/ /+/g' | bc
}

# Course Order folders.
cOrderFolders() {
	echo '\n'
	echo "⏲  ${wb}${bf} Ordering folders… ${r}"
	COUNT=1
	for i in *; do
		FOLDER_NAME=$(basename $i)
		[[ $FOLDER_NAME =~ ^(__FINAL|_RENDER_TEMPLATE|_AUDITION_PRESET)$ ]] && continue # Ignore all these folders.

		NEW_NAME=$(printf "%02d- $(echo $i | cut -c 5-)" "$COUNT")
		mv -i -- "$i" "$NEW_NAME"
		echo "	→ DONE: $NEW_NAME"
		let COUNT=COUNT+1
	done
	echo '\n'
	echo "️✅ ${gb}${bf} DONE ${r}"
	echo '\n'
}

# Remove last 4 chars from end.
rm_last_four() {
	echo '\n'
	echo "⏲  ${wb}${bf} Renaming folders… ${r}"
	for i in *; do
		mv -i -- "$i" "$(echo $i | rev | cut -c 5- | rev)"
		echo "	→ DONE: $(echo $i | rev | cut -c 5- | rev)"
	done
	echo '\n'
	echo "️✅ ${gb}${bf} DONE ${r}"
	echo '\n'
}

# Common npm & yarn aliases.
alias ns="npm start"
alias nb="npm run build"
alias nrs="npm run serve"
alias nrd="npm run dev"
alias nrc="npm run clean"
alias nbs="npm run build && npm run serve"
alias nrr="npm run release"
alias nrt="npm run test"
alias nt="npm test"
alias ys="yarn start"
alias yb="yarn build"
alias yd="yarn dev"

nbin() { (
	PATH=$(npm bin):$PATH
	eval $@
); }

nr() {
	npm run $@
}

alias cppp="cat /Users/ahmadawais/cpapi/class/PPP.php"

ppp() {
	echo '\n'
	grep "'$1'" /Users/ahmadawais/cpapi/class/PPP.php
	echo '\n'
}

# Silent Git.
silentGit() {
	stdout=$(tempfile)
	stderr=$(tempfile)

	if ! git "$@" </dev/null >$stdout 2>$stderr; then
		cat $stderr >&2
		rm -f $stdout $stderr
		exit 1
	fi

	rm -f $stdout $stderr
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GPG Keys
alias gpgls="gpg --list-secret-keys --keyid-format LONG"

# On gpg access fail.
alias gpgexpo="export GPG_TTY=$(tty)"
# export GPG_TTY=$(tty)
alias gpgkill="gpgconf --kill gpg-agent"
alias gpginit="gpg-agent --daemon"

yw() {
	yarn workspace "$@"
}

# Delete this.
alias create-cloudinary-headshot="/Users/ahmadawais/work/headshot/cli/index.js"

# Gif to video.
# https://web.dev/replace-gifs-with-videos/
gif2vid() {
	if [[ "-h" == "$1" ]]; then
		echo "-"
		echo "${wb}${bf}— Help! —${r}"
		echo "${wb}${bf}USAGE: rgif2vid some.gif nameOfVideos${r}"
		echo "-"
		return 1
	else
		ffmpeg -i "$1" "$2".mp4
		ffmpeg -i "$1" -c vp9 -b:v 0 -crf 41 "$2".webm
	fi
}
npmPubLint() {
	output=$(npx publint)
	if echo "$output" | grep -q "Errors"; then
		echo "publint reported errors:"
		echo "$output"
		echo "Stopping the script."
		return 1
	fi
}

# Release it.
rlz() {
	# npmPubLint
	# if [ $? -eq 0 ]; then
	# echo "publint reported no errors. Continuing with release."
	release-it --ci --config "$HOME/Dropbox/bin/.release-it.json" "$@"
	# else
	# 	echo "Error: Aborting release due to publint errors."
	# fi
}

# Release it.
rlzv() {
	release-it --ci --config "$HOME/Dropbox/bin/.release-it.json" "$@"
	# npx vsce publish
	# npx vsce@latest publish
	# New pacakge.
	npx @vscode/vsce publish
	npx ovsx publish -p "$OPENVSX_TOKEN"
}

# Templates
# https://github.com/fabiospampinato/template
ti() {
	template install "$@"
}

tc() {
	template create "$@"
}

checkOrInstallTemplate() {
	# Check if `template` is installed
	if ! command -v template &>/dev/null; then
		echo "Installing template..."
		npm install -g @fabiospampinato/template
	fi
}

echoY() {
	echo "\n${yf}❯ $1 ${r}\n"
}

echoR() {
	echo "\n${rf}❯ $1 ${r}\n"
}

echoG() {
	echo "\n${gf}❯ $1 ${r}\n"
}

echoDone() {
	echoG "✅ DONE: $1"
}

# Init node module.
# run with name
# $ inm <name>
inm() {
	clear

	if [[ -z "$1" ]]; then
		echoR "❌ name missing. Run as:"
		echoG "$ inm <name>"
		return 1
	fi

	checkOrInstallTemplate

	echoY "📟 INITIALIZING…"

	# Install first $ template install ahmadawais/template-nm nm
	template create nm "$1"
	cd "$1"

	echoY "📥 GIT REPOSITORY…"

	sh init.sh &>/dev/null
	git add . >/dev/null 2>&1
	git ci -m "📦 NEW: First commit" >/dev/null 2>&1
	git push >/dev/null 2>&1
	copy-github-labels -t "${GITHUB_TOKEN}" ahmadawais/create-guten-block "ahmadawais/$1" >/dev/null 2>&1
	github-label-remove -t "${GITHUB_TOKEN}" -r "ahmadawais/$1" -d >/dev/null 2>&1

	echoDone "https://github.com/ahmadawais/$1"
}

# Init node module CLI.
inmc() {
	clear

	echoY "📟 INITIALIZING…"

	template create nmc "$1"
	cd "$1"

	echoY "📥 GIT REPOSITORY…"

	git init &>/dev/null
	gh repo create --description "description" --homepage "https://twitter.com/MrAhmadAwais" --public --source=. &>/dev/null

	sh init.sh &>/dev/null
	git add . >/dev/null 2>&1
	git ci -m "📦 NEW: First commit" >/dev/null 2>&1
	git push >/dev/null 2>&1
	copy-github-labels -t "${GITHUB_TOKEN}" ahmadawais/create-guten-block "ahmadawais/$1" >/dev/null 2>&1
	github-label-remove -t "${GITHUB_TOKEN}" -r "ahmadawais/$1" -d >/dev/null 2>&1

	echoDone "https://github.com/ahmadawais/$1"

}

checkInstalRun() {
	local requirement=$1
	local install=$2

	# Check if `$1` is installed
	if ! command -v $requirement &>/dev/null; then
		echoR "$requirement not found"
		echoY "Running: $install"
		eval "$install"
		echoDone "installed: $requirement"
	fi
}

alias npmn="npmname"
npmname() {
	checkInstalRun "npm-name" "npm i npm-name-cli -g"
	npm-name "$@"
}

grename() {
	git mv -f "$1" "$2"
}

# Generate Change log.
clog() {
	auto-changelog --package --unreleased --output 'changelog.md' --commit-limit 'false' --template '/Users/ahmadawais/Dropbox/bin/changelog.hbs' --config '/Users/ahmadawais/Dropbox/bin/.auto-changelog'
	git add . && git commit -m ' 📖 DOC: Changelog' && git push
}

# Generate Change log without ads.
clogx() {
	auto-changelog --package --unreleased --output 'changelog.md' --commit-limit 'false' --template '/Users/ahmadawais/Dropbox/bin/changelogx.hbs' --config '/Users/ahmadawais/Dropbox/bin/.auto-changelog'
	git add . && git commit -m ' 📖 DOC: Changelog' && git push
}

# Profiling ZSH performance.
# zprof
# NorthStack START
PATH=/Users/ahmadawais/.local/bin:$PATH
# NorthStack END

fosslowercase() {
	git mv README.md readme.md >/dev/null 2>&1
	git mv ReadMe.md readme.md >/dev/null 2>&1
	git mv CHANGELOG.md changelog.md >/dev/null 2>&1
	git mv CODE-OF-CONDUCT.md code-of-conduct.md >/dev/null 2>&1
	git mv CODE_OF_CONDUCT.md code-of-conduct.md >/dev/null 2>&1
	git mv CONTRIBUTE.md contribute.md >/dev/null 2>&1
	git mv CONTRIBUTING.md contributing.md >/dev/null 2>&1
	git mv LICENSE.md license.md >/dev/null 2>&1
	git mv LICENSE license >/dev/null 2>&1
	gimp 'Lower-case names'
}

# Generates a file tree in an HTML file.
fileTreeToHTML() {
	tree -H '.' -L 1 --noreport --charset utf-8 -C >index.html
}

# Site download.
# siteDownload https://AhmadAwais.com/
# https://twitter.com/philhawksworth/status/1214942635300982785
siteDownload() {
	wget -H -E -k -p $*
}

# Remove a directory from git/github history and ignore it permanently.
grmd() {
	DIR_TO_BE_REMOVED="$1"
	git filter-branch --tree-filter "rm -rf $DIR_TO_BE_REMOVED" --prune-empty HEAD
	git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
	echo "$DIR_TO_BE_REMOVED"/ >>.gitignore
	git add .gitignore
	git commit -m "👌 IMPROVE: Removing "$DIR_TO_BE_REMOVED" from history"
	git gc
	git push origin master --force
}

# Upgrade Sendy.
sendyupgrade() {
	rm includes/config.php
	rm -rf uploads
	rm .htaccess
}

slug() {
	# slugify "$@" | ghead -c -1 | pbcopy # Needs coreutils https://stackoverflow.com/a/54351771/950111
	printf $(slugify "$@") | pbcopy
}

pdfr() {
	pdf-redact-tools --sanitize "$@"
}

colors() {
	msgcat --color=test
}

mic100() {
	osascript -e "set volume input volume 100"
}

printPATH() {
	echo -e ${PATH//:/\\n}
}

# n related.
# https://github.com/tj/n
export N_PRESERVE_NPM=1

# fzf theme.
# Base16 Atelier Plateau Light
_gen_fzf_default_opts() {

	local color00='#2D2B55'
	local color01='#1E1E3F'
	local color02='#A599E9'
	local color03='#A599E9'
	local color04='#A599E9'
	local color05='#A599E9'
	local color06='#fad000'
	local color07='#1b1818'
	local color08='#fad000'
	local color09='#b45a3c'
	local color0A='#B362FF'
	local color0B='#4b8b8b'
	local color0C='#fad000'
	local color0D='#7272ca'
	local color0E='#8464c4'
	local color0F='#bd5187'

	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS""\
 --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D""\
 --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C""\
 --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts

mans() { man $1 | less -p "^ +$2"; }

# Videos.

# Video cutting.
cut1min() {
	for i in *.mp4; do
		name=$(echo "$i" | cut -d'.' -f1)
		echo "$name"
		ffmpeg -ss 00:00:00.000 -i "$i" -t 60 -c:v libx264 -c:a copy "${name}-1min.mp4"
	done
}

# vidtrim <vid file name> <seconds to trim from start>
# vidtrim vid.mp4 5
vidtrim() {
	ffmpeg-bar -i "$1" -ss "$2" -vcodec copy -acodec copy trimmed-"$1"
}
# Cut video from start to end in seconds
# vidcut v.mp5 0 100
vidcut() {
	ffmpeg-bar -i "$1" -vcodec copy -acodec copy -ss "$2" -t "$3" cut-"$1"
}

# vidjoin <intro vid file name> <actual vid file name>
# vidjoin intro.mp4 input.mp4
vidjoin() {
	echo file "$1" >>vidjoin.txt
	echo file "$2" >>vidjoin.txt
	ffmpeg-bar -f concat -i vidjoin.txt -c copy output.mp4
	rm vidjoin.txt
}

# Open Chrome URL.
# https://superuser.com/a/422861/439227
url() {
	url=$([[ $1 =~ ^[a-zA-Z]{1,}: ]] && printf '%s\n' "$1" || printf '%s\n' "http://$1")
	open -a 'Google Chrome' "$url"
}

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

srt() {
	# for i in *.vtt ; do ffmpeg -i "$i" "$i.srt" ; done
	for i in *.vtt; do ffmpeg -i "$i" "${i%.*}.srt"; done
}

png2jpg() {
	mkdir JPG
	sips -s format jpeg *.png --out JPG
	sips -s format jpeg *.PNG --out JPG
}

tojpg() {
	mkdir JPG
	sips -s format jpeg *.* --out JPG
}

# https://iterm2.com/documentation-shell-integration.html
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# CoreaudioD restart
alias audiorestart="sudo killall -u _coreaudiod -SIGKILL"

# iTerm2 Colors
export CLICOLOR=1
export TERM=xterm-256color

# 3rd party aliases and installs.
eval "$(github-copilot-cli alias -- "$0")"

# Find files with a space followed by "2" at the end of the name (before the file extension)
# dups() {
#   # Initialize a counter for the number of duplicates found
#   duplicates_count=0

#   # Find files with a space followed by "2" at the end of the name (before the file extension)
#   duplicates=("${(@f)$(find . -type f -name '* 2.*')}")

#   # Loop through each file and check for duplicates
#   for file in "${duplicates[@]}"; do
#     original_file="${file/ 2./.}"
#     if [ -f "$original_file" ]; then
#       # Increment the counter
#       duplicates_count=$((duplicates_count + 1))

#       # Print the directory and file name of the duplicate
#       echo "Duplicate $duplicates_count: $file"

#       # Move the duplicate to the "duplicates" directory
#       parent_dir="$(dirname "$file")"
#       mkdir -p "${parent_dir}/duplicates"
#       mv "$file" "${parent_dir}/duplicates/"
#     fi
#   done

#   # Print the total number of duplicates found
#   echo "Total duplicates found: $duplicates_count"
# }

# del_dups() {
#   # Find all "duplicates" directories and store them in an array
#   duplicates_dirs=("${(@f)$(find . -type d -name 'duplicates')}")

#   # Check if any "duplicates" directories were found
#   if [[ ${#duplicates_dirs[@]} -gt 0 ]]; then
#     # Count the total number of "duplicates" directories
#     total_dirs=${#duplicates_dirs[@]}

#     # Initialize a counter for the number of directories deleted
#     deleted_dirs=0

#     # Loop through each "duplicates" directory and delete it
#     for dir in "${duplicates_dirs[@]}"; do
#       # Delete the directory
#       rm -rf "$dir"

#       # Increment the counter
#       deleted_dirs=$((deleted_dirs + 1))

#       # Display progress information
#       echo "Deleted $deleted_dirs/$total_dirs directories"
#     done
#   else
#     # Display a message if no "duplicates" directories were found
#     echo "No 'duplicates' directories found."
#   fi
# }

# list_dups() {
#   # Find directories named "duplicates" in the current directory and its subdirectories
#   duplicates_dirs=("${(@f)$(find . -type d -name 'duplicates')}")

#   # Check if any "duplicates" directories were found
#   if [[ ${#duplicates_dirs[@]} -gt 0 ]]; then
#     # Loop through each "duplicates" directory and list its contents
#     for dir in "${duplicates_dirs[@]}"; do
#       echo "Directory: $dir"
#       echo "Contents:"
#       ls -l "$dir"
#       echo
#     done
#   else
#     # Display a message if no "duplicates" directories were found
#     echo "No 'duplicates' directories found."
#   fi
# }

alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(reset) —— %C(bold blue)%an%C(reset): %C(white)%s%C(reset) %C(dim white)  %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"

alias nexttelx="npx next telemetry disable"
alias gsu="git branch --set-upstream-to=upstream/main main"

alias sb="supabase"

# Usage:
# ytcontent "https://www.youtube.com/watch?v=YOUR_VIDEO_ID"
ytcontentx() {
	# Check if a URL was provided
	if [ -z "$1" ]; then
		# If no URL was provided, print a help message and exit the function
		echo "Usage: ytcontent [YOUTUBE_URL]"
		echo "Description: Extracts and cleans auto-generated English subtitles from a YouTube video."
		echo "Example: ytcontent \"https://www.youtube.com/watch?v=YOUR_VIDEO_ID\""
		return
	fi

	# URL of the YouTube video
	YT_URL="$1"

	# Use yt-dlp to download the auto-generated English subtitles in .vtt format
	# The --skip-download flag ensures only subtitles are downloaded, not the video itself
	yt-dlp --skip-download --write-auto-sub --sub-lang en "$YT_URL"

	# Identify the downloaded .vtt file by listing all .en.vtt files and taking the first one
	VTT_FILE=$(ls *.en.vtt | head -1)

	# Use sed to process the .vtt file:
	# - Remove the 'WEBVTT' header
	# - Remove lines containing timestamps (i.e., lines with -->)
	# - Remove empty lines
	# - Remove HTML-like tags (common in .vtt files)
	# After processing, copy the content to the clipboard using pbcopy
	sed -e '/^WEBVTT/d' -e '/-->/d' -e '/^$/d' -e 's/<[^>]*>//g' "$VTT_FILE" | pbcopy

	# Print a message indicating the content has been copied to clipboard
	echo "Subtitles copied to clipboard!"
}

# Usage:
# ytcontent "https://www.youtube.com/watch?v=YOUR_VIDEO_ID"
ytcontent() {
	# Check if a URL was provided
	if [ -z "$1" ]; then
		# If no URL was provided, print a help message and exit the function
		echo "Usage: ytcontent [YOUTUBE_URL]"
		echo "Description: Extracts and cleans auto-generated English subtitles from a YouTube video."
		echo "Example: ytcontent \"https://www.youtube.com/watch?v=YOUR_VIDEO_ID\""
		return
	fi

	# URL of the YouTube video
	YT_URL="$1"

	# Use yt-dlp to download the auto-generated English subtitles in .vtt format
	yt-dlp --skip-download --write-auto-sub --sub-lang en "$YT_URL"

	# Identify the downloaded .vtt file by listing all .en.vtt files and taking the first one
	VTT_FILE=$(ls *.en.vtt | head -1)

	# Use sed and awk to process the .vtt file:
	# - Remove the 'WEBVTT' header
	# - Remove lines containing timestamps (i.e., lines with -->)
	# - Remove empty lines
	# - Remove HTML-like tags (common in .vtt files)
	# Using awk to remove lines that are repeated (even if they are one line away)
	# Finally, copy the unique content to the clipboard using pbcopy
	sed -e '/^WEBVTT/d' -e '/-->/d' -e '/^$/d' -e '/^[ \t]*$/d' -e 's/<[^>]*>//g' "$VTT_FILE" |
		awk 'NR==1{prev=$0; next} $0!=prev{print prev; prev=$0} END{print prev}' |
		awk 'NR<=2{lines[NR]=$0; next} {if (lines[1] != lines[2] && lines[1] != $0) print lines[1]; for(i=1; i<2; i++) lines[i] = lines[i+1]; lines[2] = $0} END{for(i=1; i<=2; i++) print lines[i]}' |
		pbcopy

	# Print a message indicating the content has been copied to clipboard
	echo "Subtitles copied to clipboard!"

	# Remove the downloaded files
	rm *.en.vtt
}

mkg() {
	mkd $@
	git init && gh repo create --private --source=. --remote=upstream && gbsu && gpl
}

alias heictojpg=htojpg
alias heic2jpg=htojpg
htojpg() {
	for file in *.{heic,HEIC}; do sips -s format jpeg "$file" --out "${file%.*}.jpg"; done
}

# Usage:
# Call this function directly in your terminal after navigating to your Git repository.
# It will automatically detect the current branch and perform the rebase.
rebase() {
	# Detect the current branch
	current_branch=$(git rev-parse --abbrev-ref HEAD)

	if [ "$current_branch" = "HEAD" ]; then
		echo "You are not on a branch (detached HEAD state). Please check out a branch to rebase."
		return 1
	fi

	echo "Current branch is $current_branch."

	# The main branch name
	MAIN_BRANCH="main"

	# Step 1: Update the main branch
	echo "Updating: $MAIN_BRANCH... git pull"
	git checkout $MAIN_BRANCH
	git pull origin $MAIN_BRANCH

	# Step 2: Check out the current branch
	echo "Switching back to $current_branch..."
	git checkout $current_branch

	# Step 3: Start the rebase
	echo "Starting rebase of $current_branch onto $MAIN_BRANCH..."
	git rebase $MAIN_BRANCH

	# Handle rebase conflicts
	while [ $? -ne 0 ]; do
		echo "Please resolve conflicts, then run 'git rebase --continue'."
		read -p "Press Enter to continue after resolving conflicts and running 'git rebase --continue'"

		# Try to continue the rebase
		git rebase --continue
	done

	# Step 5: Optionally force push the changes
	read -p "Do you want to force push the changes to the remote repository? [y/N] " choice
	case "$choice" in
	y | Y)
		echo "Force pushing $current_branch to remote repository..."
		git push origin $current_branch --force
		;;
	*) echo "Skipping force push." ;;
	esac

	# Step 6: Verify the rebase
	echo "Rebase complete. Here's the latest commit log:"
	git log --oneline -n 5
}
