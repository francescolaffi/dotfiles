include_recipe "pivotal_workstation::git"
include_recipe "pivotal_workstation::workspace_directory"

brew "zsh" do
	options "--disable-etcdir"
end

execute "echo '/opt/local/bin/zsh' >> /etc/shells" do
  not_if "grep -xq /opt/local/bin/zsh /etc/shells"
end

execute "chsh -s /opt/local/bin/zsh"

git "#{WS_HOME}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  user WS_USER
end

execute "cp #{WS_HOME}/.oh-my-zsh/templates/zshrc.zsh-template #{WS_HOME}/.zshrc" do
  user WS_USER
  creates "#{WS_HOME}/.zshrc"
end

git "#{WS_HOME}/#{node['workspace_directory']}/oh-my-zsh-powerline-theme" do
  repository "https://github.com/francescolaffi/oh-my-zsh-powerline-theme.git"
  user WS_USER
end

link "#{WS_HOME}/.oh-my-zsh/themes/powerline.zsh-theme" do
  to "#{WS_HOME}/#{node['workspace_directory']}/oh-my-zsh-powerline-theme/powerline.zsh-theme"
  owner WS_USER
end