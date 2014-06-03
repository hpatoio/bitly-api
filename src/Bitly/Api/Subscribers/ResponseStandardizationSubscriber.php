<?php

namespace Bitly\Api\Subscribers;

use Guzzle\Common\Event;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 *  Organize the response to better fit REST standard.
 */
class ResponseStandardizationSubscriber implements EventSubscriberInterface
{

    public static function getSubscribedEvents()
    {
        return array('request.complete' => array('StandardizeResponse', 255));
    }

    /**
     * @param Event $event
     *                     - Bitly always returns 200 as status code. This set the correct status code for responses.
     *                     - In case of a valid response from Bitly API we just return the 'data' section of the original response
     */
    public function standardizeResponse(Event $event)
    {

        $full_json_response = $event['response']->json();

        if ($full_json_response['status_code'] <= 400)
            return $event['response']->setBody(json_encode($full_json_response['data']));

        $event['response']->setStatus($full_json_response['status_code'], $full_json_response['status_txt']);

    }
}
