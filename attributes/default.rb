default[:mesos] = {
  :version => "0.14.2",
  :cluster_name => "MyCluster",
  :master_ips => [],
  :slave_ips  => [],
  :master  => {
    :log_dir  => "/var/log/mesos"
  },
  :slave   => {
    :log_dir  => "/var/log/mesos",
    :work_dir => "/var/run/mesos",
    :isolation=> "cgroups"
  },
  :ssh_opts => "-o StrictHostKeyChecking=no -o ConnectTimeout=2",
  :deploy_with_sudo => "1",
  :deploy_dir => "/var/mesos/deploy",
}
