defmodule Facade.System.SpacingTest do
  use Facade.ConnCase, async: true

  alias Facade.System.Spacing

  test "generate proper spacin classes list" do
    assert Spacing.to_classes(p: 10, m: 10, px: [10, 5, 4]) == [
             "p-10",
             "m-10",
             "px-10",
             "sm:px-5",
             "md:px-4"
           ]
  end
end
