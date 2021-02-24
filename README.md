## ProtoSpaceのER図

| # usersテーブル                |
|                              ｜
|email (string型,NOT NULL)      |
|password (string型,NOT NULL)   |
|name (string型,NOT NULL)       |
|profile (text型,NOT NULL)      |
|occupation (text型,NOT NULL)   |
|position (text型,NOT NULL)     |


| # prototypesテーブル           |
|                               |
|title (string型,NOT NULL)      |
|catch_copy (text,NOT NULL)     |
|image (ActiveStorageで実装)     | 
|user (references型)            |

| # commentsテーブル             |
|                               |
|text (text型,NOT NULL)         |
|user (references型)            |
|prototype (references型)       |
|                               |
|                               |




##usersテーブル

| Column                | Type                       | Options                        |
| ----------------------| -------------------------- | ------------------------------ |
| title  | string　　　| null: false,                   |
| group  |------ references | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user