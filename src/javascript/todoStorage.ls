
{ curry, each, filter, map, unfoldr, zip } = require "prelude-ls"

window.todo-storage =

    create-default-list: ->
        default-list = { name: "default", items: [] }
        todo-storage.save-list 0 default-list
        default-list

    load-list: (i) ->
        try
            if local-storage.get-item "todo-#i"
                JSON.parse that
            else
                null
        catch
            console.log e
            null

    load-list-names: ->
        list-names =
            todo-storage.load-lists!
            |> map (.name)

        if not list-names or list-names.length <= 0
            list-names = [todo-storage.create-default-list!.name]

        list-names

    load-lists: ->
        try
            0
            |> unfoldr (i) ->
                    | todo-storage.load-list i => [that, (i + 1)]
                    | _ => null
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

    save-new-list: (name) ->
        new-list-index = todo-storage.load-list-names!.length
        todo-storage.save-list new-list-index, { name: name, items: [] }
        new-list-index

    save-incoming-list: (list) ->
        new-list-index = todo-storage.load-list-names!.length
        todo-storage.save-list new-list-index, list
        new-list-index        

    delete-list: (index) ->
        lists = todo-storage.load-lists!
        todo-storage.save-lists (lists |> map (-> null))
        lists = lists
                |> zip [0 til lists.length]
                |> filter ([i]) -> i != index
                |> map ([, x]) -> x
        todo-storage.save-lists lists
