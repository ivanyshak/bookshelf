# frozen_string_literal: true

fantasy = Genre.find_or_create_by(name: 'fantasy')

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

potter = Book.create!(
  {
    title: 'Harry Potter',
    description: 'Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling.',
  }
)

it = Book.create!(
  {
    title: 'IT',
    description: 'It is a 1986 horror novel by American author Stephen King.',
  }
)

potter.authors << rowling
potter.genres << fantasy

it.authors << king
it.genres << fantasy
