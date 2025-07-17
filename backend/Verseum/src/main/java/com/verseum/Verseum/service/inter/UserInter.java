package com.verseum.Verseum.service.inter;

import com.verseum.Verseum.dto.request.AuthorAddRequest;
import com.verseum.Verseum.dto.request.ReaderAddRequest;

public interface UserInter {
    void addAuthor(AuthorAddRequest request);

    void addReader(ReaderAddRequest request);
}
