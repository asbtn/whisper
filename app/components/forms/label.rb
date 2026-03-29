module Components

  module Forms

    class Label < Components::Base

      def initialize(form, target, text = target.to_s.humanize)
        @form   = form
        @target = target
        @text   = text
      end

      def view_template
        render form.label target, text, style: "display: block"
      end

      private

      attr_reader :form, :target, :text

    end

  end

end
