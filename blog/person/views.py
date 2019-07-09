from django.http import HttpResponse
from django.shortcuts import render, redirect
from .visit_info import change_info
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from .models import *
import markdown
import re
import json
from django.views.decorators.cache import cache_page

@cache_page(60*15)
def index(request):
    change_info(request)
    return render(request, 'article/index.html')

# 点击下一页时使用ajax局部刷新页面内容
@csrf_exempt
def pageAjax(request):
    if request.method == 'GET':
        page_id = request.GET.get('page_id')
        article = Article.objects.filter(isShow=True).order_by('-id') # 获取所有博客
        paginator = Paginator(article, 4) # 分页，每页显示8篇文章
        page_list = paginator.page(int(page_id)).object_list  # 获得要返回的页面的文章列表

        # 处理要返回的数据
        result = []
        array = []
        for p in page_list:
            time = p.createTime.strftime('%Y-%m-%d') # 年月日
            time1 = p.createTime.strftime('%H:%M:%S') # 时分秒
            array.append(time)
            array.append(time1)
            array.append(p.title)
            array.append(str(p.pic))
            temp = markdown.markdown(p.content.replace("\r\n", '  \n'), extensions=[
                'markdown.extensions.extra',
                'markdown.extensions.codehilite',
                'markdown.extensions.toc'
            ])
            dr = re.compile(r'<[^>]+>', re.S)
            temp = dr.sub('', temp).replace('\n', '').replace(' ', '')
            array.append(temp[0:95])
            array.append(p.id) # 文章的id

            array.append(str(p.clickNums))

            tags = Article.objects.filter(id=int(p.id))[0].tag.all()[0].tname
            tag_id = Article.objects.filter(id=int(p.id))[0].tag.all()[0].id
            array.append(str(tags))
            array.append(tag_id)
            result.append(array)
            array = []
        context = {
            'result': result,
            'page_id': page_id, # 当前页面
            'num_pages': paginator.num_pages, # 页面总数
        }
        return HttpResponse(json.dumps(context), content_type='application/json') # json.dumps(context)是字符串类型


def chartInfo(request): # 饼图ajax请求数据
    if request.GET.get('name'): # 加载二级表图
        name = request.GET.get('name')
        print(name)
        t1 = Category.objects.get(id=1)
        CategoryList = Category.objects.filter(lifeOrStudy=name).order_by('id') # 获取类别
        list1 = []
        result = []
        for t in CategoryList:
            count = t.article_set.all().count()
            list1.append(count)
            list1.append(t.cname)
            list1.append(t.id)
            result.append(list1)
            list1 = []
        context = {'result': result, 'name': name}
        return HttpResponse(json.dumps(context), content_type='application/json')
    else:
        lifeList = Category.objects.filter(lifeOrStudy='慢生活')
        lifeCount = 0
        for t in lifeList:
            count = t.article_set.all().count()
            lifeCount += count
        studyList = Category.objects.filter(lifeOrStudy='学无止境')
        studyCount = 0
        for t in studyList:
            count = t.article_set.all().count()
            studyCount += count
        context = {'lifeCount': lifeCount, 'studyCount': studyCount}
        print(context)
        return HttpResponse(json.dumps(context), content_type='application/json')



@cache_page(60*15)
def about(request):
    change_info(request)
    return render(request, 'article/about.html')

def stayhungry(request, category_id, page_id):
    change_info(request)
    category_id = int(category_id)
    page_id = int(page_id)
    if category_id == 0:
        article = Article.objects.filter(isShow=True).order_by('-id')
    else:
        category = Category.objects.get(id=category_id)
        print(category)
        article = Article.objects.filter(category=category.id, isShow=True).order_by('-id')
    category_list = Category.objects.all()

    paginator = Paginator(article, 6)
    page_list = paginator.page(page_id).object_list

    result = []
    array = []
    for p in page_list:
        time = p.createTime.strftime('%Y-%m-%d')
        time1 = p.createTime.strftime('%H:%M:%S')
        array.append(time)
        array.append(time1)
        array.append(p.title)
        array.append(str(p.pic))
        temp = markdown.markdown(p.content, extensions=[ # 把所有的content都传过去，在js中去掉html标签，空格换行，并截取前80个字符
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
            'markdown.extensions.toc',
        ])
        dr = re.compile(r'<[^>]+>', re.S)
        temp = dr.sub('', temp).replace('\n', "").replace(' ', '')
        array.append(temp[0:130])
        array.append(p.id)
        result.append(array)
        array = []
    context = {
        'result': result,
        'page_id': page_id,
        'num_pages': paginator.num_pages,
        'category_list': category_list,
        'category_id': category_id
    }

    return render(request, 'article/stayhungry.html', context)

def slowlife(request):
    change_info(request)
    return render(request, 'article/slowlife.html')

def message(request):
    change_info(request)
    return render(request, 'article/message.html')

@cache_page(60*15)
def detail(request, id):
    change_info(request)
    article = Article.objects.get(id=int(id))
    article.clickNums = article.clickNums + 1
    article.save()
    article.content = markdown.markdown(article.content.replace("\r\n", '  \n'), extensions=[
        'markdown.extensions.extra',
        'markdown.extensions.codehilite',
        'markdown.extensions.toc',
    ])
    meta_category = article.category
    meta_description = re.sub(r'<[^>]+>', "", article.content, re.S)[:80]
    context = {
        'article': article,
        'meta_description': meta_description,
        'meta_category': meta_category
    }
    return render(request, 'article/detail.html', context)


def handler_404(request, **kwargs):
    return render(request, 'handler_404.html')

def handler_500(request):
    return render(request, 'handler_404.html')
