<?php

namespace Bitly\Api;

use Guzzle\Service\Client;
use Guzzle\Service\Description\ServiceDescription;
use Bitly\Api\Plugin\TokenAuthPlugin;
use Bitly\Api\Subscribers\ArrayAggregatorSubscriber;

class BitlyClient extends Client
{

   public static function factory($config = array())
    {

        $client = new self();

 	// Set the service description
        $client->setDescription(ServiceDescription::factory(__DIR__.'/Resources/bitly.json'));

	$client->addSubscriber(new TokenAuthPlugin($config['access_token']));
	$client->addSubscriber(new ArrayAggregatorSubscriber());

        return $client;
    }

}
