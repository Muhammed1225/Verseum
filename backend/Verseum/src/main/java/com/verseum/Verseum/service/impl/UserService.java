package com.verseum.Verseum.service.impl;

import com.verseum.Verseum.dto.request.AuthorAddRequest;
import com.verseum.Verseum.dto.request.ReaderAddRequest;
import com.verseum.Verseum.model.UserEntity;
import com.verseum.Verseum.repository.UserRepository;
import com.verseum.Verseum.service.inter.UserInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserInter {

    @Autowired
    private UserRepository repository;

    @Autowired
    private PasswordEncoder encoder;

    @Override
    public void addAuthor(AuthorAddRequest request) {
        UserEntity entity = new UserEntity();
        String encode = encoder.encode(request.getPassword());
        entity.setUsername(request.getUsername());
        entity.setPassword("{bcrypt}" + encode);
        entity.setEnabled(true);
        repository.save(entity);
    }

    @Override
    public void addReader(ReaderAddRequest request) {
        UserEntity entity = new UserEntity();
        String encode = encoder.encode(request.getPassword());
        entity.setUsername(request.getUsername());
        entity.setPassword("{bcrypt}" + encode);
        entity.setEnabled(true);
        repository.save(entity);
    }
}
