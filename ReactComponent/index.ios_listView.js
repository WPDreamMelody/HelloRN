var React = require('react-native');

var {
  Text,
  Image,
  ListView,
  StyleSheet,
  View
} = React;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
  },
  imageContainer: {
    width:120,
    height:120,
  },
  titleContainer:{
    fontSize:20
  },
  listView: {
    paddingTop: 20,
    // backgroundColor: '#F5FCFF',
  },
});

class App extends React.Component {
  constructor(props) {
    super(props);   //这一句不能省略，照抄即可
    this.state = {
      dataSource:new ListView.DataSource({
        rowHasChanged:(row1,row2)=>row1!=row2,
      }),
    };
  }

  //服务器端和客户端都只调用一次，在初始化渲染执行之前立刻调用。
  componentWillMount(){

  }

  //在初始化渲染执行之后立刻调用一次，仅客户端有效（服务器端不会调用）。
  componentDidMount(){
   this.setState({
        dataSource:this.state.dataSource.cloneWithRows(this.props.images),
    });
  }

  //在组件接收到新的 props 的时候调用。在初始化渲染的时候，该方法不会调用。
  // componentWillReceiveProps: function(nextProps) {

  // }

  //更新： shouldComponentUpdate
  //更新： componentWillUpdate
  //更新： componentDidUpdate

  //在组件从 DOM 中移除的时候立刻被调用。
  componentWillUnmount(){
    console.log('componentWillUnmount');
  }



  render() {
     return (
      <View style = {styles.container}>
      <Text>ReactNative实例：HelloRN</Text>
      <Text>作者: yuking</Text>
      <ListView style = {styles.listView}
        dataSource = {this.state.dataSource}
        renderRow={this.renderImage}/>
      </View>
    );
  }

  renderImage(image){
    return <View style={styles.container}>
        <Image style={styles.imageContainer} source={{uri: image.imageURI}}/>
        <Text style={styles.titleContainer}>
          {image.title}
        </Text>
    </View>
  }
}



React.AppRegistry.registerComponent('yukingApp', () => App);















