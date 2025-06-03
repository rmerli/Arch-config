return {
  {
    'rmerli/doc-gen.nvim',
    config = function()
      require('doc-gen').setup {
        get_key_cmd = 'pass show openaikey2',
      }
    end,
  },
}
