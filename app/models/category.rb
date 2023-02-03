class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '小説' },
    { id: 3, name: 'コミック' },
    { id: 4, name: '雑誌' },
    { id: 5, name: '趣味' },
    { id: 6, name: 'ビジネス' },
    { id: 7, name: 'コンピュータ・IT' },
    { id: 8, name: '人文' },
    { id: 9, name: 'アート' },
    { id: 10, name: '絵本・児童書' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :old_books
end