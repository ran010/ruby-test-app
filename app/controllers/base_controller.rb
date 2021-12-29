class BaseController < ApplicationController
	include Searchable
	include AlertMessages
	include RecordMethods

	before_action do |controller|
		valid_actions = [:show, :edit, :update, :destroy] + send(:set_record_actions)
		valid_actions -= send(:exclude_set_record_actions)

		if valid_actions.include?(action_name.to_sym)
			controller.send(:set_record)
		end
	end

	def index
		perform_search
		authorize_action_records
	end

	def new
		@record = record_class.new
		authorize_action_record
	end

	def create
		@record = record_class.new(permitted_params)
		authorize_action_record
		if @record.save
			set_flash(:success, create_success_message)
			ActionCable.server.broadcast(
					"notify_channel",
					{
							count: Purchase.count
					}
			)
			redirect_to redirect_path
		else
			set_flash(:alert, create_failed_message)
			render :new
		end
	rescue StandardError => e
		Rails.logger.error (e.message)
	end

	def show
		authorize_action_record
	end

	def edit
		authorize_action_record
	end

	def update
		@record.assign_attributes(permitted_params)
		authorize_action_record

		if @record.save
			set_flash(:success, update_success_message)
			redirect_to redirect_path
		else
			set_flash(:alert, update_failed_message)
			render :edit
		end
	rescue StandardError => e
		Rails.logger.error (e.message)
	end

	def destroy
		return unless @record
		authorize_action_record
		if @record.destroy
			set_flash(:success, destroy_success_message)
			redirect_to redirect_path
		else
			set_flash(:error, destroy_failed_message)
		end
	end

	private

	def permitted_params
		pp = params.require(record_name.singularize.downcase.to_sym)
				.permit(permitted_attribute_with_policy)
		pp[:status] = params[record_name.singularize.downcase.to_sym][:status].to_i
		pp
	end

	def set_record
		@record = record_class.find(params[:id])
	end

	def set_flash(type, message)
		flash[type] = message
	end
end
