import { RECEIVE_CONNECTIONS, RECEIVE_CONNECTION, REMOVE_CONNECTION, CLEAR_CONNECTIONS } from '../actions/connection_actions';

const connectionReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_CONNECTIONS:
        return action.connections;
  
    case RECEIVE_CONNECTION:
      nextState[action.connection.id] = action.connection
      return nextState;
    
    case REMOVE_CONNECTION:
      delete nextState[action.connectionId]
      return nextState;

    case CLEAR_CONNECTIONS:
      return {};

    default:
      return state;
  }
}

export default connectionReducer;