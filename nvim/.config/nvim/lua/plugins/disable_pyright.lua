return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        enabled = false, -- disable server
        mason = false, -- don't install with mason
      },
    },
  },
}
