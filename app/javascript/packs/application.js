// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@fortawesome/fontawesome-free/js/all";

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// 追記
window.$ = window.jQuery = require("jquery");
require("packs/raty");

// *要注意！！　テストでブラウザの戻るボタンを無効にしています　21/03/21~
history.pushState(null, null, location.href);
window.addEventListener("popstate", (e) => {
  history.go(1);
});

// history.pushState(null, null, null);
// $(window).on("popstate", function (event) {
//   if (!event.originalEvent.state) {
//     history.pushState(null, null, null);
//     return;
//   }
// });
