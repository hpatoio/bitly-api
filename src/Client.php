<?php

namespace Bitly;

use Guzzle\Service\Client as GuzzleClient;
use Guzzle\Service\Description\ServiceDescription;
use Bitly\Plugin\TokenAuthPlugin;
use Bitly\Subscribers\ArrayAggregatorSubscriber;
use Bitly\Subscribers\ResponseStandardizationSubscriber;

class Client extends GuzzleClient
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
