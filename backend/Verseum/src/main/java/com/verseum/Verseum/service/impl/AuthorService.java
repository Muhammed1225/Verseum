package com.verseum.Verseum.service.impl;

import com.verseum.Verseum.dto.request.AuthorAddRequest;
import com.verseum.Verseum.model.AuthorEntity;
import com.verseum.Verseum.repository.AuthorRepository;
import com.verseum.Verseum.service.inter.AuthorInter;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorService implements AuthorInter {

    @Autowired
    private AuthorRepository repository;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private ModelMapper mapper;

    @Override
    public void addAuthor(AuthorAddRequest request) {
        AuthorEntity entity = new AuthorEntity();
        mapper.map(request, entity);
        repository.save(entity);
        userService.addAuthor(request);
        authorityService.addAuthor(request);
    }
}
