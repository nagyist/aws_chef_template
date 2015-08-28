#### 目的

EC2(Ubuntu)でよく使うものセット込みでインスタンスを立ち上げる用のレシピ

#### 制約

- Ubuntu
- ほか

#### 手順

- Chef-DKを導入
https://downloads.getchef.com/chef-dk/

```
sudo chef gem install knife-solo
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-bershelf
vagrant plugin install vagrant-aws
berks vendor cookbooks
vagrant up
```
