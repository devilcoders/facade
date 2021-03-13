defmodule Surface.Components.ButtonTest do
  use Facade.ConnCase, async: true

  alias Facade.Elements.Button

  test "creates a <button> with m element attributes" do
    html =
      render_surface do
        ~H"""
        <Button p={{ 5 }} m={{ 4 }}>
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button class="p-5 m-4" type="button">
             Ok
           </button>
           """
  end

  test "creates a <button> with mb element attributes" do
    html =
      render_surface do
        ~H"""
        <Button p={{ 5 }} mb={{ 4 }}>
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button class="p-5 mb-4" type="button">
             Ok
           </button>
           """
  end
end
