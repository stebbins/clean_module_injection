RSpec.describe ConnectionPoolPatch do
  let(:klass) { Class.new(ActiveRecord::Base) }

  before do
    allow(klass).to receive(:name).and_return('Example')
    db_config = YAML.load(File.open('./config/dj_database.yml'))[Rails.env]
    stub_const('DJ_DATABASE', db_config)
  end

  describe 'inclusion' do
    it 'provides a separate connection pool than ActiveRecord' do
      expect {
        klass.include(ConnectionPoolPatch)
      }.to change {
        klass.connection_pool == ActiveRecord::Base.connection_pool
      }.from(true).to(false)
    end
  end

  describe 'patched methods' do
    before { klass.include(ConnectionPoolPatch) }

    describe '.after_fork' do
      it 'maintains a separate connection pool' do
        expect(klass).to receive(:establish_connection).with(DJ_DATABASE)
        klass.after_fork
      end
    end
  end
end
