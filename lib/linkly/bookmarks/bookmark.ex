defmodule Linkly.Bookmarks.Bookmark do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.Bookmarks.{Link}
  alias Linkly.Accounts.{User}

  schema "bookmarks" do
    field(:title, :string)
    belongs_to(:link, Link)
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(bookmark, attrs) do
    bookmark
    |> cast(attrs, [:title, :link_id, :user_id])
    |> validate_required([:title, :link_id, :user_id])
    |> unique_constraint([:link_id, :user_id])
  end
end
