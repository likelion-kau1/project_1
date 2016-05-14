class User < ActiveRecord::Base
  belongs_to :post
  mount_uploader :shooter, ShooterUploader
end
