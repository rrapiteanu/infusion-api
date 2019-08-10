defmodule Infusion.Factory do
  use ExMachina.Ecto, repo: Infusion.Repo

  def user_factory do
    %Infusion.User{
      name: Faker.Name.name(),
      email: Faker.Internet.email(),
      password: "password",
      password_hash: Bcrypt.hash_pwd_salt("password")
    }
  end

  def post_factory do
    %Infusion.Post{
      body: Faker.Lorem.paragraph(),
      user: build(:user)
    }
  end

  def comment_factory do
    %Infusion.Comment{
      body: Faker.Lorem.paragraph(),
      post: build(:post),
      user: build(:user)
    }
  end

  def conversation_factory do
    %Infusion.Conversation{
      title: Faker.Lorem.sentence()
    }
  end

  def conversation_user_factory do
    %Infusion.ConversationUser{
      conversation: build(:conversation),
      user: build(:user)
    }
  end

  def message_factory do
    %Infusion.Message{
      body: Faker.Lorem.paragraph(),
      conversation: build(:conversation),
      user: build(:user)
    }
  end
end
