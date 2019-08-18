defmodule InfusionWeb.Data do
  import Ecto.Query

  def data() do
    Dataloader.Ecto.new(Infusion.Repo, query: &query/2)
  end

  def query(Infusion.Post, _params) do
    order_by = [desc: :id]
    Infusion.Post |> order_by([desc: :id])
  end

  def query(queryable, params) do
    case Map.get(params, :order_by) do
      nil -> queryable
      order_by -> from record in queryable, order_by: ^order_by
    end
  end

end
