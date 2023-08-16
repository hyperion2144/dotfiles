return {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    -- root_dir = util.root_pattern 'pubspec.yaml',
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = false,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
}
