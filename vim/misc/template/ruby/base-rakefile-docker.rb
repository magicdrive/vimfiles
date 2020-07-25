# coding: utf-8

ProjectHome     = File.expand_path(File.dirname(__FILE__))
ProjectRepoName = File.basename(File.expand_path(File.dirname(__FILE__)))
ProjectName     = File.basename(ProjectHome)


#task :default => []

desc "up container #{ProjectName}"
task :"up" do
  sh <<-SHELL
  sudo docker start \
      "#{ProjectRepoName}-#{ProjectName}"
  SHELL
end

desc "down container #{ProjectName}"
task :"down" do
  sh <<-SHELL
  sudo docker stop \
      "#{ProjectRepoName}-#{ProjectName}"
  SHELL
end

desc "config --restart=always #{ProjectName}"
task :"service:on" do
  sh <<-SHELL
    sudo docker update --restart=always \
      "#{ProjectRepoName}-#{ProjectName}"
  SHELL
end

desc "config --restart=no #{ProjectName}"
task :"service:off" do
  sh <<-SHELL
    sudo docker update --restart=no \
      "#{ProjectRepoName}-#{ProjectName}"
  SHELL
end

desc "create image #{ProjectName}"
task :"create-image" do
  sh <<-SHELL
  sudo docker build \
      --tag "#{ProjectRepoName}:#{ProjectName}" \
      "#{ProjectHome}"
  SHELL
end

desc "create container #{ProjectName}"
task :"create-container" do
  sh <<-SHELL
  sudo docker run \
      --name "#{ProjectRepoName}-#{ProjectName}"
      --detach "#{ProjectRepoName}:#{ProjectName}"
  SHELL
end

desc "login on #{ProjectName} container"
task :"login" do
  sh <<-SHELL
  exec sudo docker exec \
      --interactive \
      --tty "#{ProjectRepoName}-#{ProjectName}" \
      /bin/bash
  SHELL
end

