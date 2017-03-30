var React = require ('react')
var ReactDOM = require ('react-dom')
var request = require('superagent')
var FormComponent = require('./form')

var MainComponent = React.createClass({
	getInitialState: function() {
		return { data: []}
	},
	//
	componentDidMount: function() {
	//create the original state
		var state = this.state;
		var self = this;

		request.get('http://localhost:9393/place')
			.end(function(err,data){
				state.data = data.body;
				self.setState(state)
			})
		
		
	},

	createPlace: function(place){
		var state = this.state;
		var self = this;

		request.post('http://localhost:9393/place')
			.send('name=' + place)
			.end(function(err,data){
				console.log(data)
			})
	},

	return: function(){
		return(
			<div> 
				<h1> Places to Go! </h1>
				<FormComponent on PlaceSubmit ={this.createPlace}/>
				<ul>
					{this.state.data.map(function(where, i){
						return(
							<li key={i}>{where.name}</li>
						)
					})}
				</ul>
			</div>
		)
	}
});

ReactDOM.render(
	<MainComponent/>, document.getElementById('container')
	)