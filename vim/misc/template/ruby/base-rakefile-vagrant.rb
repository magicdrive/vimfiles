# frozen_string_literal: true
# coding: utf-8

ProjectHome    = File.expand_path(File.dirname(__FILE__))
ProjectName    = "#{File.basename(File.expand_path(File.dirname(__FILE__)))}"
DistinationDir = "#{ProjectHome}/pkg"
VagrantFilePath    = "#{ProjectHome}/VagrantFile"
DockerFilePath     = "#{ProjectHome}/docker/DockerFile"


task :default => [:ssh]

desc " #{ProjectName}"
task :build do
  sh %<vagrant package -o "#{ProjectHome}/pkg/#{ProjectName}-$(date "+%Y-%m-%d")">
end

desc "vagrant up & vagrant ssh #{ProjectName}"
task :ssh do
  sh "vagrant up"
  sh "exec vagrant ssh"
end

desc "edit #{ProjectName} VagrantFile"
task :vagrantfile do
  sh "exec $EDITOR #{VagrantFilePath}"
end

desc "edit #{ProjectName} DockerFile"
task :dockerfile do
  sh "exec $EDITOR #{DockerFilePath}"
end

desc "reboot #{ProjectName}"
task :reboot => [:reload]

%w(reload halt destroy).each do |cmd|
  desc "vagrant #{cmd} #{ProjectName}"
  task :"#{cmd}" do
    sh "exec vagrant #{cmd}"
  end
end

