class User < ActiveRecord::Base
  has_many  :posts
  validates :username, presence: true
  validates :age, presence: true
  validates :account, presence: true
  validates :password, presence: true
  before_create :encrypt_password
  def encrypt_password
    self.password = User.encrypt_password(self.password)
  end
  def self.encrypt_password(password)
    Digest::SHA1.hexdigest(password)
  end
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: ->(attachment) { ActionController::Base.helpers.image_path('icons/avatar.png') },      # 在 production 才會正確顯示出來
    url: "/:class/:attachment/:id/:style.:extension",
    path: ":rails_root/public:url"
  validates_attachment :avatar,
    content_type: { content_type: /\Aimage\/.*\Z/ },                          # 或特定類型 content_type: "image/jpeg" or content_type: ['image/jpeg', 'image/png', 'image/gif']
    size: { in: 0..20.megabyte }                                             # 或 KB { in: 0..20.kilobytes }
end

