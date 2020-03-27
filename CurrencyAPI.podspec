
Pod::Spec.new do |spec|


  spec.name         = "CurrencyAPI"
  spec.version      = "1.0.0"
  spec.summary      = "A pod to get exchange rates"
  spec.description  = "A pod that uses api.exchangerate-api v4 to get the international exchange rate information. Note: The pod uses v4 which only updates once a day"

  spec.homepage     = "https://mydaytodo.com/blog"

  spec.license      = "MIT"


  spec.author             = { "Bhuman Soni" => "bhuman.soni@gmail.com" }
  spec.social_media_url   = "https://twitter.com/BhumanSoni"

  # spec.platform     = :ios
  # spec.platform     = :ios, "12.0"

  spec.source       = { :git => ".", :tag => "#{spec.version}" }

  spec.source_files  = "CurrencyAPI"
  spec.exclude_files = "Classes/Exclude"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
  spec.swift_version = "5.0"
end
