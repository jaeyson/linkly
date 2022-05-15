defmodule Linkly.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.Bookmarks.{Bookmark, Link, LinkTag, Tag}

  schema "users" do
    field(:about, :string)
    field(:email, :string)
    field(:username, :string)
    field(:birth_date, :date, virtual: true)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])
    has_many(:taggings, LinkTag)
    many_to_many(:tagged_links, Link, join_through: LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:about, :email, :username])
    |> validate_required([:username, :email, :birth_date])
    |> validate_length(:username, min: 3)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_change(:birth_date, &older_than_13/2)
    |> unique_constraint([:email, :username])
  end

  defp older_than_13(:birth_date, %Date{} = birth_date) do
    {year, month, date} = Date.to_erl(Date.utc_today())
    min_date = Date.from_erl!({year - 13, month, date})

    case Date.compare(min_date, birth_date) do
      :lt -> [birth_date: "Must be over 13 years old!"]
      :gt -> []
    end
  end
end
