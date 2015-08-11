# mac-dev-box

## Introduction
I want to automate my Mac OS X Yosemite setup, because you never know when [it might crash](https://www.youtube.com/watch?v=x_ppg054OR0).
After buying my MBP I have started a manual [logbook](https://github.com/StefanScherer/logbook/blob/master/Install-MacBookPro.md) what I have installed. But using Vagrant for a long time I know there must be a better way.

So I try my automation script in a Vagrant environment. I'm using just a simple shell provider for these reasons:

* learn how to automate some steps (like install a .dmg file)
* have a provision script that could be loaded from HTTP and executed on a real MBP.

## What others did
But before you ask, I also know [BOXEN](https://boxen.github.com):

    QUIT WORRYING ABOUT YOUR TOOLS.
    Automate the pain out of your development environment.
    Boxen installs your dependencies so you can focus on getting things done.

But they also have to do the Xcode Command Line Tool download in a [semi automated way](https://github.com/boxen/boxen-web/commit/b26abd0d681129eba0b5f46ed43110d873d8fdc2).

Another thing I have learned so far is [caskroom.io](https://github.com/caskroom/)

    "To install, drag this icon..." no more!

Here you find many more packages to install from command line.

## Shopping
To build a mac-dev-box on your MBP, you will need the following:

* [MacBook Pro](http://store.apple.com/de/buy-mac/macbook-pro) if you haven't one already
* [Packer 0.8.5](http://www.packer.io/downloads.html)
* [Vagrant 1.7.4](http://www.vagrantup.com/downloads.html)
* [VMware Fusion 7.1.2](http://www.vmware.com/de/products/fusion/), 54 €
* [vagrant-vmware-fusion](http://www.vagrantup.com/vmware#buy-now) plugin, 59 €

## The basebox
You have to build an OS X Yosemite basebox from [boxcutter/osx](https://github.com/boxcutter/osx).

You will need a downloaded `InstallESD.dmg` file with eg. OS X 10.10.4. Please read the [boxcutter docs](https://github.com/boxcutter/osx/blob/master/README-timsutton.md) for details.
These were my steps to build the osx1010-desktop basebox.

```
git clone https://github.com/boxcutter/osx
cd osx
mkdir -p "iso/OS X Yosemite"
cp ../InstallESD.dmg "iso/OS X Yosemite/InstallESD.dmg"
sed -i.bak -e 's/Install\\ OS\\ X\\ Yosemite\.app/InstallESD.dmg/' Makefile
make vmware/osx1010-desktop
vagrant box add osx1010-desktop box/vmware/osx1010-desktop-nocm-1.0.1.box
```

## Vagrant up

These are my current steps to build the mac-dev-box:

```
git clone https://github.com/StefanScherer/mac-dev-box
cd mac-dev-box
vagrant up --provider vmware_fusion
```

### Where is Retina?

The `Vagrantfile` sets an option to start the VM with Retina (HiDPI). The provision script `scripts/enable-hidpi.sh` enables HiDPI inside the VM. At the moment you have to logout and login again to make this change work. Then open the **System Preferences**, set the **display** to **"scaled"** using the HiDPI setting. Enjoy!

## Time saver
To speed up the development of such a provision script, I always use the [vagrant-multiprovider-snap](https://github.com/scalefactory/vagrant-multiprovider-snap) plugin.

```
vagrant plugin install vagrant-multiprovider-snap
```

So you build a clean machine with this and take a snapshot:

```
vagrant up --no-provision
vagrant snap take
```

Then you can do what you want with the box, manually or with vagrant provision scripts. After your provision script has improved enough, test it again with:

```
vagrant snap rollback
vagrant provision
```

# Licensing
Copyright (c) 2014 Stefan Scherer

MIT License, see LICENSE for more details.
