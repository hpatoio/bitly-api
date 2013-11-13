<?php

namespace Bitly\Api\Subscribers;

use Guzzle\Common\Event;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Guzzle\Http\QueryAggregator\CommaAggregator;

/**
 *  Change array aggregation method.
 *  Docs: http://docs.guzzlephp.org/en/latest/http-client/request.html#query-string-parameters
 *  Info: https://github.com/guzzle/guzzle/issues/313
 * 
 */
class ArrayAggregatorSubscriber implements EventSubscriberInterface
{

    public static function getSubscribedEvents()
    {
        return array('command.after_prepare' => array('changeAggregator', 255));
    }

    /**
     * Change aggregator
     *
     * @param Event $event
     */
    public function changeAggregator(Event $event)
    {
        $event['command']->getRequest()->getQuery()->setAggregator(new CommaAggregator());
    }
}
