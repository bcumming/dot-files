-- order matters:
-- key bindings (mappings) and options refer to plugins, so first load the plugins
-- any steps that should be applied before plugins, go in first
require("first")
require("plugins")
require("mappings")
require("options")
