require "log4r"
require "xmlrpc/client"

module VagrantPlugins
  module XenServer
    module Action
      class FindTemplate
        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new("vagrant::xenserver::actions::clone_vm")
        end

        def call(env)
          template_name = env[:machine].provider_config.template_name

          unless template_name.nil?
            # User has specified an existing template, so let's use it.
            Action.getlock.synchronize do
              templates = env[:xc].VM.get_all_records_where("field \"is_a_template\"=\"true\" and field \"is_a_snapshot\"=\"false\"")
              template = templates.detect { |vm,vmr|
                vmr['name_label'] == template_name.to_s
              }

              if template.nil?
                @logger.error("No match found for template_name: #{template_name}")
                raise Errors::NoTemplateFound
              else
                env[:template] = template[0]
              end
            end
          end

          @app.call(env)
        end
      end
    end
  end
end
