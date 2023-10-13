vim.api.nvim_create_user_command("FloatCodeWindowShow", require("float-code").show_float_code_window , {})
vim.api.nvim_create_user_command("FloatWindowShow", require("float-code").show_float_window , {})
