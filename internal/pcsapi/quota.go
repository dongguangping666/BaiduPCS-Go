package pcsapi

import (
	"github.com/gin-gonic/gin"
	"github.com/qjfoidnh/BaiduPCS-Go/internal/pcscommand"
)

type QuotaInfo struct {
	Total int64 `json:"total"`
	Used  int64 `json:"used"`
}

func runGetQuota(ctx *gin.Context) {
	pcs := pcscommand.GetBaiduPCS()

	total, used, err := pcs.QuotaInfo()
	if err != nil {
		ctx.JSON(500, gin.H{
			"quota": 0,
			"used":  0,
			"code":  -1,
			"msg":   "获取百度账号的Quota出错! err=" + err.Error(),
		})
		return
	}

	ctx.JSON(200, gin.H{
		"quota": total,
		"used":  used,
		"code":  0,
		"msg":   "success",
	})
}

// 将RunChangeDirectory函数挂载到路由列表中
func initRunGetQuota(group *gin.RouterGroup) {
	group.GET("quota", runGetQuota)
}
