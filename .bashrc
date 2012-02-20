export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export GROOVY_HOME=/usr/loca/Celler/groovy/1.8.0

export MAVEN_OPTS='-Xmx1024m -XX:MaxPermSize=256m'

export PATH=/usr/local/bin:/usr/local/share/python:$PATH

export GREP_OPTIONS="--color=auto"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
