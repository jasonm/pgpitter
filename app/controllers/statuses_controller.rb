class StatusesController < ApplicationController
  def index
    key = Key.find(params[:follower_id])
    render json: key.signers_statuses
  end

  def create
    status = Status.new(status_params)
    if status.save
      render text: "", status: 201
    else
      render text: status.errors.full_messages.join(', '), status: 400
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:signed_body)
  end
end
