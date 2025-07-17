package com.verseum.Verseum.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ReaderAddRequest {

    @NotBlank
    @NotNull
    @Size(min = 5, max = 30)
    private String username;

    @NotBlank
    @NotNull
    @Size(min = 8, max = 30)
    private String password;

    @NotBlank
    @NotNull
    @Size(min = 3)
    private String firstName;

    @NotBlank
    @NotNull
    private String lastName;

    @Email
    @NotNull
    @NotBlank
    private String email;

}
