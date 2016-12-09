class NotesController < ApplicationController

  def create
    note = Note.new(note_params)
    note.save
    redirect_to track_url(note.track)
  end

  def destroy
    note = Note.find_by(id: params[:id])
    track = note.track
    note.delete
    redirect_to track_url(track)
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :track_id, :text)
  end

end
