-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- replace default next/prev tab bindings with todo-commments
    ["]t"] = {
      function() require("todo-comments").jump_next() end,
      desc = "Next todo comment",
    },
    ["[t"] = {
      function() require("todo-comments").jump_prev() end,
      desc = "Previous todo comment",
    },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- misc
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    -- Neotest
    ["<leader>tr"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
    ["<leader>tl"] = { function() require("neotest").run.run_last() end, desc = "Run last test" },
    ["<leader>tf"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run current file" },
    ["<leader>td"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug the nearest test" },
    ["<leader>tS"] = { function() require("neotest").run.stop() end, desc = "Stop the nearest test" },
    ["<leader>ta"] = { function() require("neotest").run.attach() end, desc = "Attach to the nearest test" },
    ["<leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Toggle Summary window" },
    -- REST
    ["<leader>rp"] = { "<Plug>RestNvimPreview", desc = "Preview the request cURL command" },
    ["<leader>rl"] = { "<Plug>RestNvimLast", desc = "Re-run the last request" },
  },
  -- terminal mappings
  t = {
    ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
  },
}
