return {
  'nvim-neotest/neotest',
  dependencies = {
    'V13Axel/neotest-pest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-pest' {
          -- Ignore these directories when looking for tests
          -- -- Default: { "vendor", "node_modules" }
          ignore_dirs = { 'vendor', 'node_modules' },

          -- Ignore any projects containing "phpunit-only.tests"
          -- -- Default: {}
          root_ignore_files = { 'phpunit-only.tests' },

          -- Specify suffixes for files that should be considered tests
          -- -- Default: { "Test.php" }
          test_file_suffixes = { 'Test.php', '_test.php', 'PestTest.php' },

          -- Sail not properly detected? Explicitly enable it.
          -- -- Default: function() that checks for sail presence
          sail_enabled = function()
            return false
          end,

          -- Custom pest binary.
          -- -- Default: function that checks for sail presence
          pest_cmd = 'vendor/bin/pest',

          -- Run N tests in parallel, <=1 doesn't pass --parallel to pest at all
          -- -- Default: 0
          parallel = 0,

          -- Enable ["compact" output printer](https://pestphp.com/docs/optimizing-tests#content-compact-printer)
          -- -- Default: false
          compact = false,
        },
      },
    }
  end,
}
