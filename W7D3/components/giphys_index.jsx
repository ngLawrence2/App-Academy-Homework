import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const indexItems = this.props.giphys.map( (giphy,idx) => {
      <GiphysIndexItem key = {idx} />;
    });
    return (
      <div> {indexItems}</div>
    );
  }
}

export default GiphysIndex;
