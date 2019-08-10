defmodule InfusionWeb.ErrorView do
  use Phoenix.View,
    root: "lib/infusion_web/templates",
    namespace: InfusionWeb

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
