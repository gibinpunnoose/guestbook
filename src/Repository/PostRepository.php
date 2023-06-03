<?php

namespace App\Repository;

use App\Entity\Post;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Post>
 *
 * @method Post|null find($id, $lockMode = null, $lockVersion = null)
 * @method Post|null findOneBy(array $criteria, array $orderBy = null)
 * @method Post[]    findAll()
 * @method Post[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PostRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Post::class);
    }

    public function save(Post $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Post $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function approve(Post $entity,): void
    {

        $updateEtat = $this->createQueryBuilder('p')
            ->update(Post::class, 'p')
            ->set('p.status', 1)
            ->where('p.id =' . $entity->getId())
            ->getQuery();
        $updateEtat->execute();
    }


    public function disapprove(Post $entity, bool $flush = false)
    {

        $updateEtat = $this->createQueryBuilder('p')
            ->update(Post::class, 'p')
            ->set('p.status', 0)
            ->where('p.id =' . $entity->getId())
            ->getQuery();
        $updateEtat->execute();
    }


    public function getalldata(string $pattern = null)
    {
        return $this->getEntityManager()
            ->createQueryBuilder('s')
            ->select('p.comments,u.email_id,p.id,p.image,p.status,p.created_date')
            ->from('App\Entity\User', 'u')
            ->Join('App\Entity\Post', 'p', 'WITH', 'p.user_id = u.id')
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getArrayResult();
    }

    public function getData(string $pattern = null)
    {
        return $this->getEntityManager()
            ->createQueryBuilder('s')
            ->select('p.comments,u.first_name,p.id,p.image,p.created_date')
            ->from('App\Entity\User', 'u')
            ->Join('App\Entity\Post', 'p', 'WITH', 'p.user_id = u.id')
            ->where('p.status = 1')
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getArrayResult();
    }

}
