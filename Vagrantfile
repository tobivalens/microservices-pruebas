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

  
  # -------------------------
  # TODOS API
  # -------------------------

  config.vm.define "todos-api" do |todos|
  todos.vm.hostname = "todos-api"

  todos.vm.network "private_network", ip: "192.168.56.22"

    todos.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

   todos.vm.provision "shell", path: "scripts/todos_setup.sh"
  end


  # -------------------------
  # redis 
  # -------------------------

  config.vm.define "redis" do |redis|
  redis.vm.hostname = "redis"

  redis.vm.network "private_network", ip: "192.168.56.23"

    redis.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

   redis.vm.provision "shell", path: "scripts/redis_setup.sh"
  end

  
  # -------------------------
  # Log message processor 
  # -------------------------


  config.vm.define "log-processor" do |log|
   log.vm.hostname = "log-processor"

    log.vm.network "private_network", ip: "192.168.56.24"

    log.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
    end

    log.vm.provision "shell", path: "scripts/log_setup.sh"
  end


  # -------------------------
  # Zipkin
  # -------------------------

  config.vm.define "zip" do |zip|
   zip.vm.hostname = "zip"

    zip.vm.network "private_network", ip: "192.168.56.25"

    zip.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    zip.vm.provision "shell", path: "scripts/zipkin_setup.sh"
  end



  # -------------------------
  # VM FRONTEND 2 (redundancia)
  # -------------------------

  config.vm.define "frontend2" do |frontend2|
   frontend2.vm.hostname = "frontend2"

    frontend2.vm.network "private_network", ip: "192.168.56.26"

    frontend2.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
    end

    frontend2.vm.provision "shell", path: "scripts/frontend_setup.sh"
  end


end