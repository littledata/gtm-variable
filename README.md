# Google Tag Manager variable template for Shopify

This template is listed in the Google Tag Manager (GTM) [Community Template Gallery](https://tagmanager.google.com/gallery/#/owners/littledata/templates/gtm-variable) for use in conjuction with the LittledataLayer generated by Littledata's [Shopify App](https://apps.shopify.com/littledata).

Full documentation of the LittledataLayer is on [Littledata's help centre](https://blog.littledata.io/help/posts/gtm-and-google-analytics-data-layer-for-shopify/).

## Available variables

### Product details page

Product properties available

| Property               | Description                                     | Property Type |
| ---------------------- | ----------------------------------------------- | ------------- |
| `Brand`                | The brand of the product (Shopify `vendor`)     | String        |
| `Category`             | The category of the product (defaults to `all`) | String        |
| `Compare At Price`     | The product price before any discount           | String \*     |
| `Image URL`            | The URL of the first product image              | String        |
| `Handle`               | The Shopify product handle (used in URL)        | String        |
| `Name`                 | The product name                                | String        |
| `Price`                | The product price                               | String \*     |
| `Product ID`           | Shopify product ID                              | String        |
| `Quantity`             | The quantity of products                        | Integer       |
| `SKU`                  | The product SKU                                 | String        |
| `Variant Name`         | The product variant name                        | String        |
| `Variant ID`           | The Shopify variant ID                          | String        |
| `Whole Product Object` | An object with all of the above raw properties  | Object        |

\* Can be converted to a number

### Product listing page

Information about all of the [visible products](https://blog.littledata.io/help/posts/tracking-product-list-views-and-clicks/) on a listing page. Returns an array of objects, with the above properties.

### Store Currency

Currency ISO code. Returns a string.
