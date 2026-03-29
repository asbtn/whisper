module Components

  module Forms

    class Submit < Components::Base

      def initialize(form, name, **options)
        @form    = form
        @name    = name
        @options = options
      end

      def view_template
        form.submit name, **mix(default_options, options)
      end

      private

      attr_reader :form, :name, :options

      def default_options
        { class: %w[block rounded-md border px-3 py-2] }
      end

    end

  end

end
