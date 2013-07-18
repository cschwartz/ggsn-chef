CHEF=/var/lib/gems/1.9.1/bin/chef-solo

if ! test -f "$CHEF"; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get --force-yes -fuy -o Dpkg::Options::="--force-confnew" dist-upgrade
  apt-get install ruby1.9.1 ruby1.9.1-dev make
  sudo gem1.9.1 install --no-rdoc --no-ri chef
fi

$CHEF -c solo.rb -j solo.json
