
{ curry, each, map, unfoldr, zip } = require "prelude-ls"

window.todo-storage =

	load-list: (i) ->
		try
			if local-storage.get-item "todo-#i"
				JSON.parse that
			else
				null
		catch
			console.log e
			null

	load-lists: ->
		try
			unfoldr ((i) ->
				if todo-storage.load-list i
					[that.name ? "todo-#i", (i + 1)]
				else
					null), 0
		catch
			console.log e
			null

	save-list: (i, list) !->
		try
			local-storage.set-item "todo-#i", (list |> JSON.stringify)
		catch
			console.log e

	save-lists: (lists) ->
		try
			lists
			|> zip [0 til lists.length]
			|> each ([i, list]) -> todo-storage.save-list i, list
			true
		catch
			console.log e
			false
