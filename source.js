// Initiation (APIs and variables)
const copyFromWindow = require("copyFromWindow");
// const log = require('logToConsole'); used only for dev purposes
const makeNumber = require("makeNumber");
let group = data.radio_chooseOutput;
let selectedDetail = data.dropDown_individualProduct_properties;
let convertToNumber = data.checkbox_convertToNumber;
let value;

// Getting LittledataLayer object from Window
const littledataLayer = copyFromWindow("LittledataLayer.ecommerce");

// Checking which option (radio button) was chosen
if (group === "pdp") {
  // if Product Detail Page was chosen
  if (selectedDetail === "object") {
    // If Whole object option was chosen
    value = littledataLayer.detail;
  } else {
    // any other individual option was chosen
    if (convertToNumber === true) {
      // if it was Price or Compare at Price, and a conversion to a number is chosen
      value = littledataLayer.detail[selectedDetail];
      value = makeNumber(value);
    } else {
      value = littledataLayer.detail[selectedDetail];
    }
  }
} else if (group === "plp") {
  // if Product List Page was chosen
  value = littledataLayer.impressions;
} else {
  // if Currency was chosen
  value = littledataLayer.currencyCode;
}

// Return appropriate value, according to user selection.  Return undefined if not available
return value;
