class StatusesController < ApplicationController
  def index
    key = Key.find_or_import(params[:follower_id])
    render json: {keyid: key.keyid, signers_statuses: key.signers_statuses}
  end

  def create
    status = Status.new(status_params)
    if status.save
      render text: '', status: 201
    else
      render text: status.errors.full_messages.join(', '), status: 400
    end
  end

  def show
    status = Status.find(params[:id])

    respond_to do |format|
      format.html { @status = status }
      format.json { render json: status }
    end
  end

  private

  def status_params
    params.require(:status).permit(:signed_body)
  end
end
