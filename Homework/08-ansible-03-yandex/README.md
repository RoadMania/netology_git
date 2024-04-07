<a name="virt02"></a> 08-ansible-03-yandex <br><br>

Готовый плейбук:

```
- name: Install Lighthouse
  hosts: lighthouse
  tags:
    - lighthouse
    - nginx
  handlers:
    - name: Start-nginx
      become: true
      ansible.builtin.command: 
        cmd: nginx    
    - name: Reload-nginx
      become: true
      ansible.builtin.command: 
        cmd: nginx -s reload
  pre_tasks:
    - name: install git
      become: true
      ansible.builtin.yum:
        name: git
        state: present
    - name: install epel-release
      become: true
      ansible.builtin.yum:
        name: epel-release
        state: present   
  tasks:
    - name: install NGINX
      become: true
      ansible.builtin.yum:
        name: nginx
        state: present
      notify: Start-nginx
    - name: Flush handlers
      ansible.builtin.meta: flush_handlers  
    - name: Apply nginx config
      become: true
      ansible.builtin.template:
        src: templates/nginx.conf.j2
        dest: /etc/nginx/nginx.conf
        mode: "0777"
      notify: Reload-nginx  
    - name: Lighthouse | Copy from git
      become: true
      ansible.builtin.git:
        repo: "{{ lighthouse_vcs }}"
        version: master
        dest: "{{ lighthouse_local_dir }}"
    - name: Lighthouse | Create ligthouse config
      become: true
      ansible.builtin.template:
        src: lighthouse.conf.j2
        dest: /etc/nginx/conf.d/defult.conf
        mode: "0777"
      notify: Reload-nginx
    - name: Print address to connect
      ansible.builtin.debug:
        msg: "Lighthouse is available at http://{{ ansible_host }}:{{ lighthouse_port }}/"
```

Инвентори:

```
---
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: 158.160.48.191
      #ansible_user: ansible
      #ansible_connection: ssh
vector:
  hosts:
    vector-01:
      ansible_host: 158.160.42.220
      #ansible_user: vector
      #ansible_connection: ssh
lighthouse:
  hosts:
    lighthouse-01:
      ansible_host: 158.160.34.167
      ansible_user: lighthouse
      #ansible_connection: ssh
```



Ссылка на .md-файл: https://github.com/RoadMania/netology_git/blob/main/Homework/08-ansible-03-yandex/playbook/README.md
