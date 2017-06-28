// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Monitors
var monTbolt  = "2560x1600";
var monLaptopWork = "1440x900";
var monLaptopHome = "1280x800";

// Operations
var lapFullWork = S.op("move", {
  "screen" : monLaptopWork,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var lapFullHome = S.op("move", {
  "screen" : monLaptopHome,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltFull = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltChrome = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX+screenSizeX*3/14",
  "y" : "screenOriginY+screenSizeY/5",
  "width" : "screenSizeX*4/7",
  "height" : "screenSizeY*4/6",
});

// Layout hashes
var lapFullHashWork = {
  "operations" : [lapFullWork],
  "ignore-fail" : true,
  "repeat" : true
};
var lapFullHashHome = {
  "operations" : [lapFullHome],
  "ignore-fail" : true,
  "repeat" : true
};
var tboltChromeHash = {
  "operations" : [tboltChrome],
  "sort-title" : true,
  "ignore-fail" : true,
  "repeat" : true
};
var tboltFullHash = {
  "operations" : [tboltFull],
  "sort-title" : true,
  "repeat" : true
};

// 2 monitor layout Work
var twoMonitorLayoutWork = S.lay("twoMonitorWork", {
  "Google Chrome" : tboltChromeHash,
  "iTerm2" : tboltFullHash,
  "Slack" : lapFullHashWork,
  "Spotify" : tboltChromeHash
});

// 2 monitor layout Home
var twoMonitorLayoutHome = S.lay("twoMonitorHome", {
  "Google Chrome" : tboltChromeHash,
  "iTerm2" : tboltFullHash,
  "Slack" : lapFullHashHome,
  "Spotify" : lapFullHashHome
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "Google Chrome" : lapFullHashWork,
  "iTerm2" : lapFullHashWork,
  "Slack" : lapFullHashWork,
  "Spotify" : lapFullHashWork
});

// Defaults
S.def([monLaptopWork, monTbolt], twoMonitorLayoutWork);
S.def([monLaptopHome, monTbolt], twoMonitorLayoutHome);
S.def(1, oneMonitorLayout);

// Layout Operations
var twoMonitorWork = S.op("layout", { "name" : twoMonitorLayoutWork });
var twoMonitorHome = S.op("layout", { "name" : twoMonitorLayoutHome });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });

var universalLayout = function() {
  if (S.screenCount() === 2) {
    slate.eachScreen(function(screen){
      var rect = screen.rect();
      var name = rect.width + "x" + rect.height;
      if (name == monLaptopHome){
        twoMonitorHome.run();
        return;
      } else if (name == monLaptopWork) {
        twoMonitorWork.run();
        return;
      }
    });
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};

var gridHash = {
  "grids" : {
     monTbolt: {
      "width" : 12,
      "height" : 14
    },
    monLaptopWork : {
      "width" : 6,
      "height" : 7
    },
    monLaptopHome : {
      "width" : 6,
      "height" : 7
    }
  },
  "padding" : 2
}

// var tboltLeft = tboltFull.dup({ "width" : "screenSizeX/3" });
// var tboltMid = tboltLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
// var tboltRight = tboltLeft.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" });
// var tboltLeftTop = tboltLeft.dup({ "height" : "screenSizeY/2" });
// var tboltLeftBot = tboltLeftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
// var tboltMidTop = tboltMid.dup({ "height" : "screenSizeY/2" });
// var tboltMidBot = tboltMidTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
// var tboltRightTop = tboltRight.dup({ "height" : "screenSizeY/2" });
// var tboltRightBot = tboltRightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  "padEnter:ctrl" : universalLayout,
  "0:cmd" : universalLayout,

  // Basic Location Bindings
  // "pad0:ctrl" : lapChat,
  // "[:ctrl" : lapChat,
  // "pad.:ctrl" : lapMain,
  // "]:ctrl" : lapMain,
  // "pad1:ctrl" : tboltLeftBot,
  // "pad2:ctrl" : tboltMidBot,
  // "pad3:ctrl" : tboltRightBot,
  // "pad4:ctrl" : tboltLeftTop,
  // "pad5:ctrl" : tboltMidTop,
  // "pad6:ctrl" : tboltRightTop,
  // "pad7:ctrl" : tboltLeft,
  // "pad8:ctrl" : tboltMid,
  // "pad9:ctrl" : tboltRight,
  // "pad=:ctrl" : tboltFull,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"right:ctrl" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
  //"left:ctrl" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
  //"up:ctrl" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
  //"down:ctrl" : S.op("resize", { "width" : "+0", "height" : "+10%" }),
  //"right:alt" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  //"left:alt" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
  //"up:alt" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  //"down:alt" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "right:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  // "left:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  // "up:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  // "down:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "right:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  // "left:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  // "up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  // "down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),

  // Throw Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "pad1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "pad2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "pad3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

  // Focus Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "k:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "up:cmd" : S.op("focus", { "direction" : "up" }),
  // "down:cmd" : S.op("focus", { "direction" : "down" }),
  // "up:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "down:cmd;alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  // "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid", gridHash)
});

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
