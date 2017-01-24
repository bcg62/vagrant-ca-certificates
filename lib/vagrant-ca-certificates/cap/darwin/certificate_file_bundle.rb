module VagrantPlugins
  module CaCertificates
    module Cap
      module Darwin
        module CertificateFileBundle
          def self.certificate_file_bundle(_m)
            '/System/Library/OpenSSL/cert.pem'
          end
        end
      end
    end
  end
end
