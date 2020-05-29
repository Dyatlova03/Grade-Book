package com.dyatlova.security.model;

import com.dyatlova.dao.entity.BaseEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "users")
@Data
public class User extends BaseEntity {

    @Column
    private String username;

    @Column
    private String password;

    @Transient
    private String confirmPassword;

    @ManyToMany
            @JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

}
