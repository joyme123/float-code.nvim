# Float Code

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ellisonleao/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

A neovim plugin to show code snippet in float window

## Using it

```
return {
  "joyme123/float-code.nvim",
  branch="main",
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>cf', ':ShowFloatCodeWindow<CR>', {noremap = true, silent = true})
  end,
}
```
