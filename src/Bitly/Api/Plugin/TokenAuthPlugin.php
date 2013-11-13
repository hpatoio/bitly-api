<?php

namespace Bitly\Api\Plugin;

use Guzzle\Common\Event;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Adds a token to all requests sent from a client.
 */
class TokenAuthPlugin implements EventSubscriberInterface
{
    private $token;

    /**
     * @param string $token
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    public static function getSubscribedEvents()
    {
        return array('command.before_prepare' => array('onBeforePrepare', 255));
    }

    /**
     * Add token
     *
     * @param Event $event
     */
    public function onBeforePrepare(Event $event)
    {
        $event['command']->set('access_token', $this->token);
    }
}
