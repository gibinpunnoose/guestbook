<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use App\Repository\PostRepository;
use App\Repository\UserRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;
use Symfony\Component\Security\Core\User\UserInterface;

#[Route('/post')]
class PostController extends AbstractController
{

    #[Route('/', name:'app_post_index', methods:['GET', 'POST'])]
function index(Request $request,UserInterface $user, PostRepository $postRepository,  UserRepository $userRepository, PaginatorInterface $paginator, ): Response
    {

    $post = new Post();
    $form = $this->createForm(PostType::class, $post);

    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $file = $post->getImage();
        if ($file && !empty($file)) {
            $fileName = md5(uniqid()) . '.' . $file->guessExtension();
            $file->move($this->getParameter('kernel.project_dir') . '/public/uploads', $fileName);
            $post->setImage($fileName);
        }

        $postRepository->save($post, true);

        return $this->redirectToRoute('app_post_index', [], Response::HTTP_SEE_OTHER);
    }

    $query = $postRepository->getData();
    
    $userName = $user->getFirstName(); 


    $pagination = $paginator->paginate(
        $query, /* query NOT result */
        $request->query->getInt('page', 1), /*page number*/
        2/*limit per page*/
    );

    return $this->renderForm('post/index.html.twig', [
        'form' => $form,
        'posts' => $pagination,
        'username' => $userName,
    ]);
}

#[Route('/new', name:'app_post_new', methods:['GET', 'POST'])]
function new (Request $request, PostRepository $postRepository): Response{
    $post = new Post();
    $form = $this->createForm(PostType::class, $post);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $file = $post->getImage();
        $fileName = md5(uniqid()) . '.' . $file->guessExtension();
        $file->move($this->getParameter('kernel.project_dir') . '/public/uploads', $fileName);
        $post->setImage($fileName);
        $postRepository->save($post, true);

        return $this->redirectToRoute('app_post_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->renderForm('post/new.html.twig', [
        'post' => $post,
        'form' => $form,
    ]);
}

#[Route('/{id}', name:'app_post_show', methods:['GET'])]
function show(Post $post): Response
    {
    return $this->render('post/show.html.twig', [
        'post' => $post,
    ]);
}

#[Route('/{id}/edit', name:'app_post_edit', methods:['GET', 'POST'])]
function edit(Request $request, Post $post, PostRepository $postRepository): Response
    {
    $form = $this->createForm(PostType::class, $post);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $postRepository->save($post, true);

        return $this->redirectToRoute('app_post_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->renderForm('post/edit.html.twig', [
        'post' => $post,
        'form' => $form,
    ]);
}

#[Route('/{id}', name:'app_post_delete', methods:['POST'])]
function delete(Request $request, Post $post, PostRepository $postRepository): Response
    {

    $postRepository->remove($post, true);

    return $this->redirectToRoute('home');

}

#[Route('/approve/{id}', name:'app_post_approve', methods:['GET', 'POST'])]
function approve(Request $request, Post $post, PostRepository $postRepository): Response
    {

    $postRepository->approve($post, $request->request->get('_token'));

    return $this->redirectToRoute('home');
}

#[Route('/disapprove/{id}', name:'app_post_disapprove', methods:['GET', 'POST'])]
function disapprove(Request $request, Post $post, PostRepository $postRepository): Response
    {

    $postRepository->disapprove($post, true);

    return $this->redirectToRoute('home');

}

}
