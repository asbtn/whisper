module Components

  module Forms

    class Field < Components::Base

      def initialize(form, type, name = type, **options)
        @form    = form
        @type    = type
        @name    = name
        @options = options
      end

      def view_template
        form.public_send("#{type}_field", name, **mix(default_options, options))
      end

      private

      attr_reader :form, :type, :name, :options

      def default_options
        { class: %w[block rounded-md border px-3 py-2] }
      end

    end

  end

end
