<?php

require_once 'User.php';

class UserTest extends PHPUnit_Framework_TestCase
{
    public function testCreateUser()
    {
        $user = new User('John Doe', 'john.doe@example.com');
        $this->assertInstanceOf('User', $user);
        $this->assertEquals('John Doe', $user->getName());
        $this->assertEquals('john.doe@example.com', $user->getEmail());
    }

    public function testGetName()
    {
        $user = new User('Jane Doe', 'jane.doe@example.com');
        $this->assertEquals('Jane Doe', $user->getName());
    }

    public function testGetEmail()
    {
        $user = new User('Jim Doe', 'jim.doe@example.com');
        $this->assertEquals('jim.doe@example.com', $user->getEmail());
    }
}
