
package com.example.RSW.repository;

import org.apache.ibatis.annotations.Mapper;

import com.example.RSW.vo.Board;

@Mapper
public interface BoardRepository {

	public Board getBoardById(int id);

}