defmodule Educative.ELearning.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :author, :string
    field :description, :string
    field :free, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :description, :author, :free])
    |> validate_required([:title, :description, :author, :free])
    |> unique_constraint([:title], message: "Course already exists")
  end
end
