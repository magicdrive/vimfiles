# rakefile

task default: [:tasks]

desc 'show this list.'
task :tasks do
  Process::wait(spawn('rake -T'))
end

desc 'setup vimfiles.'
task :install do
  Process::wait(spawn('./setup.sh'))
end

desc 'clean bundled vim plugins.'
task :dist_clean do
  Process::wait(spawn('rm -fr ./vim/bundle/*'))
end

desc 'clean install.'
task :clean_install => [:dist_clean, :install]
