class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates_format_of :email, with: /@/, message: 'must be a valid email'
  validates_presence_of :email, :contact_name, :retail_value
  validates_inclusion_of :delivery, in: [true, false]

  acts_as_votable

  default_scope { order(created_at: :asc) }

  scope :archived, -> { where(archived: true) }
  scope :active, -> { where(archived: false) }

  has_attached_file :image,
                    default_url: 'default.png',
                    styles: { medium: '600x600#' }
  validates_attachment_content_type :image, content_type: %r{/Aimage/.*\z/}

  def archive_item
    update_attribute(:archived, true)
  end

  self.per_page = 27
end
