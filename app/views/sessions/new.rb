module Views

  module Sessions

    class New < Views::Base

      include Phlex::Rails::Helpers::FormWith
      include Phlex::Rails::Helpers::LinkTo

      def view_template
        render_notice
        render_alert

        render_title

        form_with(url: sign_in_path) do |form|
          render_email(form)
          render_password(form)

          render_submit
        end

        render_footer
      end

      private

      def render_notice
        p(style: "color:#008000") { helpers.notice }
      end

      def render_alert
        p(style: "color:red") { helpers.alert }
      end

      def render_title
        h1 { "Sign in" }
      end

      def render_email(form)
        div do
          render Components::Forms::Label.new(form, :email)
          render Components::Forms::Field.new(form, :email,
                                              value: helpers.params[:email_hint],
                                              required: true,
                                              autofocus: true,
                                              autocomplete: "email")
        end
      end

      def render_password(form)
        div do
          render Components::Forms::Label.new(form, :password)
          render Components::Forms::Field.new(form, :password,
                                              required: true,
                                              autocomplete: "current-password")
        end
      end

      def render_submit
        div do
          render Components::Forms::Submit(form, "Sign in")
        end
      end

      def render_footer
        div do
          link_to "Sign up", sign_up_path
          plain " | "
          link_to "Forgot your password?", new_identity_password_reset_path
        end
      end

    end

  end

end
