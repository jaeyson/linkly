# Linkly schema (Delicious clone)

## user
- username
- email

## link
- url

## bookmark
- title
- link_id, refers to links
- user_id, refers to users

## tag
- title

## link_tags
- link_id
- tag_id
- user_id

## interests
- tag_id
- user_id

## follows
- following_id (:user)
- follower_id (:user)

# Changeset: change and cast

## There are two ways of making a changeset
- `Ecto.Changeset.change` (1 or 2 args)
- `Ecto.Changeset.cast` (1 or 2 args)

Internal data -> use **change**
External data -> use **cast**

Commit changesets either by:
- `Repo.insert`
- `Repo.update`
