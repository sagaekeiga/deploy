worker_processes 2
working_directory "/home/anime/deploy_sample/current"

timeout 3600


listen "/var/run/unicorn/unicorn_deploy_sample.sock"
pid "/var/run/unicorn/unicorn_deploy_sample.pid"


stderr_path "/home/anime/deploy_sample/current/log/unicorn.log"
stdout_path "/home/anime/deploy_sample/current/log/unicorn.log"


preload_app true