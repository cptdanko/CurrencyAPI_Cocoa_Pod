
Pod::Spec.new do |spec|


  spec.name         = "CurrencyAPI"
  spec.version      = "1.0.0"
  spec.summary      = "A pod to get exchange rates"
  spec.description  = "A pod that uses api.exchangerate-api v4 to get the international exchange rate information. Note: The pod uses v4 which only updates once a day"

  spec.homepage     = "https://mydaytodo.com/blog"
  spec.license      = "MIT"
  spec.author             = { "Bhuman Soni" => "bhuman.soni@gmail.com" }
  spec.social_media_url   = "https://twitter.com/BhumanSoni"

  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/cptdanko/CurrencyAPI.git", :tag => "#{spec.version}" }
  spec.source_files  = "CurrencyAPI"
  spec.swift_version = "5.0"
end
