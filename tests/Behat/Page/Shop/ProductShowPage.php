<?php

declare(strict_types=1);

namespace Tests\Nedac\SyliusTemporarilyOutOfStockPlugin\Behat\Page\Shop;

final class ProductShowPage extends AbstractProductPage implements ProductShowPageInterface
{
    public function isRibbonDisplayed(string $ribbonText): bool
    {
        $ribbonElement = $this->getDocume