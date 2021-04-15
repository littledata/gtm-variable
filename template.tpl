﻿___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Littledata Shopify Variables",
  "description": "Returns values from the Littledata Shopify App integration. This e-commerce product information from the Shopify store can be sent to third party trackers (Instagram, Facebook, Pinterest, etc.)",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "radio_chooseOutput",
    "displayName": "Choose your output",
    "radioItems": [
      {
        "value": "pdp",
        "displayValue": "Product Detail Page",
        "subParams": [
          {
            "type": "SELECT",
            "name": "dropDown_individualProduct_properties",
            "displayName": "",
            "selectItems": [
              {
                "value": "brand",
                "displayValue": "Brand"
              },
              {
                "value": "category",
                "displayValue": "Category"
              },
              {
                "value": "compare_at_price",
                "displayValue": "Compare at Price"
              },
              {
                "value": "id",
                "displayValue": "SKU"
              },
              {
                "value": "image_url",
                "displayValue": "Image URL"
              },
              {
                "value": "handle",
                "displayValue": "Handle"
              },
              {
                "value": "list_name",
                "displayValue": "List Name"
              },
              {
                "value": "name",
                "displayValue": "Name"
              },
              {
                "value": "price",
                "displayValue": "Price"
              },
              {
                "value": "shopify_product_id",
                "displayValue": "ID"
              },
              {
                "value": "shopify_variant_id",
                "displayValue": "Variant ID"
              },
              {
                "value": "variant",
                "displayValue": "Variant Name"
              },
              {
                "value": "object",
                "displayValue": "Whole Product Object"
              }
            ],
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "subParams": [
              {
                "type": "GROUP",
                "name": "group1",
                "displayName": "Additional options",
                "groupStyle": "ZIPPY_OPEN",
                "subParams": [
                  {
                    "type": "CHECKBOX",
                    "name": "checkbox_convertToNumber",
                    "checkboxText": "Convert to a number",
                    "simpleValueType": true,
                    "enablingConditions": [
                      {
                        "paramName": "dropDown_individualProduct_properties",
                        "paramValue": "price",
                        "type": "EQUALS"
                      },
                      {
                        "paramName": "dropDown_individualProduct_properties",
                        "paramValue": "compare_at_price",
                        "type": "EQUALS"
                      }
                    ]
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "dropDown_individualProduct_properties",
                    "paramValue": "price",
                    "type": "EQUALS"
                  },
                  {
                    "paramName": "dropDown_individualProduct_properties",
                    "paramValue": "compare_at_price",
                    "type": "EQUALS"
                  }
                ],
                "help": "Littledata sends this value as a String by default. Tick the box below if you want to send it as a Number"
              }
            ]
          }
        ],
        "help": "Information about an individual Product"
      },
      {
        "value": "plp",
        "displayValue": "Product List Page",
        "help": "Information about all of the visible Products on a listing page. Returns an array of objects"
      },
      {
        "value": "currencyCode",
        "displayValue": "Store Currency",
        "help": "Currency ISO code. Returns a string"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Initiation (APIs and variables)
const copyFromWindow = require('copyFromWindow');
// const log = require('logToConsole'); used only for dev purposes
const makeNumber = require('makeNumber');
let group = data.radio_chooseOutput;
let selectedDetail = data.dropDown_individualProduct_properties;
let convertToNumber = data.checkbox_convertToNumber;
let value;

// Getting LittledataLayer object from Window
const littledataLayer = copyFromWindow('LittledataLayer.ecommerce');

// Checking which option (radio button) was chosen
if (group === 'pdp') {
 // if Product Detail Page was chosen
 if (selectedDetail === 'object') {
   // If Whole object option was chosen
   value = littledataLayer.detail;
 }
  else {
    // any other individual option was chosen
    if (convertToNumber === true) {
      // if it was Price or Compare at Price, and a conversion to a number is chosen
      value = littledataLayer.detail[selectedDetail];
      value = makeNumber(value);
    }
    else {
      value = littledataLayer.detail[selectedDetail];
    } 
  }
  
}
else if (group === 'plp') {
  // if Product List Page was chosen
  value = littledataLayer.impressions;
}
else {
  // if Currency was chosen
  value = littledataLayer.currencyCode;
}

// Return appropriate value, according to user selection.  Return undefined if not available
return value;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "LittledataLayer.ecommerce"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 4/15/2021, 1:05:26 PM


