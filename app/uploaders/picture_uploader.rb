class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.resize_max, Settings.resize_max]
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def scale(width, height)
  #   # do something
  # end

  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # def filename
  #   "something.jpg" if original_filename
  # end
end
