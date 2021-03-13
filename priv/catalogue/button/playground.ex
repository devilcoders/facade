defmodule Facade.Catalogue.Button.Playground do
  use Surface.Catalogue.Playground,
    subject: Facade.Elements.Button,
    catalogue: Facade.Catalogue,
    height: "110px",
    container: {:div, class: "buttons is-centered"}

  data(props, :map,
    default: %{
      p: 5,
      m: 5
    }
  )

  def render(assigns) do
    ~H"""
    <Button :props={{ @props }}>Test</Button>
    """
  end
end
