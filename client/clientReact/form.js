var react = require('react');

FormComponent = React.createClass({
	getInitialState() {
		return {inputValue: ''}
	},

	handleClick: function(event){
		event.preventDefault();
		this.props.onPlaceSubmit(this.state.inputValue)
	},

	render: function(){
		return(
			<div>
				<form>
					<input placeholder = "Where" value={this.sate.inputValue} onChange={this.updateValue}/>
					<button onclick={this.handleClick}>Add Place</button>
				</form>
			</div>


		)
	},

	updateValue: function(event){
		this.setState({inputValue: event.target.value})
	}
})

module.exports = FormComponent