describe '.descr' do
  let(:ss) { SummaryTools.descr([1, 2, 3, 4, 5]) }

  it 'computes the correct mean of the simple array = [1, 2, 3, 4, 5]' do
    expect(ss[:mean]).to eq(3.0)
  end

  it 'computes the correct standard deviation of the simple array = [1, 2, 3, 4, 5]' do 
    expect(ss[:stddev]).to eq(1.4142135623730951)
  end

  it 'computes the correct min of the simple array = [1, 2, 3, 4, 5]' do
    expect(ss[:min]).to eq(1)
  end
  
  it 'computes the correct max of the simple array = [1, 2, 3, 4, 5]' do
    expect(ss[:max]).to eq(5)
  end

  it 'computes the correct median of the simple array = [1, 2, 3, 4, 5]' do
    expect(ss[:median]).to eq(3)
  end

end
