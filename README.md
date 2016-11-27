# サービス名
### chatspace

#ChatSpaceの機能
ChatSpaceには以下のような機能を実装していきます。

### ChatSpaceの機能
* 新規登録機能
* 1対1のチャット機能
* 複数人によるグループチャット機能
* チャット相手の検索機能
* チャットグループへのユーザー招待機能
* チャットの履歴表示機能
* 画像送信機能
* チャットの自動更新

#　テーブル設計

### users
| column |  type  | null | index |
|:------:|:------:|:----:|:-----:|
| name   | string | false| index |
| email  | string | false| index |
|password| string | false|       |

### messages
| column |   type    | null | index |
|:------:|:---------:|:----:|:-----:|
| body   | string    |      |       |
| image  | string    | false|       |
|group-id| reference | false| index |
|user_id | reference | false| index |

### groups
| column |  type  | null | index |
|:------:|:------:|:----:|:-----:|
| name   | string | false| index |

### user_groups
| column |   type    | null | index |
|:------:|:---------:|:----:|:-----:|
|group_id| reference | false| index |
|user_id | reference | false| index |

#　アソシエーション
### users
* has_many :user_groups
* has_many :messages
* has_many :groups, through: :user_groups

### messages
* belongs_to :user
* belongs_to :group

### groups
* has_many :users, through: :user_groups
* has_many :messages

### user_groups
* belongs_to :user
* belongs_to :group
