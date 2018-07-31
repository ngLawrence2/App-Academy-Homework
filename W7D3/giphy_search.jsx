import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './actions/giphy_actions.js';
import {receiveSearchGiphys} from './actions/giphy_actions.js';


document.addEventListener('DOMContentLoaded', () => {
  const myStore=configureStore();
  window.store=myStore;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
});
