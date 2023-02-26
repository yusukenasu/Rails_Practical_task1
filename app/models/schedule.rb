class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :startday, presence: true
  validates :endday, presence: true
  validates :memo, length: {maximum: 500}
  
  validate :date_check
  def date_check
    return false if endday.blank? || startday.blank?
    if endday < startday
      errors.add(:endday, 'は開始日より前の日を設定することはできません。')
    else return
    end
  end
end
