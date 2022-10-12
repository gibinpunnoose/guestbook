<?php

namespace App\Test\Controller;

use App\Entity\Post;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class PostControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private PostRepository $repository;
    private string $path = '/post/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->repository = static::getContainer()->get('doctrine')->getRepository(Post::class);

        foreach ($this->repository->findAll() as $object) {
            $this->repository->remove($object, true);
        }
    }

    // public function testIndex(): void
    // {
    //     $crawler = $this->client->request('GET', $this->path);

    //     self::assertResponseStatusCodeSame(200);
    //     self::assertPageTitleContains('Post index');

    //     // Use the $crawler to perform additional assertions e.g.
    //     // self::assertSame('Some text on the page', $crawler->filter('.p')->first());
    // }

    public function testNew(): void
    {
        $originalNumObjectsInRepository = count($this->repository->findAll());

        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'post[user_id]' => '1',
            'post[comments]' => 'Test comment',
            'post[image]' => 'Testing',
            'post[created_date]' => date("Y-m-d H:i:s"),
            'post[status]' => '0',
        ]);

        self::assertResponseRedirects('/post/');

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Post();
        $fixture->setUserId('2');
        $fixture->setComments('test comment');
        $fixture->setImage('My Title');
        $fixture->getCreatedDate(date("Y-m-d H:i:s"));
        $fixture->setStatus('0');

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Post');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Post();
        $fixture->setUserId(1);
        $fixture->setComments('test comment');
        $fixture->setImage('My Title');
        $fixture->setCreatedDate(date("Y-m-d H:i:s"));
        $fixture->setStatus(0);

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'post[status]' => 1,
        ]);

        self::assertResponseRedirects('/post/');

        $fixture = $this->repository->findAll();

        self::assertSame('Something New', $fixture[0]->getUserid());
        self::assertSame('Something New', $fixture[0]->getComments());
        self::assertSame('Something New', $fixture[0]->getImage());
        self::assertSame('Something New', $fixture[0]->getCreateddate());
        self::assertSame('Something New', $fixture[0]->getStatus());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();

        $originalNumObjectsInRepository = count($this->repository->findAll());

        $fixture = new Post();
        $fixture->setUserId('My Title');
        $fixture->setComments('My Title');
        $fixture->setImage('My Title');
        $fixture->setCreatedDate('My Title');
        $fixture->setStatus('My Title');

        $this->repository->add($fixture, true);

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertSame($originalNumObjectsInRepository, count($this->repository->findAll()));
        self::assertResponseRedirects('/post/');
    }
}
