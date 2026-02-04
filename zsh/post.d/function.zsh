# Functions: 清理远程已删除的本地分支
function gcp() {
   if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
     echo "❌ 错误：当前目录不是 Git 仓库"
     return 1
   fi
   echo "🚀 正在同步远程状态 (fetch -p)..."
   git fetch -p
   local gone_branches=$(git branch -vv | grep ': gone]' | grep -v '^*' | awk '{print $1}')
   if [ -n "$gone_branches" ]; then
     echo "🧹 发现并清理过时分支：$gone_branches"
     echo "$gone_branches" | xargs git branch -D
   else
     echo "✨ 本地仓库很干净。"
   fi
}
