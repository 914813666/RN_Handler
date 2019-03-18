import React,{Component,PropTypes} from 'react';
import {requireNativeComponent} from 'react-native'
var RnLabel = requireNativeComponent('QLabel',RichTextIOS);
export default class RichTextIOS extends Component{
    static  propTypes = {
        title: PropTypes.string,
        tags: PropTypes.array,
        model: PropTypes.object,
    }
    render(){
        return (
            <RnLabel {...this.props}/>
        )
    }
}