alias startmamp="sh /Applications/MAMP/bin/start.sh"
alias stopmamp="sh /Applications/MAMP/bin/stop.sh"
alias mamp="open http://127.0.0.1:8888/MAMP"
alias htdocs="cd \"/Users/xcorex/Documents/Documents/Projects/Web Projects/htdocs\""
alias projects="cd \"/Users/xcorex/Documents/Documents/Projects\""
alias httpnow="python -m SimpleHTTPServer"
alias ffdev="/Applications/Firefox3.6.app/Contents/MacOS/firefox-bin -P percobaan2"
alias ff="/Applications/Firefox.app/Contents/MacOS/firefox-bin -P default"
alias bob="php artisan bob::build"
alias inotebook=". my_new_env/bin/activate; ipython notebook --pylab inline"

alias pyenv="source ~/.virtualenvs/test1/bin/activate"

alias py32="defaults write com.apple.versioner.python Prefer-32-Bit -bool yes"
alias py64="defaults write com.apple.versioner.python Prefer-64-Bit -bool yes"

alias speedyon="curl --silent --user admin:admin \"http://192.168.2.1/userRpm/PPPoECfgRpm.htm?wan=0&wantype=2&acc=141130100083%40telkom.net&psw=telkom123&SecType=0&sta_ip=0.0.0.0&sta_mask=0.0.0.0&linktype=1&waittime=15&Connect=Connect\" > /dev/null"
alias speedyoff="curl --silent --user admin:admin \"http://192.168.2.1/userRpm/PPPoECfgRpm.htm?wan=0&wantype=2&acc=141130100083%40telkom.net&psw=telkom123&SecType=0&sta_ip=0.0.0.0&sta_mask=0.0.0.0&linktype=1&waittime=15&Disconnect=Disconnect\" > /dev/null; speedyugm"
alias speedyugm="curl --silent --user admin:admin \"http://192.168.2.1/userRpm/WanStaticIpCfgRpm.htm?wan=0&wantype=1&ip=192.168.1.100&mask=255.255.255.0&gateway=192.168.1.1&mtu=1500&dnsserver=192.168.1.1&dnsserver2=8.8.8.8&Save=Save\" > /dev/null"

##
# Your previous /Users/xcorex/.bash_profile file was backed up as /Users/xcorex/.bash_profile.macports-saved_2012-04-25_at_12:06:40
##

# MacPorts Installer addition on 2012-04-25_at_12:06:40: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias mantweet="tweet -exts=/usr/local/bin/ttytter-r2a.pl -ssl -dostream"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
stty -ixon
