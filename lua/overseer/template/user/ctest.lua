local function get_cmakelists(opts)
  return vim.fs.find("CMakeLists.txt", { upward = true, type = "file", path = opts.dir })[1]
end

-- CMake writes a CTestTestfile.cmake into the build dir once tests have been
-- configured (via enable_testing()/include(CTest) + add_test()). Its presence
-- is what makes `ctest` actually find anything to run.
local function get_ctest_build_dir(opts)
  local cmakelists = get_cmakelists(opts)
  if not cmakelists then
    return nil
  end
  local root = vim.fs.dirname(cmakelists)
  if vim.fn.filereadable(root .. "/build/CTestTestfile.cmake") == 1 then
    return root
  end
  return nil
end

---@type overseer.TemplateFileProvider
return {
  cache_key = function(opts)
    return get_cmakelists(opts)
  end,
  generator = function(opts)
    local root = get_ctest_build_dir(opts)
    if not root then
      return "No configured tests found (needs CMakeLists.txt and build/CTestTestfile.cmake)"
    end
    return {
      {
        name = "ctest",
        builder = function()
          return {
            cmd = "ctest --test-dir build --output-on-failure --parallel $(nproc --all)",
            cwd = root,
            components = { "default" },
          }
        end,
      },
    }
  end,
}
