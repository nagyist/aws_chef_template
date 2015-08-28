# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dummy"

  # install newest version of chef client
  config.omnibus.chef_version = :latest

  # manage community recipe by berkshelf
  config.berkshelf.enabled = false

  config.vm.provider :aws do |aws, override|
    # defined in .envrc / Require direnv / bew install direnv
    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    aws.keypair_name = ENV["AWS_KEY_PAIR_NAME"]
    aws.instance_type = "t2.micro"
    aws.region = "ap-northeast-1"
    aws.availability_zone = "ap-northeast-1c"
    aws.security_groups =ENV["AWS_SECURITY_GROUPS"].split(',')
    aws.elastic_ip = ENV["AWS_ELASTIC_IP"]
    aws.ami = "ami-936d9d93" # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
    override.ssh.username = ENV["AWS_USER_NAME"]
    override.ssh.private_key_path = ENV["AWS_IDENTITY_FILE_PATH"]
  end

  config.vm.provision "chef_solo" do |chef|
  chef.roles_path = "./roles"
  chef.cookbooks_path = ["./cookbooks", "./site-cookbooks" ]
  chef.add_role "dev"
end
end
