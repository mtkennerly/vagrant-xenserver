require "vagrant"

module VagrantPlugins
  module XenServer
    module Errors
      class VagrantXenServerError < Vagrant::Errors::VagrantError
        error_namespace("vagrant_xenserver.errors")
      end

      class LoginError < VagrantXenServerError
        error_key(:login_error)
      end

      class UploaderInterrupted < VagrantXenServerError
        error_key(:uploader_interrupted)
      end

      class UploaderError < VagrantXenServerError
        error_key(:uploader_error)
      end

      class APIError < VagrantXenServerError
        error_key(:api_error)
      end

      class UnknownOS < VagrantXenServerError
        error_key(:unknown_os)
      end

      class QemuImgError < VagrantXenServerError
        error_key(:qemuimg_error)
      end

      class NoDefaultSR < VagrantXenServerError
        error_key(:nodefaultsr_error)
      end

      class NoHostsAvailable < VagrantXenServerError
        error_key(:nohostsavailable_error)
      end

      class Import404 < VagrantXenServerError
        error_key(:import404)
      end

      class InsufficientSpace < VagrantXenServerError
        error_key(:insufficientspace)
      end

      class ConnectionError < VagrantXenServerError
        error_key(:connection_error)
      end
      
      class NoTemplateFound < VagrantXenServerError
        error_key(:no_template_found)
      end
    end
  end
end
