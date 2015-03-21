# -*- coding: utf-8 -*-
require 'rubygems'
require 'dbi'

class BookInfo
  def initialize(id, title, author, page, pulish_date, primary)
    @id = id
    @title = title
    @author = author
    .....
  end
  
  
end


class BookInfoManager
  def initialize(db_name)
    @db_name = db_name
  end
  
  def initBookInfos
    dbh = DBI.connect('DBI:SQLite3:db_name')
  end

    
  
  def run
    while true
      print "０：蔵書データベース初期化"
    end
  end

end    
      
book_info_manager = BookInfoManager.new("bookinfo_sqlite.db")

book_info_manager.run






# 蔵書データベースの作成
dbh = DBI.connect('DBI:SQLite3:bookinfo_sqlite.db')

dbh.do("drop table if exists bookinfos")

# 蔵書データベースのテーブル作成
dbh.do("create table bookinfos(
  id            varchar(50)         not null,
  title         varchar(100)        not null,
  author        varchar(100)        not null,
  page          varchar(100)        not null,
  publish_date  datetime            not null,
  primary       key(id));")
  
puts("キー：")  
key = gets.chomp
puts("書籍名：")
title = gets.chomp
puts("著者名：")
author = gets.chomp
puts("ページ数：")
pages = gets.chomp.to_i
puts("発刊年：")
year = gets.chomp.to_i



dbh.do("insert into bookinfos values(
  #{key},
  #{title},
  #{author},
  #{pages},
  .....
);")

sth = dbh.execute("select * from bookinfos")

sth.each do |row|
  row.each_with_name do |val, name|
    puts "#{name}: #{val.to_s}"
  end
  puts"-------------------"
end

sth.finish


dbh.disconnect


  
  

