require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class String < RailsAdmin::Config::Fields::Base

          RailsAdmin::Config::Fields::Types::register(self)

          @view_helper = :text_field

          register_instance_option(:html_attributes) do
            {
              :class => css_class,
              :maxlength => length,
              :size => [50, length.to_i].min
            }
           end

          register_instance_option(:help) do
            text = (required? ? I18n.translate("admin.new.required") : I18n.translate("admin.new.optional")) + '. '
            if valid_length.present? && valid_length[:is].present?
              text += "#{I18n.translate("admin.new.char_length_of").capitalize} #{valid_length[:is]}."
            else
              max_length = [length, valid_length[:maximum] || nil].compact.min
              min_length = [0, valid_length[:minimum] || nil].compact.max
              if min_length == 0
                text += "#{I18n.translate("admin.new.char_length_up_to").capitalize} #{max_length}."
              else
                text += "#{I18n.translate("admin.new.char_length_of").capitalize} #{min_length}-#{max_length}."
              end
            end
            text
          end

          register_instance_option(:partial) do
            :form_field
          end
        end
      end
    end
  end
end
