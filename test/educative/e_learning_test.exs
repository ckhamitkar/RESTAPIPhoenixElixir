defmodule Educative.ELearningTest do
  use Educative.DataCase

  alias Educative.ELearning

  describe "courses" do
    alias Educative.ELearning.Course

    import Educative.ELearningFixtures

    @invalid_attrs %{author: nil, description: nil, free: nil, title: nil}

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert ELearning.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert ELearning.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      valid_attrs = %{author: "some author", description: "some description", free: true, title: "some title"}

      assert {:ok, %Course{} = course} = ELearning.create_course(valid_attrs)
      assert course.author == "some author"
      assert course.description == "some description"
      assert course.free == true
      assert course.title == "some title"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ELearning.create_course(@invalid_attrs)
    end
    test "create_course/1 with duplicate data returns error" do
      valid_attrs = %{author: "some author", description: "some description", free: true, title: "some title"}

      assert {:ok, %Course{}} = ELearning.create_course(valid_attrs)
      assert {:error, %Ecto.Changeset{}} = ELearning.create_course(valid_attrs)
    end
    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      update_attrs = %{author: "some updated author", description: "some updated description", free: false, title: "some updated title"}

      assert {:ok, %Course{} = course} = ELearning.update_course(course, update_attrs)
      assert course.author == "some updated author"
      assert course.description == "some updated description"
      assert course.free == false
      assert course.title == "some updated title"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = ELearning.update_course(course, @invalid_attrs)
      assert course == ELearning.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = ELearning.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> ELearning.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = ELearning.change_course(course)
    end


  end
end
