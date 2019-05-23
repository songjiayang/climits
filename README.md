# climits

A example for Memory limit with Linux CGgroup in Go.

### How to test

- add `climits` memory group

```
$ mount | grep memory

cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)

$ mkdir /sys/fs/cgroup/memory/climits
``` 

When `climits` created, the default config will auto create, command `ls /sys/fs/cgroup/memory/climits` output will be:

```
cgroup.clone_children  memory.kmem.limit_in_bytes          memory.kmem.tcp.usage_in_bytes  memory.memsw.max_usage_in_bytes  memory.soft_limit_in_bytes  tasks
cgroup.event_control   memory.kmem.max_usage_in_bytes      memory.kmem.usage_in_bytes      memory.memsw.usage_in_bytes      memory.stat
cgroup.procs           memory.kmem.slabinfo                memory.limit_in_bytes           memory.move_charge_at_immigrate  memory.swappiness
memory.failcnt         memory.kmem.tcp.failcnt             memory.max_usage_in_bytes       memory.numa_stat                 memory.usage_in_bytes
memory.force_empty     memory.kmem.tcp.limit_in_bytes      memory.memsw.failcnt            memory.oom_control               memory.use_hierarchy
memory.kmem.failcnt    memory.kmem.tcp.max_usage_in_bytes  memory.memsw.limit_in_bytes     memory.pressure_level            notify_on_release
```

- run command `./climit -memory=64`, the output is:

```
add pid 24059 to file cgroup.procs

Child pid is 24059
Alloc = 1 MiB	Sys = 66 MiB 
Alloc = 3 MiB	Sys = 68 MiB 
Alloc = 7 MiB	Sys = 68 MiB 
....
Alloc = 32 MiB	Sys = 134 MiB 
Alloc = 32 MiB	Sys = 134 MiB 
Alloc = 32 MiB	Sys = 134 MiB 
cmd return with error: signal: killed
app is killed by system
restart app..
add pid 24135 to file cgroup.procs
Child pid is 24135
Alloc = 1 MiB	Sys = 66 MiB 
Alloc = 3 MiB	Sys = 68 MiB 
Alloc = 7 MiB	Sys = 68 MiB 
```


### Features

- memory limit
- process restart


### Reference

- [man7/cgroups](http://man7.org/linux/man-pages/man7/cgroups.7.html)
- [限制cgroup的内存使用](https://segmentfault.com/a/1190000008125359)