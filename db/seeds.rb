# frozen_string_literal: true

rowling = Author.find_or_create_by(
  first_name: 'Joanne',
  last_name: 'Rowling',
  date_of_birth: '31/01/1994'.to_date,
  bio: 'J.K. Rowling is the unprecedentedly successful author of the seven books in the Harry Potter series.'
)

king = Author.find_or_create_by!(
  first_name: 'Stephen',
  last_name: 'King',
  date_of_birth: '21/09/1947'.to_date,
  bio: 'The Boogeyman, a horror-thriller from the mind of best-selling author Stephen King'
)

Book.create!(
  [
    {
      title: 'Harry Potter',
      description: 'Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling.',
      genre: 4,
      author_id: rowling.id
    },
    {
      title: 'IT',
      description: 'It is a 1986 horror novel by American author Stephen King.',
      genre: 4,
      author_id: king.id
    }
  ]
)
