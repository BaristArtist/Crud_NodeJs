<?php

declare(strict_types=1);

namespace Tests\Nedac\SyliusTemporarilyOutOfStockPlugin\Behat\Page\Shop;

use FriendsOfBehat\PageObjectExtension\Page\SymfonyPage;

abstract class AbstractProductPage extends SymfonyPage
{
    public function productCardHasRibbonWithText(string $productName, string $ribbonText): bool
    {
        $ribbonElement = $this->getDocument()->find(
            'xpath',
         