module Kinu
  class Configuration
    attr_writer :host, :upload_host, :port, :upload_port, :ssl, :upload_ssl

    def host
      @host
    end

    def upload_host
      @upload_host
    end

    def port
      if @port
        @port
      elsif ssl?
        443
      else
        80
      end
    end

    def upload_port
      if @upload_port
        @upload_port
      elsif upload_ssl?
        443
      else
        80
      end
    end

    def ssl?
      @ssl
    end

    def upload_ssl?
      if @upload_ssl.nil?
        ssl?
      else
        @upload_ssl
      end
    end

    def scheme
      if ssl?
        :https
      else
        :http
      end
    end
  end
end
