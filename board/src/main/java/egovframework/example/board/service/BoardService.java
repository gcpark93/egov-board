/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.board.service;

import java.util.List;

/**
 * @Class Name : BoardService.java
 * @Description : BoardService Class
 * @Modification Information
 * @
 * @  수정일                수정자               수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.12.18   박기철               최초생성
 *
 * @author 박기철
 * @since 2019. 12.28
 * @version 1.0
 * @see
 *
 *  Copyright (C) by gcpark All right reserved.
 */
public interface BoardService {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertBoard(BoardVO vo) throws Exception;

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void updateBoard(BoardVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteBoard(BoardVO vo) throws Exception;

	/**
	 * 글의 조회수를 증가한다.
	 * @param vo - 조회수를 증가할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void updateBoardCount(BoardVO vo) throws Exception;
	
	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 BoardVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	BoardVO selectBoard(BoardVO vo) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectBoardList(BoardVO vo) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param vo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectBoardListTotCnt(BoardVO vo);
	
	String selectLoginCheck(BoardVO vo);
	
	/**
	 * 댓글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertReply(BoardVO vo) throws Exception;
	
	/**
	 * 댓글 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 VO
	 * @return 댓글 목록
	 * @exception Exception
	 */
	List<?> selectReplyList(BoardVO vo) throws Exception;

	void insertAttach(BoardVO vo) throws Exception;
	
	void deleteAttach(BoardVO vo) throws Exception;
	
	/*첨부파일을 한개이상 올려서 받으려면 List로 받으면 됨*/
	BoardVO selectAttach(BoardVO vo) throws Exception;
}
