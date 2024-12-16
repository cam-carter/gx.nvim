local handler = require("gx.handlers.elixir")

describe("elixir handler works", function()
  vim.cmd("edit test/fixtures/test.exs")
  local function test_line(line, startpos, endpos, expected)
    for i = startpos, endpos do
      vim.api.nvim_win_set_cursor(0, { line, i })
      assert.equals(expected, handler.handle())
    end
  end

  it("parses normal package ~> version lines", function()
    test_line(6, 0, 7, "https://hex.pm/packages/phoenix/1.7.18")
  end)

  it("parses packages regardless of cursor startpos", function()
    test_line(6, 0, 1, "https://hex.pm/packages/phoenix/1.7.18")
  end)

  it("parses package >= version lines", function()
    test_line(7, 0, 7, "https://hex.pm/packages/plug/0.4.0")
  end)

  it("parses package ~> version lines ignoring extra opts", function()
    test_line(8, 0, 7, "https://hex.pm/packages/credo/1.7")
  end)

  it("does not parses packages sourced from git", function()
    test_line(9, 0, 7, nil)
  end)

  it("does not parse packages sourced locally", function()
    test_line(10, 0, 7, nil)
  end)
end)
