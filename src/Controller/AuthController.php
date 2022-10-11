<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use App\Repository\PostRepository;
use App\Entity\User;
use Symfony\Component\HttpFoundation\RedirectResponse;
use App\Controller\PostController;

class AuthController extends AbstractController
{
    #[Route(path: '/', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        // var_dump( $lastUsername);exit;
        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }


    #[Route(path: '/home', name: 'home')]
    public function role(PostRepository $postRepository): Response
    {


        $role = $this->getUser()->getRole();

        if ($role == 1) {

            // return $this->redirectToRoute('app_post_adminpage', [], );
            return $this->renderForm('post/adminpage.html.twig', [
                'posts' => $postRepository->getalldata(),

            ]);
        } else {

            return $this->redirectToRoute('app_post_index', [],);
        }
    }


    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}
