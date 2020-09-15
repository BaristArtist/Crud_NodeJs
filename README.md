This plugin adds a ribbon clarifying that a product is out of stock to the product cards and main image on the product detail page.

![Product Card](product_card.png)
![Product Detail](product_detail.png)

##### Supported Sylius versions:
<table>
    <tr><td>1.10</td></tr>
</table>


> **_NOTE:_** *This plugin requires PHP 7.4 or up*

#### Installation:

1. Install using composer:
    ```bash
    composer require nedac/sylius-temporarily-out-of-stock-plugin
    ```

2. If the `ProductRepository` is overridden in the project, then make sure it uses th