defmodule Linkly.Bookmarks.LinkTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.Bookmarks.{Link, Tag}
  alias Linkly.Accounts.User

  schema "link_tags" do
    belongs_to :link, Link
    belongs_to :tag, Tag
    belongs_to :user, User

    timestamps()
  end

  def changeset(link_tag, attrs) do
    link_tag
    |> cast(attrs, [:link_id, :tag_id, :user_id])
    |> validate_required([:link_id, :tag_id, :user_id])
    |> unique_constraint([:link_id, :tag_id, :user_id])
  end
end
