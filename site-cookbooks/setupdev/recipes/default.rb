#
# Cookbook Name:: setupdev
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# いろんなパッケージを導入する
%w(git libssl-dev libyaml-dev libxslt-dev libxml2-dev nodejs imagemagick libmagickwand-dev gcc build-essential).each do |pkg|
  package pkg do
    action :install
  end
end
