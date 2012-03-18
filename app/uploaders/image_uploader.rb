# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  storage :grid_fs
end
