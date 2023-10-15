namespace :bootsnap do
  desc "Clear the Bootsnap cache"
  task :clear_cache => :environment do
    require 'fileutils'

    # => `**` globs to any directory and `*` globs any file...
    bootsnap_cached_files = Dir.glob(File.join(Rails.root, 'tmp', 'cache', 'bootsnap', '**', '**', '*'))

    puts "Clearing bootsnap cache..."
    bootsnap_cached_files.each do |file|
      FileUtils.rm_rf file
    end

    puts "Bootsnap cache cleared."
  end
end
