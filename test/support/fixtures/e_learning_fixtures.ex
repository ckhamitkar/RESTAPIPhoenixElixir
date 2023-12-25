defmodule Educative.ELearningFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Educative.ELearning` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        author: "some author",
        description: "some description",
        free: true,
        title: "some title"
      })
      |> Educative.ELearning.create_course()

    course
  end
end
