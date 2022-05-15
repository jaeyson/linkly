defmodule Linkly.Bookmarks.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.Bookmarks.{Bookmark, LinkTag, Tag}
  alias Linkly.Accounts.{User}

  schema "links" do
    field(:url, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:taggings, LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)
    many_to_many(:users, User, join_through: LinkTag)

    timestamps()
  end

  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> unique_constraint([:url])
  end
end
