require 'consultoria/engine'
class ConsultoriaController < ApplicationController
	def index
		#respond with index.haml file

        respond_to do |format|
            format.html { render 'consultoria/index' }
        end
	end
end