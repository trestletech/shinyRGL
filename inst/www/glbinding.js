var glOutputBinding = new Shiny.OutputBinding();
$.extend(glOutputBinding, {
  find: function(scope) {
    return $(scope).find('.shiny-gl-output');
  },
  renderValue: function(el, data) {
    
    if (!data || !data.html){
      return;
    }
    
    $(el).html(data.html);
    
    setTimeout(function() { 
      // check to see whether we're using the old or new RGL function type.
      oldFun = window[data.prefix + "webGLStart"];
      newObj = window[data.prefix + "WebGL"];
      if(typeof oldFun === 'function'){
        oldFun();     
      } else if(typeof newObj === 'object'){
        newObj.start();
        newObj.onZoom(function(zoom){
          Shiny.onInputChange('.clientdata_gl_output_' + el.id + '_zoom', zoom);
        });
        newObj.onFOV(function(fov){
          Shiny.onInputChange('.clientdata_gl_output_' + el.id + '_fov', fov);
        });
        newObj.onPan(function(pan){
          Shiny.onInputChange('.clientdata_gl_output_' + el.id + '_pan', pan.getAsArray());
        });
        
      } else{
        throw new Error("Could not find method of starting WebGL scene.");
      }
        
    }, 0);
    
  }
});
Shiny.outputBindings.register(glOutputBinding, 'shinyRGL.glbinding');

/**
 * Update the GL Size as the widget becomes visible.
 */
$(document).ready(function(){
  $('body').on('shown.sendOutputHiddenState hidden.sendOutputHiddenState', '*',
                 function(){sendGLSize();});
});

$(window).resize(debounce(500, sendGLSize));

// The server needs to know the size of each image and plot output element,
// in case it is auto-sizing
// Author: Joe Cheng
// https://github.com/rstudio/shiny/blob/master/inst/www/shared/shiny.js
// Modified by: Jeff Allen
function sendGLSize() {
  $('.shiny-gl-output').each(function() {
    if (this.offsetWidth !== 0 || this.offsetHeight !== 0) {
      Shiny.onInputChange('.clientdata_gl_output_' + this.id + '_width', this.offsetWidth);
      Shiny.onInputChange('.clientdata_gl_output_' + this.id + '_height', this.offsetHeight);
    }
  });
}
$(function() {
  // Init Shiny a little later than document ready, so user code can
  // run first (i.e. to register bindings)
  setTimeout(sendGLSize, 1);
});


// Returns a debounced version of the given function.
// Debouncing means that when the function is invoked,
// there is a delay of `threshold` milliseconds before
// it is actually executed, and if the function is
// invoked again before that threshold has elapsed then
// the clock starts over.
//
// For example, if a function is debounced with a
// threshold of 1000ms, then calling it 17 times at
// 900ms intervals will result in a single execution
// of the underlying function, 1000ms after the 17th
// call.
// Author: Joe Cheng
// https://github.com/rstudio/shiny/blob/master/inst/www/shared/shiny.js
  function debounce(threshold, func) {
    var timerId = null;
    var self, args;
    return function() {
      self = this;
      args = arguments;
      if (timerId !== null) {
        clearTimeout(timerId);
        timerId = null;
      }
      timerId = setTimeout(function() {
        timerId = null;
        func.apply(self, args);
      }, threshold);
    };
  }