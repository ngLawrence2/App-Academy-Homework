import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    e.preventDefault();
    this.setState({
      searchTerm: e.target.value
    });
  }




  handleSubmit(e) {

    e.preventDefault();
    const { fetchSearchGiphys } = this.props;
    const { searchTerm } = this.state;
    fetchSearchGiphys(searchTerm);
    this.setState({
      searchTerm: ''
    });
  }

  render() {
    let {giphys} = this.props;
    return (
      <div>
        <input onChange= {this.handleChange} type="text"></input>
        <button onClick = {this.handleSubmit}>Submit</button>
         <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
