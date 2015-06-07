
{ curry, each, map, unfoldr, zip } = require "prelude-ls"

window.todo-storage =

	load-lists: ->
		try
			unfoldr ((i) ->
				if local-storage.get-item "todo-#i"
					[that, (i + 1)]
				else
					null), 0
			|> map JSON.parse
		catch
			console.log e
			null

	save-list: ([i, list]) ->
		local-storage.set-item "todo-#i", (list |> JSON.stringify)

	save-lists: (lists) ->
		try
			lists
			|> zip [0 til lists.length]
			|> each todo-storage.save-list
			true
		catch
			console.log e
			false
