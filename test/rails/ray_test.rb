require "test_helper"

class Rails::RayTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Rails::Ray::VERSION
  end

  test "includes ray" do
    assert respond_to?(:ray)
  end
end
