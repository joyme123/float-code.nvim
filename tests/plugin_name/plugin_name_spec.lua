local plugin = require("float-code")

describe("setup", function()
  it("works with default", function()
    assert("my first function with param = Hello!", plugin.show_float_code_window())
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
    assert("my first function with param = custom", plugin.show_float_code_window())
  end)
end)
