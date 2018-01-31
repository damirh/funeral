class FuneralsController < ApplicationController

	before_action :find_funeral, only: [:show, :edit, :update, :delete]

	def index
		@funerals = current_user.funerals
		@funeral = Funeral.new
		@weather = Weather.ranged
	end

	def show
		@weather = Weather.where(day: Date.today)
	end

	def new
		@funeral = Funeral.new
		if params[:start_time].present?
			@start_time = DateTime.strptime(params[:start_time], "%Y-%m-%d").at_noon
		end
	end

	def edit
		unless own?
			redirect_to funerals_path
			return
		end
	end

	def create
		funeral = Funeral.new(funeral_params.merge(
			{user_id: current_user.id}))

		if Funeral.free_slot? funeral
			funeral.save!
		else
			flash[:error] = 'This time is already booked!'
		end
		redirect_to funerals_path
	end

	def update
		@funeral.update(funeral_params) if own?
		redirect_to funerals_path
	end

	def delete
		@funeral.destroy if own?
		redirect_to funerals_path
	end

  private

		def find_funeral
			@funeral = Funeral.find(params[:id])
		end

		def own?
			current_user.funerals.include? @funeral
		end

    def funeral_params
      params.require(:funeral).permit(:start_time, :name)
    end

end
