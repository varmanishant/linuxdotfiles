require('vis')

vis.events.subscribe(vis.events.INIT, function()
    vis:command('set theme base16-standard')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)    
    vis:command('set show-tabs')
    vis:command('set tabwidth 4')
end)

vis:map(vis.modes.NORMAL, "s", function()
    vis:command('w!')
end)
