include_recipe "pivotal_workstation::git"
include_recipe "pivotal_workstation::workspace_directory"

brew "zsh" do
	options "--disable-etcdir"
end

execute "echo $(brew --prefix)/bin/zsh >> /etc/shells" do
  not_if "grep -xq $(brew --prefix)/bin/zsh /etc/shells"
end

execute "chsh -s $(brew --prefix)/bin/zsh" do
  user node['current_user']
end

git "#{WS_HOME}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  user node['current_user']
end

execute "cp #{WS_HOME}/.oh-my-zsh/templates/zshrc.zsh-template #{WS_HOME}/.zshrc" do
  user node['current_user']
  creates "#{WS_HOME}/.zshrc"
end

git "#{WS_HOME}/#{node['workspace_directory']}/oh-my-zsh-powerline-theme" do
  repository "https://github.com/francescolaffi/oh-my-zsh-powerline-theme.git"
  user node['current_user']
end

link "#{WS_HOME}/.oh-my-zsh/themes/powerline.zsh-theme" do
  to "#{WS_HOME}/#{node['workspace_directory']}/oh-my-zsh-powerline-theme/powerline.zsh-theme"
  owner node['current_user']
end