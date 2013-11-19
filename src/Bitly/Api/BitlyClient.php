<?php

namespace Bitly\Api;

use Guzzle\Service\Client;
use Guzzle\Service\Description\ServiceDescription;
use Bitly\Api\Plugin\TokenAuthPlugin;
use Bitly\Api\Subscribers\ArrayAggregatorSubscriber;
use Bitly\Api\Subscribers\ResponseStandardizationSubscriber;

class BitlyClient extends Client
{

   public function __construct($access_token)
   {
        parent::__construct();

     // Set the service description
        $this->setDescription(ServiceDescription::factory(__DIR__.'/Resources/bitly.json'));

    $this->addSubscriber(new TokenAuthPlugin($access_token));
    $this->addSubscriber(new ArrayAggregatorSubscriber());
    $this->addSubscriber(new ResponseStandardizationSubscriber());

    }

}
