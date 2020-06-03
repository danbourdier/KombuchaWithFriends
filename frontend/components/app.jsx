import React from 'react';
import { Route, Switch } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';

import SplashContainer from './splash/splash_container';
import SignupFormContainer from './session/signup_form_container';
import LoginFormContainer from './session/login_form_container';
import NavBarContainer from './navbar/navbar_container';

const App = () => (
  <div>
    <header>
      <h1> TriHarder </h1>
      <NavBarContainer />
      <h3>Learn about TriHarder's COVID-19 Pledge</h3>
    </header>
    
    <Switch>
      <Route exact path="/" component={SplashContainer} />
      <AuthRoute exact path="/login" component={LoginFormContainer} />
      <AuthRoute exact path="/signup" component={SignupFormContainer} />
    </Switch>

  </div>
);

export default App;