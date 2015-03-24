# -*- coding: utf-8 -*-
require 'rubygems'
require 'dbi'
require 'date'

# 蔵書クラス
class BookInfo
  
end


# 蔵書管理クラス
class BookInfoManager
  def initialize(sqlite_name)
    @db_name = sqlite_name
    @dbh = DBI.connect("DBI:SQLite3:#{@db_name}")
  end

  def initBookInfos
    # db内に同名のテーブルがあったら削除する
    @dbh.do("drop table if exists bookinfos")
    
    # 蔵書データベースのテーブル作成
    @dbh.do("create table bookinfos(
      id            varchar(50)         not null,
      title         varchar(100)        not null,
      author        varchar(100)        not null,
      page          varchar(100)        not null,
      publish_date  datetime            not null,
      primary       key(id));")
  end
  
  def addBookInfo
  end
  
  def listBookInfos
    
  end
  
  def run
    while true
      print "０：蔵書データベース初期化\n"
      print "１：蔵書データの登録\n"
      print "２：蔵書データの表示\ｎ"
      print "９：終了\n"
      print "操作を選んでください：(0, 1, 2, 9):"
      op = gets.chomp.to_i
      
      case
      when 0 == op
        
        initBookInfos
      when 9 == op
        @dbh.disconnect
        print "プログラムを終了しました"
        break;
      else
      end
    end
  end

end    
      
book_info_manager = BookInfoManager.new("bookinfo_sqlite.db")

book_info_manager.run


  