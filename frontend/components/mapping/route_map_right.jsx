import React, { Component } from "react";

class RouteMapRight extends Component {
  constructor(props) {
    super(props)
    // props = distance, nullPoint, nullAllPoints
    // this.marks = this.props.markArray;
    this.handleClick.bind(this)
  }

  handleClick() {
    // this.marks.forEach(mar => (
    //   mar.setMap(null)
    // ));
    // this.marks.length = 0;

  }

  render() {
    // object destructing for DRY code
    let {stateTrack, total_time, distance, nullPoint, nullAllPoints} = this.props;

    return (
      <section id="map-page-right" onClick={() => (this.handleClick())}>
        <div className="map-page-right-distance-container">
          <div style={{ fontSize: 11.25 + 'px' }}>
            DISTANCE
          </div>
          <div style={{fontSize: 24 + "px", fontFamily: "Arial"}}>{Number(distance).toFixed(2)}<span> &nbsp;MI</span>
          
          </div>
        </div>
        {/* <div>ESTIMATED TIME: &nbsp;{total_time}&nbsp;Minutes</div> */}
        <section className="map-page-right-buttons-container">
          <button onClick={nullAllPoints}>Clear All Points</button>
          <button onClick={nullPoint}>Clear Last Point</button>
          <button className="testing button" onClick={stateTrack}>TestFire</button>
        </section>
          <strong>ToolTip</strong>
      </section>
    )

  };
}


export default RouteMapRight;