package com.verseum.Verseum.service.impl;

import com.verseum.Verseum.dto.request.AuthorAddRequest;
import com.verseum.Verseum.dto.request.ReaderAddRequest;
import com.verseum.Verseum.repository.AuthorityRepository;
import com.verseum.Verseum.service.inter.AuthorityInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorityService implements AuthorityInter {

    @Autowired
    private AuthorityRepository repository;

    @Override
    public void addAuthor(AuthorAddRequest request) {
        repository.addAuthor(request.getUsername());
    }

    @Override
    public void addReader(ReaderAddRequest request) {
        repository.addReader(request.getUsername());
    }
}
