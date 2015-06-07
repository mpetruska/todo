// Generated by LiveScript 1.3.1
(function(){
  var ref$, filter, map, zip, TodoItem, TodoList, TodoApp;
  ref$ = require("prelude-ls"), filter = ref$.filter, map = ref$.map, zip = ref$.zip;
  TodoItem = React.createClass({displayName: "TodoItem",
    onChange: function(e){
      return this.props.onFinishedChange(
      e.target.checked);
    },
    render: function(){
      return React.createElement("span", null, 
          React.createElement("input", {type: "checkbox", checked: this.props.finished, id: this.props.text, onChange: this.onChange}), 
          React.createElement("label", {htmlFor: this.props.text}, this.props.text), 
          React.createElement("button", {className: "del", onClick: this.props.onDelete}, "X")
        );
    }
  });
  TodoList = React.createClass({displayName: "TodoList",
    getInitialState: function(){
      return {
        name: "default",
        items: [],
        text: ""
      };
    },
    componentDidMount: function(){
      var list, ref$;
      list = todoStorage.loadList(this.props.listIndex);
      this.setState(list
        ? {
          name: (ref$ = list.name) != null ? ref$ : "default",
          items: (ref$ = list.items) != null
            ? ref$
            : []
        }
        : {
          name: "default",
          items: []
        });
    },
    saveList: function(newItems){
      todoStorage.saveList(this.props.listIndex, {
        name: this.state.name,
        items: newItems
      });
    },
    onChange: function(e){
      this.setState({
        text: e.target.value
      });
    },
    handleSubmit: function(e){
      var newItems;
      e.preventDefault();
      newItems = this.state.items.concat([{
        text: this.state.text,
        finished: false
      }]);
      this.setState({
        items: newItems,
        text: ""
      });
      this.saveList(newItems);
      return false;
    },
    createItem: function(item){
      var onDelete, onFinishedChange, this$ = this;
      onDelete = function(e){
        var newItems;
        e.preventDefault();
        newItems = filter(function(x){
          return x !== item;
        })(
        this$.state.items);
        this$.setState({
          items: newItems
        });
        this$.saveList(newItems);
        return false;
      };
      onFinishedChange = function(x){
        var newItems;
        item.finished = x;
        newItems = this$.state.items;
        this$.setState({
          items: newItems
        });
        this$.saveList(newItems);
        return false;
      };
      return React.createElement("li", null, 
          React.createElement(TodoItem, {text: item.text, finished: item.finished, onDelete: onDelete, onFinishedChange: onFinishedChange})
        );
    },
    render: function(){
      var children;
      children = map(this.createItem)(
      this.state.items);
      return React.createElement("div", {id: "todo_list"}, 
          React.createElement("h4", null, this.state.name), 
          React.createElement("ul", null, children), 
          React.createElement("form", {onSubmit: this.handleSubmit}, 
              React.createElement("input", {onChange: this.onChange, value: this.state.text}), 
              React.createElement("button", null, "Add")
          )
        );
    }
  });
  TodoApp = React.createClass({displayName: "TodoApp",
    getInitialState: function(){
      return {
        lists: []
      };
    },
    componentDidMount: function(){
      var ref$;
      this.setState({
        lists: (ref$ = todoStorage.loadLists()) != null
          ? ref$
          : []
      });
    },
    saveLists: function(){
      todoStorage.saveLists(this.lists);
    },
    render: function(){
      return React.createElement("div", null, 
          React.createElement("div", {id: "todo_lists"}), 
          React.createElement(TodoList, {listIndex: 0}), 
          React.createElement("div", {className: "clear"})
        );
    }
  });
  React.render(React.createElement(TodoApp, null), document.getElementById("todo_app"));
}).call(this);