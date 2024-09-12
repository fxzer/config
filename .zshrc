
# ====== 别名 ======
alias ff='fastfetch'
alias ls='lsd -X'
alias ll='lsd -lhX'
alias la='lsd -alhX'
alias vi='vim'   
alias cl='clear'
alias rg='ranger'
alias cf='c $(fzf --height 40% --reverse)'
alias vf='fzf --height 40% --reverse --bind "enter:become(vim {})"'

alias bl='brew ls'
alias bi='brew install'
alias bu='brew uninstall'
alias sz='source ~/.zshrc'

# ====== FE ======
alias g='git'
alias c='code'
alias o='open'
alias d='nr dev'
alias b='nr build'
alias t='nr test'
alias l='nr lint'
alias f='nr lintf'

# cd
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ..l.='cd ../../ && ll'
alias cdtmp='cd `mktemp -d /tmp/fxzer-XXXXXX`'

alias czsh='c ~/.zshrc'
alias cgit='c ~/.gitconfig'
alias chost="c /etc/hosts"
alias cssh="c ~/.ssh/config"
alias rm="rimraf"

alias cnadd="pnpm dlx shadcn-ui@latest add "

alias cip="curl cip.cc"
alias ip="ipconfig getifaddr en0 && ipconfig getifaddr en1"

alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'
alias dis='docker images'

# Git

alias gs='g status'
alias gcz='g cz'
alias gcze='g cz -e'
alias gss='g status -sb' # 简洁状态 显示分支
alias ga='g add .'
alias gam='g commit -am' # 添加所有文件并提交
alias gcm='g commit -m'
alias gm='g merge' 
alias gmc='g merge --continue' 
alias grc='g rebase --continue'
alias gst='g stash' # 暂存
alias gps='g push'
alias gpsf='git push --force-with-lease'
alias gpl='g pull'
alias gc='g clone'
alias gc1='g clone --depth=1'
alias gcr='g clone --recursive'
alias gco='g checkout'
alias gbr='g branch'
alias gconf='g config --global -e'
alias gdrb='g push origin --delete' # 删除远程分支
alias grv='g remote -v' # 查看所关联的远程仓库
alias gra='g remote add'  # 关联远程仓库 例如：upstream 需要写远程源
alias grs='g remote set-url --add origin'  # 给 origin 添加新的远程仓库地址 比如 gitee
alias gcam='g commit --amend' # --message='new commit' 修改最后一次提交信息
alias gcan='g commit --amend --no-edit' # 当前提交合并到上次提交
alias grbc='g rebase --continue' # 当前提交合并到上次提交
alias grba='g rebase --abort ' # 当前提交合并到上次提交
alias gls="g log -3 HEAD --pretty=format:'hash: %C(yellow)%h %n主题: %C(bold Magenta)%s %n日期: %C(black)%cd%Cgreen(%cr) %n作者: %C(bold blue)%an %n' --date=format:'%Y-%m-%d %H:%M:%S'" # 查看最后3次提交
alias	glp="g log -n 10 --graph --pretty=format:'hash: %C(yellow)%h %n主题: %C(bold Magenta)%s %n日期: %C(black)%cd%Cgreen(%cr) %n作者: %C(bold blue)%an %n' --date=format:'%Y-%m-%d %H:%M:%S'"  # 查看最近10次提交
alias	gll="g log --color --graph --pretty=format:'%C(yellow)%h%Creset %C(black)[%cd]%Cgreen(%cr)%C(bold blue)<%an>%Creset -%C(cyan)%d%Creset %s' --date=format:'%Y-%m-%d %H:%M:%S'"  # 查看所有提交历史


#fnm 
eval "$(fnm env --use-on-cd)"
export PATH="${HOME}/Library/Caches/fnm_multishells/28984_1714029646151/bin":$PATH
export FNM_RESOLVE_ENGINES="false"
export FNM_ARCH="arm64"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_DIR="${HOME}/Library/Application Support/fnm"
export FNM_MULTISHELL_PATH="${HOME}/Library/Caches/fnm_multishells/28984_1714029646151"
export FNM_LOGLEVEL="info"
export FNM_COREPACK_ENABLED="false"

# pnpm
export PNPM_HOME="/Users/fxzer/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



# starship
eval "$(starship init zsh)"
# 判断如果是自带的terminal则不应用 starship 主题
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(starship init zsh)"
fi



# ====== P10K ======
# source ~/c/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ====== FZF ======
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ====== 自定义环境变量 ======
# source ~/.zshrc_private.zsh


# ====== 自定义 函数 ======

# 从 git 仓库中下载指定文件或文件夹
function gcs() {
  repository=$1
  file_or_directory_path=$2

  # 克隆仓库，但不检出文件
  git clone --no-checkout $repository temp_repo

  # 进入仓库目录
  cd temp_repo

  # 初始化 sparse-checkout
  git sparse-checkout init

  # 设置你想要的文件或文件夹
  git sparse-checkout set $file_or_directory_path

  # 检出文件
  git checkout
}


# 创建并进入目录
function mkcd() {
  mkdir -p "$@" && cd "$@"
}


# 快速导航到指定目录
function cdl() {
  cd $1  # 进入指定目录目录下
  ll                 # 列出文件
}

# 一键提交代码
function gpush() {
  git add .
  git commit -m "$1"
  git push
}

# 快速克隆并进入项目
function gccd() {
  git clone $1
  folder=$(basename "$1" .git)
  cd "$folder"
}

# macOS 下的 Homebrew 快速更新和清理
function brewup() {
  brew update && brew upgrade && brew cleanup
}
