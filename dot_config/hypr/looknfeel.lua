hl.config({
  general = {
    -- No gaps between windows or borders
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,

    -- Use master layout instead of dwindle
    layout = "master",
  },

  animations = {
    enabled = false,
  },

  master = {
    allow_small_split = true,
    orientation = "center",
    new_status = "slave",
    slave_count_for_center_master = 0,
  },

  -- https://wiki.hypr.land/Configuring/Variables/#decoration
  decoration = {
    -- Use round window corners
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
  },

})
