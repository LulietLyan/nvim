-- OpenAI Codex CLI integration.  The plugin is community maintained; OpenAI
-- currently distributes Codex as a CLI and VS Code extension, not a Neovim
-- plugin.  This adapter uses the installed `codex` binary and its app-server.
return {
  {
    "tarekasishm/codex.nvim",
    cmd = {
      "Codex",
      "CodexOpen",
      "CodexClose",
      "CodexFocus",
      "CodexSend",
      "CodexAdd",
      "CodexChat",
      "CodexAsk",
      "CodexChatSend",
      "CodexInterrupt",
      "CodexStopServer",
      "CodexStatus",
    },
    opts = {
      terminal = {
        provider = "native",
        split_side = "right",
        split_width_percentage = 0.40,
        auto_insert = true,
      },
      app_server = { show_reasoning = false },
    },
    keys = {
      { "gC", "<cmd>Codex<cr>", desc = "Codex: terminal" },
      { "gX", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: send selection" },
      { "gA", "<cmd>CodexAdd<cr>", desc = "Codex: add file" },
      { "gK", "<cmd>CodexChat<cr>", desc = "Codex: chat" },
      { "gQ", ":CodexAsk ", desc = "Codex: ask" },
      { "gI", "<cmd>CodexInterrupt<cr>", desc = "Codex: interrupt" },
    },
  },
}
