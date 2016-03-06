namespace :deploy do
  task :start do
    on roles(:app) do
      within current_path do
        execute :nohup, "bundle exec gemirro server --start 2>&1 &"
      end
    end
  end

  task :restart do
    on roles(:app) do
      within current_path do
        execute :bundle, "exec gemirro server --restart"
      end
    end
  end

  task :status do
    on roles(:app) do
      within current_path do
        execute :bundle, "exec gemirro server --status"
      end
    end
  end

  task :stop do
    on roles(:app) do
      within current_path do
        execute :bundle, "exec gemirro server --stop"
      end
    end
  end
end

after 'deploy:published', 'deploy:restart'
