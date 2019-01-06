import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header>
            <h1>Fib App</h1>
            <Link to="/">Home</Link>&nbsp;
            <Link to="/otherpage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib}></Route>
            <Route path="/otherpage" component={OtherPage}></Route>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
