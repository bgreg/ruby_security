describe 'Cve' do

  before do
  end

  after do
  end

  it 'should create instance' do
    Cve.create.is_a?(Cve).should == true
  end
end
