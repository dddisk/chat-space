# サービス名
### chatspace

#ChatSpaceの機能
ChatSpaceには以下のような機能を実装していきます。

### 新規登録機能
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
| e-mail | string | false| index |
|password| string | false|       |

### messages
| column |  type   | null | index |
|:------:|:-------:|:----:|:-----:|
| body   | string  |      |       |
| image  | string  | false|       |
|group-id| integer | false| index |
|user-id | integer | false| index |

### groups
| column |  type  | null | index |
|:------:|:------:|:----:|:-----:|
| name   | string | false| index|

### users_groups
| column |  type   | null | index |
|:------:|:-------:|:----:|:-----:|
|group-id| integer | false| index |
|user-id | integer | false| index |
