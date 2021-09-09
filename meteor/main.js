import { Template } from 'meteor/templating';
import { ReactiveVar } from 'meteor/reactive-var';

import './main.html';

Template.froala.rendered = function () {
  new FroalaEditor('.editor');
};

