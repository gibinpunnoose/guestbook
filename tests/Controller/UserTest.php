<?php

namespace App\Tests;

use App\Controller\RegistrationController;
use App\Entity\User;


use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function test_user(): void
    {
        $data = [
            'first_name' => 'gibin',
            'last_name' => 'p',
            'email_id' => 'gibinpunnoosetest@gmail.com',
            'role' => '1'
            ];

        $user = new User();

        $form = $this->createMock( RegistrationController::class, $user);

      


        $user->setFirstName($data['first_name']);
        $user->setLastName($data['last_name']);
        $user->setEmailId($data['email_id']);
        $user->setRole($data['role']);


        $this->assertEquals($user->getFirstName(), $user->getFirstName());
        $this->assertEquals($user->getLastName(), $user->getLastName());
        $this->assertEquals($user->getEmailId(), $user->getEmailId());
        $this->assertEquals($user->getRole(), $user->getRole());
    }
}
