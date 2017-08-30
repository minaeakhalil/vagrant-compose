# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

boxes = YAML.load_file('vagrant-compose.yml')['boxes']

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  boxes.each do |name, configs|
    config.vm.define name do |box|
      box.vm.box = configs['image']

      if !configs['ports'].nil?
        configs['ports'].each do |port|
          host, guest, host_ip = port.split(':')

          if !host_ip.nil?
            box.vm.network "forwarded_port",
              guest: guest,
              host: host,
              host_ip: host_ip
          else
            box.vm.network "forwarded_port",
              guest: guest,
              host: host
          end
        end
      end

      if !configs['synced_folder'].nil?
        configs['synced_folder'].each do |description, folder|
          box.vm.synced_folder folder['host'],
            folder['guest'],
            owner: folder['owner'],
            group: folder['group'],
            mount_options: ["#{folder['mount_options']}"]
        end
      end

      if !configs['provision'].nil?
        configs['provision'].each do |name, provision|
          provision.each do |script_privilege|
            script, privileged = script_privilege.split(':')

            if privileged.nil?
              privileged = false
            end

            box.vm.provision "shell",
              keep_color: true,
              name: name,
              path: script,
              privileged: privileged
          end
        end
      end
    end
  end
end
