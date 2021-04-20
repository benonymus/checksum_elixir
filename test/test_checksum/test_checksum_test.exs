defmodule TestChecksum.ChecksumTest do
  use ExUnit.Case
  alias TestChecksum.Checksum

  test "example test case with timeout and without" do
    Checksum.add_elements([5, 4, 8, 9, 8, 5, 0, 3, 5, 4])

    assert {:ok, 7} = Checksum.calculate_checksum(nil)

    Checksum.clear_elements()

    assert {:ok, 0} = Checksum.calculate_checksum(nil)

    assert {:error, :timeout} = Checksum.calculate_checksum("20")
  end
end
