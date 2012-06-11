#[ -n "$PS1" ] && source ~/.bash_profile

if [ `uname -n` = ssm-webdev.nrcan.gc.ca -o `uname -n` = ssm-webint.nrcan.gc.ca ]; then
   if [ -f /etc/bashrc ]; then
      . /etc/bashrc
   fi
fi
				
