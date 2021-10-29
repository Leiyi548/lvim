return {
  org_hide_leading_stars = false,
  diagnostic = false,
  org_agenda_files = '~/Dropbox/org/*',
  org_default_notes_file = '~/Dropbox/org/refile.org',
  org_hide_emphasis_markers = true,
  org_agenda_text_search_extra_files = {'agenda-archives'},
  org_agenda_start_on_weekday = false,
  org_todo_keywords = {'TODO(t)', 'PROGRESS(p)', '|', 'DONE(d)', 'REJECTED(r)'},
  org_agenda_templates = {
    T = {
      description = 'Todo',
      template = '* TODO %?\n  DEADLINE: %T',
      target = '~/Dropbox/org/todos.org'
    },
    w = {
      description = 'Work todo',
      template = '* TODO %?\n  DEADLINE: %T',
      target = '~/Dropbox/org/work.org'
    },
  },
}
