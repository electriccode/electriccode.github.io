---
layout: default
---
## All posts

<div class="posts">
{% for post in site.posts %}
    {% include post-excerpt.html post-param=post  %}
{% endfor %}
</div>