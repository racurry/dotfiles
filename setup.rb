#!/usr/bin/env ruby

require 'fileutils'

DOTFILES = %w{.vimrc .zshrc .gitconfig .gitconfig_work .gitignore_global}

HOME_DIR = File.expand_path('~')
DOTFILES_DIR = Dir.pwd

puts "I'm doing up some dotfiles"
DOTFILES.each do |dotfile|
  home_dir_dotfile = "#{HOME_DIR}/#{dotfile}"
  local_dotfile = "#{Dir.pwd}/#{dotfile}"

  if File.exists?(home_dir_dotfile)|| File.symlink?(home_dir_dotfile)
    print "#{dotfile} already exists!  What should I do? (s=skip,r=replace,b=back up existing then replace): "
    response = gets.chomp

    case response
    when 's'
      puts "Skipping #{dotfile}"
    when 'r'
      print "Replacing #{dotfile}..."
      File.delete(home_dir_dotfile)
      File.symlink(local_dotfile, home_dir_dotfile)
      puts "Done!"
    when 'b'
      print "Backing up #{dotfile}..."
      File.rename(home_dir_dotfile, "#{home_dir_dotfile}.backup")
      puts "Done!"
      print "Linking #{dotfile}..."
      File.symlink(local_dotfile, home_dir_dotfile)
      puts "Done! The back up file is at #{home_dir_dotfile}.backup"
    else
      puts "That was gibberish, I am skipping"
    end
  else
    print "No existing #{dotfile}. Adding..."
    File.symlink(local_dotfile, home_dir_dotfile)
    puts "Done!"
  end
end

puts "Donezo"