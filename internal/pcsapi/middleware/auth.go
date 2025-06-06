package middleware_auth

import (
	"github.com/gin-gonic/gin"
)

var Engine *gin.Engine
var Router *gin.RouterGroup

func Init(auth bool, secret string) {
	Engine = gin.Default()
	if auth {
		Router = Engine.Group("api", func(ctx *gin.Context) {
			token := ctx.GetHeader("x-token")
			if token == "" || token != secret {
				ctx.JSON(401, gin.H{
					"msg": "No permission.",
				})
				ctx.Abort()
				return
			}
		})
	} else {
		Router = Engine.Group("api")
	}
}
