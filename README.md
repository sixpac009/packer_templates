# packer_templates

Packer templates for building vagrant box localy for parallels and
with Hashicorp Atlas for virtualbox, and vmware. (The base of these
templates came from boxcutter I modified and added parallels build)

NOTE: Maybe you prefer official Ubuntu and CentOS vagrant boxes
===============================================================

There are now official Ubuntu and CentOS vagrant boxes at `Vagrant Cloud <https://atlas.hashicorp.com/boxes/search?utm_source=vagrantcloud.com&vagrantcloud=1>`_. These boxes are regularly updated to have newer packages.
If you don't need to build a customized box, maybe you can use those boxes instead of building boxes yourself using Packer and templates in this repository.

* `ubuntu/trusty64 <https://atlas.hashicorp.com/ubuntu/boxes/trusty64>`_
* `ubuntu/trusty32 <https://atlas.hashicorp.com/ubuntu/boxes/trusty32>`_
* `centos/7 <https://atlas.hashicorp.com/centos/boxes/7>`_

For example, you can use Vagrantfile like below to use official CentOS 7 box.

::

    Vagrant.configure(2) do |config|
      config.vm.box = "centos/7"
    end

Usage
=====

Installing Packer
-----------------

Download the latest packer from http://www.packer.io/downloads.html and unzip the appropriate directory.

Running Packer
--------------

::

    $ git clone https://github.com/sixpac009/packer_templates
    $ cd packer_templates
    $ packer build template.json

If you want to build only for parallel.

::

    $ packer build -parallel=true template.json
