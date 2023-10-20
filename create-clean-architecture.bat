@echo off
setlocal

:: Base directories
mkdir cmd\server\http
mkdir pkg\api\app\errors
mkdir pkg\api\app\domain
mkdir pkg\api\app\interfaces\controllers
mkdir pkg\api\app\interfaces\repositories
mkdir pkg\api\app\interfaces\services
mkdir pkg\api\app\usecases
mkdir pkg\api\config
mkdir pkg\api\helpers
mkdir pkg\api\middleware
mkdir pkg\storage\db\postgres
mkdir pkg\storage\db\mysql
mkdir test
mkdir vendor

:: Create files
echo. > cmd\server\http\main.go
echo. > pkg\api\app\errors\error.go
echo. > pkg\api\app\errors\not_found.go
echo. > pkg\api\app\domain\user.go
echo. > pkg\api\app\domain\post.go
echo. > pkg\api\app\interfaces\controllers\user.go
echo. > pkg\api\app\interfaces\controllers\post.go
echo. > pkg\api\app\interfaces\repositories\user.go
echo. > pkg\api\app\interfaces\repositories\post.go
echo. > pkg\api\app\interfaces\services\user.go
echo. > pkg\api\app\interfaces\services\post.go
echo. > pkg\api\app\usecases\user.go
echo. > pkg\api\app\usecases\post.go
echo. > pkg\api\config\config.go
echo. > pkg\api\helpers\logger.go
echo. > pkg\api\helpers\validator.go
echo. > pkg\api\middleware\auth.go
echo. > pkg\api\middleware\logging.go
echo. > Dockerfile
echo. > go.sum

:: Note: go.mod is created using the 'go mod init' command

:: Pause before ending
pause
