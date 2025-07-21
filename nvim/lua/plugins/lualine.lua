return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons'},
  config = function()
    require('lualine').setup {
      options = {
        theme = 'onedark',
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            icons_enabled = false,
            show_filename_only = true,   -- Shows shortened relative path when set to false.
            hide_filename_extension = false,   -- Hide filename extension when set to true.
            show_modified_status = true, -- Shows indicator when the buffer is modified.

            mode = 0, -- 0: Shows buffer name
          }
        }
      }
    }
  end
}
