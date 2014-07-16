# mac-dev-box
I want to automate my Mac OS X Mavericks setup, because you never know when [it might crash](https://www.youtube.com/watch?v=x_ppg054OR0).

So I try my automation script in a Vagrant environment. I'm using just a simple shell provider for these reasons:

* learn how to automate some steps (like install a .dmg file)
* have a provision script that could be loaded from HTTP and executed on a real MBP.

## Shopping
To build a mac-dev-box on your MBP, you will need the following:

* MBP
* Packer 0.6.1
* Vagrant 1.6.3
* vagrant-vmware-fusion plugin, costs $79 / €59 - worth it
* VMware Fusion 6, 53,95 €

## The basebox
You have to build a OS X Mavericks basebox from [box-cutter/osx-vm](https://github.com/box-cutter/osx-vm).

I already had a prepared dmg file. Please read the box-cutter docs for details.
These were my steps to build the osx109 basebox.

```
git clone https://github.com/box-cutter/osx-vm
cd osx-vm
mkdir -p "iso/OS X Mavericks"
touch "iso/OS X Mavericks/Install OS X Mavericks.app"
mkdir -p dmg
cp /your/prepared/osx.dmg dmg/OSX_InstallESD_10.9_13A603.dmg
touch dmg/OSX_InstallESD_10.9_13A603.dmg
make vmware/osx109
vagrant box add osx109 box/vmware/osx109-nocm.box
```

## Xcode Developer Tools
You have to download the Xcode Command Line Tools manually, because the direct link responds only with HTTP 403 forbidden. So, download Xcode Command Line Tools from [Downloads for Apple Developers](http://developer.apple.com/downloads/) or use the `xcode-select --install` command.

These are my current steps to build the mac-dev-box with the pre-downloaded dmg file:

```
git clone https://github.com/StefanScherer/mac-dev-box
cd mac-dev-box
mkdir -p resources
cp /your/already/downloaded/commandline.dmg resources/command_line_tools_for_osx_mavericks_april_2014.dmg
vagrant up
```

## Time saver
To speed up the development of such a provision script, I have switched from the 
[vagrant-vbox-snapshot](https://github.com/dergachev/vagrant-vbox-snapshot) plugin to [vagrant-multiprovider-snap](https://github.com/scalefactory/vagrant-multiprovider-snap).

```
vagrant plugin uninstall vagrant-vbox-snapshot
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