class Event < ApplicationRecord
  belongs_to :event_category
  has_many :purchases
  
  validates :event_category, :title, :location, :start_at, :ticket_price, :ticket_quantity, presence: true
  validates :title, length: { maximum: 80 }, uniqueness: true
  validates :location, length: { maximum: 20 }
  validates :ticket_price, :ticket_quantity, numericality: { only_integer: true, greater_than: 0 }
    
  validates_each :start_at do |record, attr, value|
    record.errors.add(attr, 'must be at least a week from now') if value < Time.current + 1.week
  end
  
  scope :get_by_title, -> (title){ where("title LIKE ?", "%#{title}%") }
  
  # scope :get_by_id1, -> (id){ where("event_category_id = '1'") }
  
  # scope :get_by_id2, -> (id){ where("event_category_id = '2'") }
  
  # scope :get_by_id3, -> (id){ where("event_category_id = '3'") }

  scope :get_by_id, -> (id){ where("event_category_id = ?", id) }
  
  # scope :get_by_id2, -> (id){ where("event_category_id = ?", id) }
  
  # scope :get_by_id3, -> (id){ where("event_category_id = ?", id) }
    
  
end
