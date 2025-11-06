return {
  "unblevable/quick-scope",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    -- 常に有効化（デフォルトは無効化して手動でトグル）
    vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    
    -- 遅延を設定（ミリ秒）
    vim.g.qs_delay = 0
    
    -- 特定のファイルタイプで無効化
    vim.g.qs_filetype_blacklist = { 'dashboard', 'neo-tree', 'lazy' }
    
    -- 最大行長の設定（長い行でパフォーマンスを保つ）
    vim.g.qs_max_chars = 1000
  end,
  config = function()
    -- ハイライトカラーのカスタマイズ（オプション）
    vim.cmd([[
      highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
      highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    ]])
  end,
}

