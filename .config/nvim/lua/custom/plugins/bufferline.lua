return { -- Bufferline configuration

  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-web-devicons' },
  version = '*',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        numbers = 'none',
        number_style = 'superscript',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        name_formatter = function(buf)
          if buf.name:match '%.md' then
            return vim.fn.fnamemodify(buf.name, ':t:r')
          end
        end,
        -- get_element_icon = function(element)
        --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
        --   -- This can be used to change how bufferline fetches the icon
        --   -- for an element e.g. a buffer or a tab.
        --   -- e.g.
        --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = true })
        --   return icon, hl
        -- end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = false,
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'left' } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'slant',
        always_show_bufferline = true,
        sort_by = 'insert_after_current',
      },
    }
  end,
}
