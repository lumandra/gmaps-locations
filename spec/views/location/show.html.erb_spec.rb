require 'spec_helper'

RSpec.describe "location/show", type: :view do

  it "displays location details correctly" do
    assign(:location, Location.create(name: 'Test', area: "[[33.46496,-112.04003],[33.46382,-112.1008],[33.4293,-112.10063]]"))

    render

    rendered.should match('Test')
    rendered.should match('<div id="map" class="map"></div>')

  end
end
