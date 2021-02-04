class Parking < ApplicationRecord
  validates :plat_nomor, presence: true
  validates :warna, presence: true
  validates :tipe, presence: true
  validates :parking_lot, presence: true
  validates :parking_bill, presence: true
end
