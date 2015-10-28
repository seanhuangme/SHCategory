Pod::Spec.new do |s|
  s.name              = "SHCategory"  #名字
  s.version           = "0.0.1"  #版本号
  s.summary           = "一些常用的Category." #简短的介绍
  s.homepage          = "https://github.com/seanhuangme/SHCategory"   #主页,这里要填写可以访问到的地址，不然验证不通过
  s.license           = "MIT"  #开源协议
  s.authors           = { "seanhuangme" => "917660908@qq.com" }  #作者信息
  s.social_media_url  = "http://weibo.com/seanhuangme"    #多媒体介绍地址
  s.platform          = :ios, "7.0"    #支持平台及版本
  s.source            = { :git => "https://github.com/seanhuangme/SHCategory.git", :tag => "v0.0.1" }    #项目地址，这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS,
  s.source_files      = "SHCategory" #需要被集成的代码文件夹
  s.requires_arc      = true   #项目是否使用 ARC

  s.dependency 'Masonry', '0.5.3'
  s.dependency 'HexColors', '2.2.1'
  s.dependency 'MBProgressHUD', '0.8'
  s.dependency 'MBProgressHUDExtensions', '0.0.1'
  s.dependency 'UIImage-ResizeMagick', '0.0.1'
end