import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { result: 0 , num1: 0, num2:0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
  }

  // your code here
  add(ev) {
    ev.preventDefault();

    this.setState({result: this.state.num1 + this.state.num2});
    console.log(this.state.result);
  }
  sub(ev) {
    ev.preventDefault();
      this.setState({result: this.state.num1 - this.state.num2});
  }
  mul(ev) {
    ev.preventDefault();
      this.setState({result: this.state.num1 * this.state.num2});
  }
  div(ev) {
    ev.preventDefault();
      this.setState({result: this.state.num1 / this.state.num2});
  }

  setNum1(ev) {
    let val1 = parseInt(ev.target.value);
    this.setState({num1:val1});

  }
  setNum2(ev) {
    let val2 = parseInt(ev.target.value);
    this.setState({num2:val2});
  }
  clear(ev) {
    ev.preventDefault();
     this.setState({ num1: 0, num2: 0, result: 0 });
  }

  render() {
    return (
      <div>
        <input type = "text" onChange={this.setNum1} value ={this.state.num1}></input>
          <input type = "text" onChange={this.setNum2} value ={this.state.num2}></input>
          <button onClick = {this.add.bind(this) }> +</button>
            <button onClick = {this.sub.bind(this) }> -</button>
              <button onClick = {this.mul.bind(this) }> *</button>
                <button onClick = {this.div.bind(this) }> /</button>
                  <button onClick = {this.clear.bind(this) }> Clear</button>
        <h1>{this.state.result}</h1>
      </div>
    );
  }

}

export default Calculator;
