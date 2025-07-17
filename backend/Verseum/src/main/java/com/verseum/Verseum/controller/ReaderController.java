package com.verseum.Verseum.controller;

import com.verseum.Verseum.dto.request.ReaderAddRequest;
import com.verseum.Verseum.exception.MyException;
import com.verseum.Verseum.service.impl.ReaderService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/readers")
public class ReaderController {

    @Autowired
    private ReaderService service;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<String> addReader(@Valid @RequestBody ReaderAddRequest request, BindingResult br) {
        if (br.hasErrors()) {
            throw new MyException("There is a validation error!", br);
        }
        service.addReader(request);
        return ResponseEntity.ok("Reader was created");
    }

}
