require "spec_helper"

describe Irwi::Paginators::WillPaginate do

  let(:p) { Irwi::Paginators::WillPaginate.new }

  specify "should paginate collection" do
    coll = double "Collection"
    expect(coll).to receive(:paginate).with( :page => 15 ).and_return("paginated_collection")

    expect(p.paginate( coll, :page => 15 )).to eq("paginated_collection")
  end

  specify "should render paginated collection" do
    block = lambda { |x| 11 }
    coll = []
    view = double "View"
    expect(view).to receive(:paginated_section).with( coll, &block ).and_return("result")

    expect(p.paginated_section( view, coll, &block )).to eq("result")
  end

end
