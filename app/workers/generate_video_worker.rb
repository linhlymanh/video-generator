class GenerateVideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    video = Video.find_by(id: video_id)
    return unless video && video.unprocessed?

    GenerateVideo.call(video: video)
  end
end
