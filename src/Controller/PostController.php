<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

#[Route('/post')]
class PostController extends AbstractController
{
    #[Route('/', name: 'app_post_index', methods: ['GET', 'POST'])]
    public function index(Request $request, PostRepository $postRepository): Response
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

        return $this->renderForm('post/index.html.twig', [
            'posts' => $postRepository->getData(),
            'form' => $form,
        ]);
    }

    #[Route('/new', name: 'app_post_new', methods: ['GET', 'POST'])]
    public function new(Request $request, PostRepository $postRepository): Response
    {
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

    #[Route('/{id}', name: 'app_post_show', methods: ['GET'])]
    public function show(Post $post): Response
    {
        return $this->render('post/show.html.twig', [
            'post' => $post,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_post_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Post $post, PostRepository $postRepository): Response
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

    #[Route('/{id}', name: 'app_post_delete', methods: ['POST'])]
    public function delete(Request $request, Post $post, PostRepository $postRepository): Response
    {

        $postRepository->remove($post, true);

        return $this->renderForm('post/adminpage.html.twig', [
            'posts' => $postRepository->getalldata(),

        ]);
    }

    #[Route('/approve/{id}', name: 'app_post_approve', methods: ['GET', 'POST'])]
    public function approve(Request $request, Post $post, PostRepository $postRepository): Response
    {

        $postRepository->approve($post, $request->request->get('_token'));

        return $this->renderForm('post/adminpage.html.twig', [
            'posts' => $postRepository->getalldata(),

        ]);
    }

    #[Route('/disapprove/{id}', name: 'app_post_disapprove', methods: ['GET', 'POST'])]
    public function disapprove(Request $request, Post $post, PostRepository $postRepository): Response
    {

        $postRepository->disapprove($post, true);

        return $this->renderForm('post/adminpage.html.twig', [
            'posts' => $postRepository->getalldata(),

        ]);
    }


}
