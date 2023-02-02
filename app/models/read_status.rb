class ReadStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '既読' },
    { id: 3, name: '未読' }
  ]

  include ActiveHash::Associations
  has_many :books
  end