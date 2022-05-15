# Quick Recap

(add some aliases)

## raw SQL
`Repo.query`

## executing a query directly
`Repo.all`
`Repo.one`

## batch/schema-less actions
`Repo.insert_all`
`Repo.update_all`
`Repo.delete_all`

## single queries (with schema, handle auto timestamps)
`Repo.insert`
`Repo.update`
`Repo.delete`

Some other very common queries
`Repo.get`
`Repo.get!`
`Repo.get_by`
`Repo.insert`
`Repo.insert!`
`Repo.exist?`
`Repo.preload`

# Associations

User
- username
- email
- about

Link
- url

Bookmark
- title
- link_id <!-- FK -->
- user_id <!-- FK -->

## Belongs to associations
- Each bookmark belongs to one user
- Each bookmark belongs to one link

## Has many associations
- Each user has many bookmarks
- Each link has many bookmarks

## Has one associations

## Preloading
- Repo.preload