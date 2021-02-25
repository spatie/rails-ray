require "test_helper"

class Rails::RayTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Rails::Ray::VERSION
  end

  test "it includes Ray" do
    assert defined?(::Ray)
  end
end
