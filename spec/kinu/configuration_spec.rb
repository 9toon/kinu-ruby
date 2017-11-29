require 'spec_helper'

module Kinu
  RSpec.describe Configuration do
    let(:config) { Configuration.new }

    describe '#host' do
      context 'when no configuration' do
        it 'returns nil' do
          expect(config.host).to be_nil
        end
      end

      context 'when set hostname' do
        let(:hostname) { 'example.com' }

        before do
          config.host = hostname
        end

        it 'returns same hostname' do
          expect(config.host).to eq(hostname)
        end
      end
    end

    describe '#upload_host' do
      context 'when no configuration' do
        it 'returns nil' do
          expect(config.upload_host).to be_nil
        end
      end

      context 'when set host' do
        let(:hostname) { 'example.com' }

        before do
          config.host = hostname
        end

        it 'returns nil' do
          expect(config.upload_host).to be_nil
        end
      end

      context 'when set host and upload_host' do
        let(:hostname) { 'example.com' }
        let(:upload_hostname) { 'upload.example.com' }

        before do
          config.host = hostname
          config.upload_host = upload_hostname
        end

        it 'returns upload hostname' do
          expect(config.upload_host).to eq(upload_hostname)
          expect(config.upload_host).to_not eq(hostname)
        end
      end
    end

    describe '#port' do
      context 'when no configuration' do
        it 'returns 80' do
          expect(config.port).to eq(80)
        end
      end

      context 'when set ssl' do
        before do
          config.ssl = true
        end

        it 'returns 443' do
          expect(config.port).to eq(443)
        end
      end

      context 'when set port' do
        let(:port) { 3000 }
        before do
          config.port = port
        end

        it 'returns same port' do
          expect(config.port).to eq(port)
        end
      end
    end

    describe '#ssl?' do
      context 'when no configuration' do
        it 'returns false' do
          expect(config.ssl?).to be_falsy
        end
      end

      context 'when set true' do
        before do
          config.ssl = true
        end

        it 'returns true' do
          expect(config.ssl?).to be_truthy
        end
      end
    end

    describe '#upload_port' do
      context 'when no configuration' do
        it 'returns 80' do
          expect(config.upload_port).to eq(80)
        end
      end

      context 'when set upload_ssl' do
        before do
          config.upload_ssl = true
        end

        it 'returns 443' do
          expect(config.upload_port).to eq(443)
        end
      end

      context 'when set upload_port' do
        let(:upload_port) { 3000 }
        before do
          config.upload_port = upload_port
        end

        it 'returns same upload_port' do
          expect(config.upload_port).to eq(upload_port)
        end
      end
    end

    describe '#upload_ssl?' do
      context 'when no configuration' do
        it 'returns false' do
          expect(config.upload_ssl?).to be_falsy
        end

        context 'when set ssl' do
          before do
            config.ssl = true
          end

          it 'returns true' do
            expect(config.upload_ssl?).to be_truthy
          end
        end
      end

      context 'when set true' do
        before do
          config.upload_ssl = true
        end

        it 'returns true' do
          expect(config.upload_ssl?).to be_truthy
        end
      end
    end

    describe '#scheme' do
      context 'when no configuration' do
        it 'returns http' do
          expect(config.scheme).to eq(:http)
        end
      end

      context 'when set ssl true' do
        before do
          config.ssl = true
        end

        it 'returns https' do
          expect(config.scheme).to eq(:https)
        end
      end
    end
  end
end
