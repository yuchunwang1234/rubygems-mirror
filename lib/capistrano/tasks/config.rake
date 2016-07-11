etc_files = %w(etc/nginx/nginx.conf etc/nginx/conf.d/rubygems.conf etc/nginx/conf.d/rubyconf.conf etc/nginx/conf.d/test)

namespace :config do
  task :install do
    on roles(:app) do
      etc_files.each do |fname|
        sudo :ln, "-sf #{current_path}/#{fname} /#{fname}"
      end
    end
  end
end

namespace :nginx do
  task :reload do
    on roles(:app) do
      sudo "/etc/init.d/nginx reload"
    end
  end
end


after 'deploy:symlink:linked_files', 'config:install'
after 'deploy:published', 'nginx:reload'
