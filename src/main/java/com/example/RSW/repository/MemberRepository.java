package com.example.RSW.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.RSW.vo.Article;
import com.example.RSW.vo.Member;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MemberRepository {

	public int doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);

	public Member getMemberById(int id);

	public int getLastInsertId();

	public Member getMemberByLoginId(String loginId);

	public Member getMemberByNameAndEmail(String name, String email);

}