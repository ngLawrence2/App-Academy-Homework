import React from 'react';

class GiphysIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <li className="giphy-li">
       <img src={giphy.images.fixed_height.url} />
     </li>
    );
  }
}

export default GiphysIndexItem;
