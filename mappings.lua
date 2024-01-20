local utils = require "astronvim.utils"

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
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },
    -- Terminal
    ["<leader>gg"] = {
      function()
        local worktree = require("astronvim.utils.git").file_worktree()
        local flags = worktree and (" -w=%s -d=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd "gitui -t=new.ron"
      end,
      desc = "ToggleTerm gitui user",
    },
    ["<leader>tl"] = {
      function()
        local worktree = require("astronvim.utils.git").file_worktree()
        local flags = worktree and (" -w=%s -d=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd "gitui -t=new.ron"
      end,
      desc = "ToggleTerm gitui user",
    },
    ["<leader>tr"] = { function() utils.toggle_term_cmd "irust" end, desc = "ToggleTerm Rust" },

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

    ["8"] = { function() vim.cmd "normal! ^" end, desc = "Go to the first non-blank character" },
    ["9"] = { function() vim.cmd "normal! $" end, desc = "Go to end of line" },
    ["]e"] = {
      function() vim.cmd ":move +1<CR>" end,
      desc = "Swap current line next line above",
    },
    ["[e"] = {
      function() vim.cmd ":move -2<CR>" end,
      desc = "Swap current line with line below",
    },
    ["v]e"] = {
      function() vim.cmd ":move '>+1<CR>gv=gv" end,
      desc = "Swap current line next line above",
    },
    ["v[e"] = {
      function() vim.cmd ":move -2<CR>gv=gv" end,
      desc = "Swap current line with line below",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
-- if is_available "toggleterm.nvim" then
--   maps.n["<leader>t"] = sections.t
-- if vim.fn.executable("gitui") == 1 then
--
--     maps.n["<leader>g"] = sections.g
--     maps.n["<leader>gg"] = {
--       function()
--         local worktree = require("astronvim.utils.git").file_worktree()
--         local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
--         utils.toggle_term_cmd("gitui -t=new.ron" .. flags)
--       desc = "ToggleTerm gitui",v
--       end,
--     }
--     maps.n["<leader>tl"] = maps.n["<leader>gg"]
-- end
--   if vim.fn.executable "irust" == 1 then
--     maps.n["<leader>tr"] = { function() utils.toggle_term_cmd "irust" end, desc = "ToggleTerm Rust" }
--   end
-- end
