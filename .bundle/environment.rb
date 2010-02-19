require 'digest/sha1'

# DO NOT MODIFY THIS FILE
module Bundler
  FINGERPRINT = "b487f2796325fa0793d27b2d67ffc9026fa2ac5b"
  LOAD_PATHS = ["/Library/Ruby/Gems/1.8/gems/activesupport-2.3.5/lib", "/Library/Ruby/Gems/1.8/gems/test-rig-0.0.3/lib", "/Library/Ruby/Gems/1.8/gems/shoulda-2.10.3/lib"]
  AUTOREQUIRES = {:test=>["test_rig", "shoulda"], :default=>["activesupport"]}

  def self.match_fingerprint
    print = Digest::SHA1.hexdigest(File.read(File.expand_path('../../Gemfile', __FILE__)))
    unless print == FINGERPRINT
      abort 'Gemfile changed since you last locked. Please `bundle lock` to relock.'
    end
  end

  def self.setup(*groups)
    match_fingerprint
    LOAD_PATHS.each { |path| $LOAD_PATH.unshift path }
  end

  def self.require(*groups)
    groups = [:default] if groups.empty?
    groups.each do |group|
      (AUTOREQUIRES[group] || []).each { |file| Kernel.require file }
    end
  end

  # Setup bundle when it's required.
  setup
end
