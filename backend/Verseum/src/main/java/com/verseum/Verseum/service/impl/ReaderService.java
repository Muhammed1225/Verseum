package com.verseum.Verseum.service.impl;

import com.verseum.Verseum.dto.request.ReaderAddRequest;
import com.verseum.Verseum.model.ReaderEntity;
import com.verseum.Verseum.repository.ReaderRepository;
import com.verseum.Verseum.service.inter.ReaderInter;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReaderService implements ReaderInter {

    @Autowired
    private ReaderRepository repository;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private ModelMapper mapper;

    @Override
    public void addReader(ReaderAddRequest request) {
        ReaderEntity entity = new ReaderEntity();
        mapper.map(request, entity);
        repository.save(entity);
        userService.addReader(request);
        authorityService.addReader(request);
    }
}
