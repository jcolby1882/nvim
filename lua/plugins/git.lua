return {

  { "tpope/vim-fugitive", name = "fugitive", event = "VeryLazy" },
  { "sindrets/diffview.nvim", name = "diffview", event = "VeryLazy" },

  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    event = "VeryLazy",
    lazy = true,
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_formatter = '    - <author> | <author_time:[%a %I:%M %p]> | "<summary>"',
      current_line_blame_opts = {
        virt_text_pos = "eol",
        delay = 200,
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>Gb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
                map("n", "<leader>Gst", gs.toggle_current_line_blame, "Toggle Line Blame")
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  { "rhysd/git-messenger.vim", name = "git-messenger", event = "VeryLazy" },

  -- { "rhysd/committia.vim",     event = "VeryLazy" },
}
