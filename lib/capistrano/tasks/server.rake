namespace :server do
  task :start do
    on "app" do
      execute :bundle, "exec gemirro server --start 2>&1 &"
    end
  end

  task :restart do
    on "app" do
      execute :bundle, "exec gemirro server --restart"
    end
  end

  task :status do
    on "app" do
      execute :bundle, "exec gemirro server --status"
    end
  end

  task :stop do
    on "app" do
      execute :bundle, "exec gemirro server --stop"
    end
  end
end
