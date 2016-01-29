//MapView.js
var React = require('react-native');

var {
  Text,
  Image,
  ListView,
  StyleSheet,
  View
} = React;

var {requireNativeComponent} = require('react-native');

// requireNativeComponent 自动把这个组件提供给 "RCTMaperManager"
// module.exports = requireNativeComponent('RCTMaper',null);

// <MapView pitchEnaled={false}/>

class MapView extends React.Component {
	render(){
		var region = {
			latitude:37.48,
			longitude:-122.16,
			latitudeDelta:0.1,
			longitudeDelta:0.1,
		}
		return <MapView region={region}/>
	}
}

MapView.propTypes = {
   /**
   * 当这个属性被设置为true，并且地图上绑定了一个有效的可视区域的情况下，
   * 可以通过捏放操作来改变摄像头的偏转角度。
   * 当这个属性被设置成false时，摄像头的角度会被忽略，地图会一直显示为俯视状态。
   */
  pitchEnaled: React.PropTypes.bool,
   /**
   * 地图要显示的区域。
   *
   * 区域由中心点坐标和区域范围坐标来定义。
   * 
   */
  region: React.PropTypes.shape({
    /**
     * 地图中心点的坐标。
     */
    latitude: React.PropTypes.number.isRequired,
    longitude: React.PropTypes.number.isRequired,

    /**
     * 最小/最大经、纬度间的距离。
     */
    latitudeDelta: React.PropTypes.number.isRequired,
    longitudeDelta: React.PropTypes.number.isRequired,
  }),
}

var RCTMaper = requireNativeComponent('RCTMaper',MapView);
// module.exports = MapView;

React.AppRegistry.registerComponent('yukingApp', () => MapView);






































