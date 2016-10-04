require 'station'

describe Station do
  subject (:station) {Station.new("Camden", 2)}

it "expects station to have name " do
  expect(station.name).to eq("Camden")
end

it "expects station to have zone " do
  expect(station.zone).to eq(2)
end

end
