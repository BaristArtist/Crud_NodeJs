<?php

declare(strict_types=1);

namespace Nedac\SyliusTemporarilyOutOfStockPlugin\Doctrine\Dql;

use Doctrine\ORM\Query\AST\ASTException;
use Doctrine\ORM\Query\AST\Functions\FunctionNode;
use Doctrine\ORM\Query\AST\Subselect;
use Doctrine\ORM\Query\Lexer;
use Doctrine\ORM\Query\Parser;
use Doctrine\ORM\Query\SqlWalker;

/**
 * FirstFunction ::=
 *     "FIRST" "(" Subselect ")"
 */
final class FirstFunction extends Function