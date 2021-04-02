# frozen_string_literal: true

RSpec.describe Dude::Commands::Start do
  subject { described_class.new }

  let(:move) { instance_double('Dude::Commands::Move', call: true) }
  let(:checkout) { instance_double('Dude::Commands::Checkout', call: true) }
  let(:track) { instance_double('Dude::Commands::Track', call: true) }

  before do
    allow(subject).to receive(:settings).and_return({ 'IN_PROGRESS_LIST_NAME' => 'list_name' })
    allow(Dude::Commands::Move).to receive(:new).and_return(move)
    allow(Dude::Commands::Checkout).to receive(:new).and_return(checkout)
    allow(Dude::Commands::Track).to receive(:new).and_return(track)
  end

  it 'calls Commands::Move with correct arguments' do
    expect(move).to receive(:call).with(id: 'DMD-123', list: 'list_name')
    subject.call(id: 'DMD-123')
  end

  it 'calls Commands::Checkout with correct arguments' do
    expect(checkout).to receive(:call).with(id: 'DMD-123')
    subject.call(id: 'DMD-123')
  end

  it 'calls Commands::Track with correct arguments' do
    expect(track).to receive(:call).with(id: 'DMD-123')
    subject.call(id: 'DMD-123')
  end
end
