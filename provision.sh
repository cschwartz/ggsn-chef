CHEF=/usr/local/bin/chef-solo

if ! test -f "$CHEF"; then
  export DEBIAN_FRONTEND=noninteractive
  sudo apt-get update
  sudo apt-get --force-yes -fuy -o Dpkg::Options::="--force-confnew" dist-upgrade
  sudo apt-get --force-yes -fuy install ruby1.9.1 ruby1.9.1-dev make libxml2-dev libxslt1-dev
  sudo gem1.9.1 install --no-rdoc --no-ri chef berkshelf
fi

if ! test -f "`which git`"; then
  sudo apt-get --force-yes -fuy install git
fi

export GIT_SSH="`pwd`/ssh_git"
if [ -d "ggsn-chef" ]; then
  cd ggsn-chef
  git pull
else
  git clone git://github.com/cschwartz/ggsn-chef.git
  cd ggsn-chef
fi
berks install --path cookbooks/
sudo $CHEF -c solo.rb -j node.json
