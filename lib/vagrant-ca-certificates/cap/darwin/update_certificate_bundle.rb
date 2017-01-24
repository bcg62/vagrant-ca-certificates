module VagrantPlugins
  module CaCertificates
    module Cap
      module Darwin
        # Capability for configuring the certificate bundle on Redhat.
        module UpdateCertificateBundle
          def self.update_certificate_bundle(m)
            sys_chain = '/Library/Keychains/System.keychain'
            root_chain = '/System/Library/Keychains/SystemRootCertificates.keychain'
            uploaded_certs = '/System/Library/OpenSSL/private'
            ca_file = '/System/Library/OpenSSL/cert.pem'

            # dump system keychain to bundle
            m.communicate.sudo("security find-certificate -a -p #{sys_chain} #{root_chain} > #{ca_file}")

            # add uploaded certs to ca
            m.communicate.sudo("bash -c 'find #{uploaded_certs} -type f -exec cat {} \\; >> #{ca_file}'") do |type, data|
              if [:stderr, :stdout].include?(type)
                next if data =~ /stdin: is not a tty/
                m.env.ui.info data
              end
            end
          end
        end
      end
    end
  end
end
