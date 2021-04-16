// Initiation (APIs and variables)
const copyFromWindow = require("copyFromWindow");
const makeNumber = require("makeNumber");
const log = require("logToConsole");
let group = data.radio_chooseOutput;
let selectedDetail = data.dropDown_individualProduct_properties;
let convertToNumber = data.checkbox_convertToNumber;
let value;

// Getting LittledataLayer object from Window
const littledataLayer = copyFromWindow("LittledataLayer.ecommerce");

//Check if Littledata app exists on site
if (littledataLayer === undefined) {
  log(
    "In order to use this GTM template on a Shopify store, please install Littledata app first from https://apps.shopify.com/littledata"
  );
} else {
  // Checking which option (radio button) was chosen
  if (group === "pdp" && littledataLayer.detail !== undefined) {
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
  } else if (group === "plp" && littledataLayer.impressions.length !== 0) {
    // if Product List Page was chosen
    value = littledataLayer.impressions;
  } else if (group === "currencyCode") {
    // if Currency was chosen
    value = littledataLayer.currencyCode;
  }
}

// Return appropriate value, according to user selection. Return undefined if not available
return value;
