local M = {}

M.setup = function()
  local status_ok, org_mode = pcall(require, "orgmode")
  if not status_ok then
    return
  end
  org_mode.setup {
    org_agenda_files = { "~/Dropbox/org/*" },
    org_default_notes_file = "~/Dropbox/org/refile.org",
    org_agenda_templates = {
      T = {
        description = "Todo",
        template = "* TODO %?\n  DEADLINE: %T",
        target = "~/shared/orgs/todos.org",
      },
      w = {
        description = "Work todo",
        template = "* TODO %?\n  DEADLINE: %T",
        target = "~/shared/orgs/work.org",
      },
    },
    mappings = {
      global = {
        org_agenda = "go",
        org_capture = "gC",
      },
      org = {
        org_toggle_checkbox = "gl",
      }
    },
  }
end

return M
