defmodule Facade.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: Facade.Elements.Button,
    catalogue: Facade.Catalogue,
    title: "Label",
    height: "90px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~H"""
    <Button p={{5}}>Slot</Button>
    """
  end
end
