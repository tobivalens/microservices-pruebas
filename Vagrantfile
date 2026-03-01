Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  # -------------------------
  # HAPROXY
  # -------------------------
  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.network "private_network", ip: "192.168.56.10"
    haproxy.vm.network "forwarded_port", guest: 80, host: 8080

    haproxy.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    haproxy.vm.provision "shell", path: "scripts/haproxy_setup.sh"
  end

  # -------------------------
  # FRONTEND
  # -------------------------
  config.vm.define "frontend" do |frontend|
    frontend.vm.hostname = "frontend"
    frontend.vm.network "private_network", ip: "192.168.56.11"

    frontend.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    frontend.vm.provision "shell", path: "scripts/frontend_setup.sh"
  end


  # -------------------------
  # AUTH API
  # -------------------------
  config.vm.define "auth-api" do |auth|
    auth.vm.hostname = "auth-api"
    auth.vm.network "private_network", ip: "192.168.56.20"

    auth.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    auth.vm.provision "shell", path: "scripts/auth_setup.sh"
  end

  # -------------------------
  # USERS API
  # -------------------------

  config.vm.define "users-api" do |users|
  users.vm.hostname = "users-api"

  users.vm.network "private_network", ip: "192.168.56.21"

    users.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

   users.vm.provision "shell", path: "scripts/users_setup.sh"
  end

end