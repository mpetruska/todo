// Generated by LiveScript 1.3.1
(function(){
  var TodoItem, TodoList, TodoApp;
  TodoItem = React.createClass({displayName: "TodoItem",
    render: function(){
      return React.createElement("span", null, 
          React.createElement("input", {type: "checkbox", id: this.props.text}), 
          React.createElement("label", {htmlFor: this.props.text}, this.props.text), 
          React.createElement("button", {class: "del", onClick: this.props.onDelete}, "X")
        );
    }
  });
  TodoList = React.createClass({displayName: "TodoList",
    createItem: function(item, i){
      var onDelete, this$ = this;
      onDelete = function(e){
        return this$.props.onDelete(e, i);
      };
      return React.createElement("li", null, React.createElement(TodoItem, {text: item.text, onDelete: onDelete}));
    },
    render: function(){
      return React.createElement("ul", null, this.props.items.map(this.createItem));
    }
  });
  TodoApp = React.createClass({displayName: "TodoApp",
    getInitialState: function(){
      return {
        items: [],
        text: ""
      };
    },
    onChange: function(e){
      return this.setState({
        text: e.target.value
      });
    },
    onDelete: function(e, i){
      e.preventDefault();
      return this.setState({
        items: this.state.items.filter(function(item, index){
          return index !== i;
        })
      });
    },
    handleSubmit: function(e){
      e.preventDefault();
      console.log(this.state.text);
      return this.setState({
        items: this.state.items.concat([{
          text: this.state.text
        }]),
        text: ""
      });
    },
    render: function(){
      return React.createElement("div", {class: "todo_app"}, 
          React.createElement("h3", null, "TODO"), 
          React.createElement(TodoList, {items: this.state.items, onDelete: this.onDelete}), 
          React.createElement("form", {onSubmit: this.handleSubmit}, 
              React.createElement("input", {onChange: this.onChange, value: this.state.text}), 
              React.createElement("button", null, "Add")
          )
        );
    }
  });
  React.render(React.createElement(TodoApp, null), document.getElementById("todo_app"));
}).call(this);
