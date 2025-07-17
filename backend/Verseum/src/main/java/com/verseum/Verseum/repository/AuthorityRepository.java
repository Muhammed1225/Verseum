package com.verseum.Verseum.repository;

import com.verseum.Verseum.model.AuthorityEntity;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface AuthorityRepository extends JpaRepository<AuthorityEntity, Integer> {

    @Query(value = "insert into authorities (username, authority) select ?1, role from authority_list where author = true",
        nativeQuery = true)
    @Modifying
    void addAuthor(String username);

    @Query(value = "insert into authorities (username, authority) select ?1, role from authority_list where reader = true",
            nativeQuery = true)
    @Modifying
    void addReader(String username);

}
