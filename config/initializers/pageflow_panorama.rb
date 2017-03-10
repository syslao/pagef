Pageflow::Panorama.configure do |config|
  config.providers = [{
    name: "palmsfilm.com",
    base_path: "/panorama",
    url: "http://palmsfilm.com/"
  },{
    name: "panogate.de",
    base_path: "/panogate",
    url: "http://www.panogate.de/"
  }]

  config.packages_base_path = "/bucket"
end
