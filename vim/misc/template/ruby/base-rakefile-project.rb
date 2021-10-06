# frozen_string_literal: true
# coding: utf-8

ProjectHome    = File.expand_path(File.dirname(__FILE__))
ProjectName    = File.basename(File.expand_path(File.dirname(__FILE__)))
DistinationDir = "#{ProjectHome}/target"
SourceDir      = "#{ProjectHome}/src"
LogDir         = "#{ProjectHome}/logs"


task :default => [:build]

desc "build #{ProjectName}"
task :build do
  sh "echo build"
end

desc "check working #{ProjectName}"
task :check do
  sh "echo check"
end

desc "create log and source directories"
task :dirs do
  sh %<mkdir -p #{SourceDir}/>, verbose: false
  sh %<mkdir -p #{LogDir}/>, verbose: false
end

desc "monitoring #{ProjectName} sources."
task watch: [:dirs] do
  Dir.chdir("#{SourceDir}") do
    sh %<reflex -v -g "#{SourceDir}/*.hoge" -- rake check filename={} | tee -a #{LogDir}/watch.log>
  end

end
