chef_root = File.absolute_path(File.dirname(__FILE__))

file_cache_path chef_root
cookbook_path File.join(chef_root, 'cookbooks')
