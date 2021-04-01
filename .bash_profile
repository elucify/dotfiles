
ncbi() {
   ssh -CYX -L 5901:ncbimac1056.ncbi.nlm.nih.gov:5920 -L 3389:${1:-mslogin01}.ncbi.nlm.nih.gov:3389 -L 3128:webproxy.ncbi.nlm.nih.gov:3128 -l mjohnson -c blowfish -p 22 ssh.ncbi.nlm.nih.gov
}

use() {
   source ~/Projects/django/$1/bin/activate
}

alias pd=pushd
alias pp=popd
alias l="ls -CFa"
alias h=history
alias kids="jobs -l"
alias rocaml="rlwrap ocaml"
alias open="xdg-open"

export PATH=/usr/local/bin:/usr/local/git/bin:/usr/local/google_appengine:/usr/local/share/python:/bin:/sbin:/usr/X11/bin:/usr/bin:/usr/sbin:/usr/local/Library/ENV/4.3:/usr/local/pdfjam/bin:/snap/bin:.


#
# Mac only
#
if [ "$(uname)" == "Darwin" ] ; then
   alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/System/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH


# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH
fi

alias e="emacs -nw"

#
# ubuntu
#
alias defeat_agc="while sleep 0.25; do pacmd set-source-volume alsa_input.usb-AKM_AK5370-00.mono-fallback 90000; done"
