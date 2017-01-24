module VagrantPlugins
  module CaCertificates
    module Cap
      module Darwin
        module CertificateUploadPath
          def self.certificate_upload_path(_m)
            '/System/Library/OpenSSL/private'
          end
        end
      end
    end
  end
end
