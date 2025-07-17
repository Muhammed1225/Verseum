package com.verseum.Verseum.controller;

import com.verseum.Verseum.dto.request.AuthorAddRequest;
import com.verseum.Verseum.exception.MyException;
import com.verseum.Verseum.service.impl.AuthorService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/authors")
public class AuthorController {

    @Autowired
    private AuthorService service;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<String> addAuthor(@Valid @RequestBody AuthorAddRequest request, BindingResult br) {
        if (br.hasErrors()) {
            throw new MyException("There is a validation error!", br);
        }
        service.addAuthor(request);
        return ResponseEntity.ok("Author was created");
    }

}
