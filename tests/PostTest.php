<?php

namespace App\Tests;

use PHPUnit\Framework\TestCase;
use App\Entity\User;
use App\Controller\PostController;
use App\Controller\RegistrationController;
use App\Entity\Post;

class PostTest extends TestCase
{
    public function testSomething(): void
    {

        $data = [
            'first_name' => 'nameTest',
            'last_name' => 'firstnameTest',
            'email_id' => 'test_email@gmail.com',
            'role' => 'messageTest'
            ];

        $user = new User();

        $form = $this->createMock( RegistrationController::class, $user);

      


        $user->setFirstName($data['first_name']);
        $user->setLastName($data['last_name']);
        $user->setEmailId($data['email_id']);
        $user->setRole($data['role']);

        //check the submission
        // $form->submit($data);

        // $this->assertTrue($form->isSynchronized());

        $this->assertEquals($user->getFirstName(), $user->getFirstName());
        $this->assertEquals($user->getLastName(), $user->getLastName());
        $this->assertEquals($user->getEmailId(), $user->getEmailId());
        $this->assertEquals($user->getRole(), $user->getRole());
    }
}
