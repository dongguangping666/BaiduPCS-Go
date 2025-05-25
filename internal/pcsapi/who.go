package pcsapi

import (
	"github.com/gin-gonic/gin"
	"github.com/qjfoidnh/BaiduPCS-Go/internal/pcsconfig"
)

// // type UserInfo struct {
// // 	Uid  string `json:"uid"`
// // 	Name string `json:"name"`
// }

func runGetUserInfo(ctx *gin.Context) {
	// pcs := pcscommand.GetBaiduPCS()

	activeUser := pcsconfig.Config.ActiveUser()

	ctx.JSON(200, activeUser.BaiduBase)

}

// 将RunChangeDirectory函数挂载到路由列表中
func initRunGetUserInfo(group *gin.RouterGroup) {
	group.GET("me", runGetUserInfo)
}
