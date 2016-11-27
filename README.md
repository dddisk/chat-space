# サービス名
chatspace

#ChatSpaceの機能
ChatSpaceには以下のような機能を実装していきます。

    *新規登録機能
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
| name   | string |      |       |
| e-mail | string |      |       |
|password| string |      |       |

### messages
| column |  type   | null | index |
|:------:|:-------:|:----:|:-----:|
| body   | string  |      |       |
| image  | string  |      |       |
|group-id| integer |      |       |
|user-id | integer | null | index |

### groups
| column |  type  | null | index |
|:------:|:------:|:----:|:-----:|
| name   | string |      |       |

### users_groups
| column |  type   | null | index |
|:------:|:-------:|:----:|:-----:|
|group-id| integer |      |       |
|user-id | integer | null | index |
