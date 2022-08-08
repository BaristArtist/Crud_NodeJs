<?php

declare(strict_types=1);

namespace Nedac\SyliusTemporarilyOutOfStockPlugin\Repository;

use Doctrine\ORM\QueryBuilder;
use Sylius\Component\Core\Model\ChannelInterface;
use Sylius\Component\Core\Model\TaxonInterface;

/**
 * @method QueryBuilder createQueryBuilder(string $alias, ?string $indexBy = null)
 */
trait ProductRepositoryTrait
{
    /**
     * @param array<string, string> $sorting
     */
    public function createShopListQueryBuilder(
        ChannelInterface $channel,
        TaxonInterface $taxon,
        string $locale,
        array $sorting = [],
        bool $includeAllDescendants = false
    ): QueryBuilder {
        $queryBuilder = $this->createQueryBuilder('o')
            ->dis