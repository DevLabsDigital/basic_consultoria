class ApplicationController < ActionController::Base
    # include DeviseTokenAuth::Concerns::SetUserByToken
	layout :setup_layout
	before_action :authenticate_user!
	
	before_action :setup_authorizations
	before_action :check_route

	before_action :define_current_user
	# protect_from_forgery with: :null_session
	def define_current_user
		if current_user
			Current.user = current_user
		end
	end

	def check_route
		#check if route is /consulting
		@project_management = params["controller"] == "consultoria"
	end



	rescue_from CanCan::AccessDenied do |exception|
		root_path = if current_user.current_role.label == "consulting"
			main_app.consulting_url
		else
			main_app.root_url
		end
		
	    respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to root_path, notice: "Você não tem acesso a essa página" }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	  end

	def setup_layout
		if current_user
			"application"
		else
			"signin"
		end
	end

	def setup_authorizations
		@authorizations = {
			can_balance_sheets: can?(:manage, :balance_sheets),
			can_cost_centers: can?(:manage, :cost_centers),
			can_formulas: can?(:manage, :formulas),
			can_indicators: can?(:manage, :indicators),
			can_budgets: can?(:manage, :budgets),
			can_charts: can?(:manage, :charts),
			can_front_dashboard_formulas: can?(:manage, :front_dashboard_formulas),
			can_contabil_patterns: can?(:manage, :contabil_patterns),
		}
		
		
		
	end

	def remove_header
		@popup = true
	  end
end
