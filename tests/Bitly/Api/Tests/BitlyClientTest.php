<?php

namespace Test\Bitly\Api;

class BitlyClientTest extends \Guzzle\Tests\GuzzleTestCase
{
    
    private $bitly_client;
    
    public function setup() {
        $this->bitly_client = new \Bitly\Api\BitlyClient("non_existing_token_just_for_test");
    }
    
    public function testAccessTokenIsCorrect()
    {
        $command = $this->bitly_client->getCommand('Highvalue', array("limit" => 3));
        $this->assertEquals($command->prepare()->getQuery()->get("access_token"), "non_existing_token_just_for_test");
    }
    
}