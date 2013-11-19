<?php

namespace Test\Bitly\Api;

class BitlyClientTest extends \Guzzle\Tests\GuzzleTestCase
{

    private $bitly_client;

    private $response_error   = '{"status_code": 500,"data": null,"status_txt": "ERROR_TEXT"}';
    private $response_correct = '{"status_code": 200,"data": null,"status_txt": "OK"}';

    public function setup()
    {
        $this->bitly_client = new \Bitly\Api\BitlyClient("non_existing_token_just_for_test");
    }

    private function initBitlyClient($data)
    {

        $bitlyResponse = new \Guzzle\Http\Message\Response(200);
        $bitlyResponse->setBody($data);

        $plugin = new \Guzzle\Plugin\Mock\MockPlugin();
        $plugin->addResponse($bitlyResponse);

        $this->bitly_client->addSubscriber($plugin);

    }

    public function testAccessTokenIsAddedToRequest()
    {
        $this->initBitlyClient($this->response_error);
        $command = $this->bitly_client->getCommand('Highvalue', array("limit" => 3));
        $this->assertEquals($command->prepare()->getQuery()->get("access_token"), "non_existing_token_just_for_test");
    }

    public function testExceptionOnErrorResponse()
    {

        $this->initBitlyClient($this->response_error);

        try {
            $this->bitly_client->Highvalue(array("limit" => 2));
        } catch ( \Guzzle\Http\Exception\ServerErrorResponseException $expected ) {
            return;
        }

        $this->fail('An expected exception has not been raised.');

    }

}
