package com.verseum.Verseum.repository;

import com.verseum.Verseum.model.ReaderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReaderRepository extends JpaRepository<ReaderEntity, Integer> {
}
