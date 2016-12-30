# Ruby China - RubyGems Mirror

[![Join the chat at https://gitter.im/ruby-china/rubygems-mirror](https://badges.gitter.im/ruby-china/rubygems-mirror.svg)](https://gitter.im/ruby-china/rubygems-mirror?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

https://gems.ruby-china.org [SSL 证书验证](https://www.ssllabs.com/ssltest/analyze.html?d=gems.ruby-china.org)

这是由 Ruby China 官方搭建的 RubyGems 镜像网站，此仓库是服务器源代码。

### 后端服务器列表

- http://us0.gems.ruby-china.org
- http://us1.gems.ruby-china.org
- http://sh0.gems.ruby-china.org

### 架构情况

```
                                          [gems.ruby-china.org]
                                                     |
                                     [sh0.gems.ruby-china.org <Shanghai>]
                                                     |
                                                  [Nginx]
                                                     |
                ---------------------------------------------------------------------------------------
                |                                    |                          |                     |
    {*.4.8, *.4.8.gz}                          {/gems, /quick}                 {/}                 {/api}
               |                                     |                          |                     |
  [gems-ruby-china.b0.upaiyun.com]      <gems-ruby-china.b0.upaiyun.com>    [app server]          [bundler-api]
                                                     |
                                                [UpYun CDN]
                                                     |
                                           ----------------------
                                           Found             Not Found
                                            |                   |
                                          [200]       [rubygems.global.ssl.fastly.net]
                                                                |
                                                              [200] ------------> [UpYun Mirror Store]

```


## IP 黑名单

> NOTE! 请珍惜社区资源，勿基于本镜像做二次镜像网站，我们会定期检查 CDN 请求量统计，单日请求量过大（流量超过 20G） 的 IP 将会被永久屏蔽。

以下是 CDN 统计出的疑似滥用 IP 列表，此名单已被屏蔽

| IP 地址         | 请求次数 | 流量 | 日期 |
| --------------- | ------ | --------- | --------- |
| 14.154.249.106  |        |           |           |
| 222.128.10.241  |        |           |           |
| 124.251.96.5    |        |           |           |
| 124.251.96.8    |        |           |           |
| 27.155.225.105  |        |           |           |
| 114.95.128.127  |        |           |           |
| 114.117.56.205  |        |           |           |
| 180.164.195.84  |        |           |           |
| 163.179.54.221  |        |           |           |
| 114.113.67.61   |        |           |           |
| 123.157.234.194 | 841123 | 180.938 GB | 2016-12-28 |
| 123.157.234.194 | 561740 | 11.935 GB | 2016-12-29 |
| 124.200.187.166 | 153940 | 42.507 GB | 2016-12-29 |
| 124.207.60.178  | 121781 | 36.881 GB | 2016-12-29 |
