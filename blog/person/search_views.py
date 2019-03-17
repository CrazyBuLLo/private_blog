import markdown
from haystack.views import SearchView
import re
from .models import *

# 为搜索后返回的context增加额外的数据
class MySearchView(SearchView):
    def extra_context(self): # 重载extra_context来添加额外的内容
        paginator, page = super(MySearchView, self).build_page() # 获取处理好的分页结果
        context = super(MySearchView, self).extra_context() # 增加额外的context
        results = []
        dict1 = {}
        print(page.object_list)
        for p in page.object_list:
            time = p.object.createTime.strftime('%Y-%m-%d')
            time1 = p.object.createTime.strftime('%H:%M:%S')
            dict1['time'] = time
            dict1['time1'] = time1
            dict1['title'] = p.object.title
            dict1['pic'] = p.object.pic
            dict1['content'] = re.sub(r'<[^>]+>', "", markdown.markdown(p.object.content.replace("\r\n", '  \n'), extensions=[
                # 把所有的content都传过去，在js中去掉html标签，空格换行，并截取前80个字符
                'markdown.extensions.extra',
                'markdown.extensions.codehilite',
                'markdown.extensions.toc',
            ]), re.S)[:130] + '...'
            dict1['id'] = p.object.id
            results.append(dict1)
            dict1 = {}
        context = {'results': results}
        return context