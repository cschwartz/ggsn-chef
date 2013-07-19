CHEF=/usr/local/bin/chef-solo

if ! test -f "$CHEF"; then
  export DEBIAN_FRONTEND=noninteractive
  sudo apt-get update &
  apt-get --force-yes -fuy -o Dpkg::Options::="--force-confnew" dist-upgrade &
  apt-get install ruby1.9.1 ruby1.9.1-dev make libxml2-dev libxslt1-dev &
  gem1.9.1 install --no-rdoc --no-ri chef berkshelf
fi

berks install --path cookbooks/

sudo $CHEF -c solo.rb -j solo.json
