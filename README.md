# Ruby China - RubyGems Mirror

[![Join the chat at https://gitter.im/ruby-china/rubygems-mirror](https://badges.gitter.im/ruby-china/rubygems-mirror.svg)](https://gitter.im/ruby-china/rubygems-mirror?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

http://gems.ruby-china.org

这是由 Ruby China 官方搭建的 RubyGems 镜像网站，此仓库是服务器源代码。

### 后端服务器

- tokyo.gems.ruby-china.org


### 架构情况

```
                                  [gems.ruby-china.org]
                                           |
                          [CDN 1] [CDN 2] [CDN 3] ... [CDN N]
                                           |
                         [us0.gems.ruby-china.org]  ... us1 .. us2
                                           |
                                        [Nginx]
                                           |
                --------------------------------------------------
                |                           |                    |
    {/gems, /quick, *.4.8, *.4.8.gz}       {/}                 {/api}
               |                            |                     |
  [rubygems.global.ssl.fastly.net]      [app server]         [rubygems.org]

```
