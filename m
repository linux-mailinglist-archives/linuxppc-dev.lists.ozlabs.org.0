Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367761FB392
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 16:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mVRS4BCFzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 00:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mV8r0vTTzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 23:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MQDZzu/6; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49mV8q67Fmz9sTH; Tue, 16 Jun 2020 23:55:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49mV8q3h72z9sTF; Tue, 16 Jun 2020 23:55:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592315755;
 bh=ZoTxCdoT2iZAPY8LzBIN8t8bJXSPQWYD1tEsoKwlizE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQDZzu/6IJqqEOcb0tlxQzY40Fn/v+PZUalvkwEWmAxOy+fQeKp7ctdRks5qVEveS
 s0tFalKX5RpckuoISqBod4NY5wpdD6FEtAxGzJd+KT1cydnGHyBUW0Pyzl+avIaYdj
 kERo62Rj4F0+bHOGJyLHJ3PYRHsgp63kBukiRb4qoDn3dcgyf5tqoA5OQqMJRDHiPO
 1yRAg9nUDPTiVHAwEH33Q7wTL9DZ7v5HAuBWbXEn0cuoNrg3qVHumrYcp7VwwxYxgl
 MQe9ZkdQ9zMC01NOgYR1CDfdcQk+Yyz7aJnKK6ZVchr+d9QpoK+O1vN7D9spad/g+u
 nupP8an3AzLrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/2] powerpc/syscalls: Split SPU-ness out of ABI
Date: Tue, 16 Jun 2020 23:56:17 +1000
Message-Id: <20200616135617.2937252-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200616135617.2937252-1-mpe@ellerman.id.au>
References: <20200616135617.2937252-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using the ABI field to encode whether a syscall is usable by SPU
programs or not is a bit of kludge.

The ABI of the syscall doesn't change depending on the SPU-ness, but
in order to make the syscall generation work we have to pretend that
it does.

It also means we have more duplicated syscall lines than we need to,
and the SPU logic is not well contained, instead all of the syscall
generation targets need to know if they are spu or nospu.

So instead add a separate file which contains the information on which
syscalls are available for SPU programs. It's just a list of syscall
numbers with a single "spu" field. If the field has the value "spu"
then the syscall is available to SPU programs, any other value or no
entry entirely means the syscall is not available to SPU programs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/syscalls/Makefile      |  16 +-
 arch/powerpc/kernel/syscalls/spu.tbl       | 430 +++++++++++++++++++++
 arch/powerpc/kernel/syscalls/syscall.tbl   | 195 ++++------
 arch/powerpc/kernel/syscalls/syscalltbl.sh |  10 +-
 4 files changed, 523 insertions(+), 128 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscalls/spu.tbl


I'm inclined to put this in next and ask Linus to pull it before rc2, that seems
like the least disruptive way to get this in, unless anyone objects?

cheers


diff --git a/arch/powerpc/kernel/syscalls/Makefile b/arch/powerpc/kernel/syscalls/Makefile
index 27b48954808d..34d39b4a83f7 100644
--- a/arch/powerpc/kernel/syscalls/Makefile
+++ b/arch/powerpc/kernel/syscalls/Makefile
@@ -6,6 +6,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
 syscall := $(srctree)/$(src)/syscall.tbl
+sputbl := $(srctree)/$(src)/spu.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
@@ -19,32 +20,33 @@ quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
 		   '$(systbl_abis_$(basetarget))'		\
 		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+		   '$(systbl_offset_$(basetarget))'		\
+		    $(sputbl)
 
-syshdr_abis_unistd_32 := common,nospu,32
+syshdr_abis_unistd_32 := common,32
 $(uapi)/unistd_32.h: $(syscall) $(syshdr)
 	$(call if_changed,syshdr)
 
-syshdr_abis_unistd_64 := common,nospu,64
+syshdr_abis_unistd_64 := common,64
 $(uapi)/unistd_64.h: $(syscall) $(syshdr)
 	$(call if_changed,syshdr)
 
-systbl_abis_syscall_table_32 := common,nospu,32
+systbl_abis_syscall_table_32 := common,32
 systbl_abi_syscall_table_32 := 32
 $(kapi)/syscall_table_32.h: $(syscall) $(systbl)
 	$(call if_changed,systbl)
 
-systbl_abis_syscall_table_64 := common,nospu,64
+systbl_abis_syscall_table_64 := common,64
 systbl_abi_syscall_table_64 := 64
 $(kapi)/syscall_table_64.h: $(syscall) $(systbl)
 	$(call if_changed,systbl)
 
-systbl_abis_syscall_table_c32 := common,nospu,32
+systbl_abis_syscall_table_c32 := common,32
 systbl_abi_syscall_table_c32 := c32
 $(kapi)/syscall_table_c32.h: $(syscall) $(systbl)
 	$(call if_changed,systbl)
 
-systbl_abis_syscall_table_spu := common,spu
+systbl_abis_syscall_table_spu := common,64
 systbl_abi_syscall_table_spu := spu
 $(kapi)/syscall_table_spu.h: $(syscall) $(systbl)
 	$(call if_changed,systbl)
diff --git a/arch/powerpc/kernel/syscalls/spu.tbl b/arch/powerpc/kernel/syscalls/spu.tbl
new file mode 100644
index 000000000000..5eac04919303
--- /dev/null
+++ b/arch/powerpc/kernel/syscalls/spu.tbl
@@ -0,0 +1,430 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# The format is:
+# <number> <name> <spu>
+#
+# To indicate a syscall can be used by SPU programs use "spu" for the spu column.
+#
+# Syscalls that are not to be used by SPU programs can be left out of the file
+# entirely, or an entry with a value other than "spu" can be added.
+0	restart_syscall			-
+1	exit				-
+2	fork				-
+3	read				spu
+4	write				spu
+5	open				spu
+6	close				spu
+7	waitpid				spu
+8	creat				spu
+9	link				spu
+10	unlink				spu
+11	execve				-
+12	chdir				spu
+13	time				spu
+14	mknod				spu
+15	chmod				spu
+16	lchown				spu
+17	break				-
+18	oldstat				-
+19	lseek				spu
+20	getpid				spu
+21	mount				-
+22	umount				-
+23	setuid				spu
+24	getuid				spu
+25	stime				spu
+26	ptrace				-
+27	alarm				spu
+28	oldfstat			-
+29	pause				-
+30	utime				-
+31	stty				-
+32	gtty				-
+33	access				spu
+34	nice				spu
+35	ftime				-
+36	sync				spu
+37	kill				spu
+38	rename				spu
+39	mkdir				spu
+40	rmdir				spu
+41	dup				spu
+42	pipe				spu
+43	times				spu
+44	prof				-
+45	brk				spu
+46	setgid				spu
+47	getgid				spu
+48	signal				-
+49	geteuid				spu
+50	getegid				spu
+51	acct				-
+52	umount2				-
+53	lock				-
+54	ioctl				spu
+55	fcntl				spu
+56	mpx				-
+57	setpgid				spu
+58	ulimit				-
+59	oldolduname			-
+60	umask				spu
+61	chroot				spu
+62	ustat				-
+63	dup2				spu
+64	getppid				spu
+65	getpgrp				spu
+66	setsid				spu
+67	sigaction			-
+68	sgetmask			spu
+69	ssetmask			spu
+70	setreuid			spu
+71	setregid			spu
+72	sigsuspend			-
+73	sigpending			-
+74	sethostname			spu
+75	setrlimit			spu
+76	getrlimit			-
+77	getrusage			spu
+78	gettimeofday			spu
+79	settimeofday			spu
+80	getgroups			spu
+81	setgroups			spu
+82	select				-
+83	symlink				spu
+84	oldlstat			-
+85	readlink			spu
+86	uselib				-
+87	swapon				-
+88	reboot				-
+89	readdir				-
+90	mmap				spu
+91	munmap				spu
+92	truncate			spu
+93	ftruncate			spu
+94	fchmod				spu
+95	fchown				spu
+96	getpriority			spu
+97	setpriority			spu
+98	profil				-
+99	statfs				-
+100	fstatfs				-
+101	ioperm				-
+102	socketcall			spu
+103	syslog				spu
+104	setitimer			spu
+105	getitimer			spu
+106	stat				spu
+107	lstat				spu
+108	fstat				spu
+109	olduname			-
+110	iopl				-
+111	vhangup				spu
+112	idle				-
+113	vm86				-
+114	wait4				spu
+115	swapoff				-
+116	sysinfo				spu
+117	ipc				-
+118	fsync				spu
+119	sigreturn			-
+120	clone				-
+121	setdomainname			spu
+122	uname				spu
+123	modify_ldt			-
+124	adjtimex			spu
+125	mprotect			spu
+126	sigprocmask			-
+127	create_module			-
+128	init_module			-
+129	delete_module			-
+130	get_kernel_syms			-
+131	quotactl			-
+132	getpgid				spu
+133	fchdir				spu
+134	bdflush				spu
+135	sysfs				spu
+136	personality			spu
+137	afs_syscall			-
+138	setfsuid			spu
+139	setfsgid			spu
+140	_llseek				spu
+141	getdents			spu
+142	_newselect			spu
+143	flock				spu
+144	msync				spu
+145	readv				spu
+146	writev				spu
+147	getsid				spu
+148	fdatasync			spu
+149	_sysctl				-
+150	mlock				spu
+151	munlock				spu
+152	mlockall			spu
+153	munlockall			spu
+154	sched_setparam			spu
+155	sched_getparam			spu
+156	sched_setscheduler		spu
+157	sched_getscheduler		spu
+158	sched_yield			spu
+159	sched_get_priority_max		spu
+160	sched_get_priority_min		spu
+161	sched_rr_get_interval		spu
+162	nanosleep			spu
+163	mremap				spu
+164	setresuid			spu
+165	getresuid			spu
+166	query_module			-
+167	poll				spu
+168	nfsservctl			-
+169	setresgid			spu
+170	getresgid			spu
+171	prctl				spu
+172	rt_sigreturn			-
+173	rt_sigaction			-
+174	rt_sigprocmask			-
+175	rt_sigpending			-
+176	rt_sigtimedwait			-
+177	rt_sigqueueinfo			-
+178	rt_sigsuspend			-
+179	pread64				spu
+180	pwrite64			spu
+181	chown				spu
+182	getcwd				spu
+183	capget				spu
+184	capset				spu
+185	sigaltstack			-
+186	sendfile			spu
+187	getpmsg				-
+188	putpmsg				-
+189	vfork				-
+190	ugetrlimit			spu
+191	readahead			spu
+192	mmap2				-
+193	truncate64			-
+194	ftruncate64			-
+195	stat64				-
+196	lstat64				-
+197	fstat64				-
+198	pciconfig_read			-
+199	pciconfig_write			-
+200	pciconfig_iobase		-
+201	multiplexer			-
+202	getdents64			spu
+203	pivot_root			spu
+204	fcntl64				-
+205	madvise				spu
+206	mincore				spu
+207	gettid				spu
+208	tkill				spu
+209	setxattr			spu
+210	lsetxattr			spu
+211	fsetxattr			spu
+212	getxattr			spu
+213	lgetxattr			spu
+214	fgetxattr			spu
+215	listxattr			spu
+216	llistxattr			spu
+217	flistxattr			spu
+218	removexattr			spu
+219	lremovexattr			spu
+220	fremovexattr			spu
+221	futex				spu
+222	sched_setaffinity		spu
+223	sched_getaffinity		spu
+225	tuxcall				-
+226	sendfile64			-
+227	io_setup			spu
+228	io_destroy			spu
+229	io_getevents			spu
+230	io_submit			spu
+231	io_cancel			spu
+232	set_tid_address			-
+233	fadvise64			spu
+234	exit_group			-
+235	lookup_dcookie			-
+236	epoll_create			spu
+237	epoll_ctl			spu
+238	epoll_wait			spu
+239	remap_file_pages		spu
+240	timer_create			spu
+241	timer_settime			spu
+242	timer_gettime			spu
+243	timer_getoverrun		spu
+244	timer_delete			spu
+245	clock_settime			spu
+246	clock_gettime			spu
+247	clock_getres			spu
+248	clock_nanosleep			spu
+249	swapcontext			-
+250	tgkill				spu
+251	utimes				spu
+252	statfs64			spu
+253	fstatfs64			spu
+254	fadvise64_64			-
+255	rtas				spu
+256	sys_debug_setcontext		-
+258	migrate_pages			-
+259	mbind				-
+260	get_mempolicy			-
+261	set_mempolicy			-
+262	mq_open				-
+263	mq_unlink			-
+264	mq_timedsend			-
+265	mq_timedreceive			-
+266	mq_notify			-
+267	mq_getsetattr			-
+268	kexec_load			-
+269	add_key				-
+270	request_key			-
+271	keyctl				-
+272	waitid				-
+273	ioprio_set			-
+274	ioprio_get			-
+275	inotify_init			-
+276	inotify_add_watch		-
+277	inotify_rm_watch		-
+278	spu_run				-
+279	spu_create			-
+280	pselect6			-
+281	ppoll				-
+282	unshare				spu
+283	splice				spu
+284	tee				spu
+285	vmsplice			spu
+286	openat				spu
+287	mkdirat				spu
+288	mknodat				spu
+289	fchownat			spu
+290	futimesat			spu
+291	newfstatat			spu
+292	unlinkat			spu
+293	renameat			spu
+294	linkat				spu
+295	symlinkat			spu
+296	readlinkat			spu
+297	fchmodat			spu
+298	faccessat			spu
+299	get_robust_list			spu
+300	set_robust_list			spu
+301	move_pages			spu
+302	getcpu				spu
+303	epoll_pwait			-
+304	utimensat			spu
+305	signalfd			spu
+306	timerfd_create			spu
+307	eventfd				spu
+308	sync_file_range2		spu
+309	fallocate			-
+310	subpage_prot			-
+311	timerfd_settime			spu
+312	timerfd_gettime			spu
+313	signalfd4			spu
+314	eventfd2			spu
+315	epoll_create1			spu
+316	dup3				spu
+317	pipe2				spu
+318	inotify_init1			-
+319	perf_event_open			spu
+320	preadv				spu
+321	pwritev				spu
+322	rt_tgsigqueueinfo		-
+323	fanotify_init			-
+324	fanotify_mark			-
+325	prlimit64			spu
+326	socket				spu
+327	bind				spu
+328	connect				spu
+329	listen				spu
+330	accept				spu
+331	getsockname			spu
+332	getpeername			spu
+333	socketpair			spu
+334	send				spu
+335	sendto				spu
+336	recv				spu
+337	recvfrom			spu
+338	shutdown			spu
+339	setsockopt			spu
+340	getsockopt			spu
+341	sendmsg				spu
+342	recvmsg				spu
+343	recvmmsg			spu
+344	accept4				spu
+345	name_to_handle_at		spu
+346	open_by_handle_at		spu
+347	clock_adjtime			spu
+348	syncfs				spu
+349	sendmmsg			spu
+350	setns				spu
+351	process_vm_readv		-
+352	process_vm_writev		-
+353	finit_module			-
+354	kcmp				-
+355	sched_setattr			spu
+356	sched_getattr			spu
+357	renameat2			spu
+358	seccomp				spu
+359	getrandom			spu
+360	memfd_create			spu
+361	bpf				spu
+362	execveat			-
+363	switch_endian			-
+364	userfaultfd			spu
+365	membarrier			spu
+378	mlock2				-
+379	copy_file_range			-
+380	preadv2				spu
+381	pwritev2			spu
+382	kexec_file_load			-
+383	statx				-
+384	pkey_alloc			-
+385	pkey_free			-
+386	pkey_mprotect			-
+387	rseq				-
+388	io_pgetevents			-
+392	semtimedop			-
+393	semget				spu
+394	semctl				spu
+395	shmget				spu
+396	shmctl				spu
+397	shmat				spu
+398	shmdt				spu
+399	msgget				spu
+400	msgsnd				spu
+401	msgrcv				spu
+402	msgctl				spu
+403	clock_gettime64			-
+404	clock_settime64			-
+405	clock_adjtime64			-
+406	clock_getres_time64		-
+407	clock_nanosleep_time64		-
+408	timer_gettime64			-
+409	timer_settime64			-
+410	timerfd_gettime64		-
+411	timerfd_settime64		-
+412	utimensat_time64		-
+413	pselect6_time64			-
+414	ppoll_time64			-
+416	io_pgetevents_time64		-
+417	recvmmsg_time64			-
+418	mq_timedsend_time64		-
+419	mq_timedreceive_time64		-
+420	semtimedop_time64		-
+421	rt_sigtimedwait_time64		-
+422	futex_time64			-
+423	sched_rr_get_interval_time64	-
+424	pidfd_send_signal		spu
+425	io_uring_setup			spu
+426	io_uring_enter			spu
+427	io_uring_register		spu
+428	open_tree			spu
+429	move_mount			spu
+430	fsopen				spu
+431	fsconfig			spu
+432	fsmount				spu
+433	fspick				spu
+434	pidfd_open			spu
+435	clone3				-
+437	openat2				spu
+438	pidfd_getfd			spu
+439	faccessat2			spu
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index f833a3190822..c0cdaacd770e 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -5,13 +5,12 @@
 # The format is:
 # <number> <abi> <name> <entry point> <compat entry point>
 #
-# The <abi> can be common, spu, nospu, 64, or 32 for this file.
+# The <abi> can be common, 64, or 32 for this file.
 #
-0	nospu	restart_syscall			sys_restart_syscall
-1	nospu	exit				sys_exit
+0	common	restart_syscall			sys_restart_syscall
+1	common	exit				sys_exit
 2	32	fork				ppc_fork			sys_fork
 2	64	fork				sys_fork
-2	spu	fork				sys_ni_syscall
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	open				sys_open			compat_sys_open
@@ -20,35 +19,30 @@
 8	common	creat				sys_creat
 9	common	link				sys_link
 10	common	unlink				sys_unlink
-11	nospu	execve				sys_execve			compat_sys_execve
+11	common	execve				sys_execve			compat_sys_execve
 12	common	chdir				sys_chdir
 13	32	time				sys_time32
 13	64	time				sys_time
-13	spu	time				sys_time
 14	common	mknod				sys_mknod
 15	common	chmod				sys_chmod
 16	common	lchown				sys_lchown
 17	common	break				sys_ni_syscall
 18	32	oldstat				sys_stat			sys_ni_syscall
 18	64	oldstat				sys_ni_syscall
-18	spu	oldstat				sys_ni_syscall
 19	common	lseek				sys_lseek			compat_sys_lseek
 20	common	getpid				sys_getpid
-21	nospu	mount				sys_mount			compat_sys_mount
+21	common	mount				sys_mount			compat_sys_mount
 22	32	umount				sys_oldumount
 22	64	umount				sys_ni_syscall
-22	spu	umount				sys_ni_syscall
 23	common	setuid				sys_setuid
 24	common	getuid				sys_getuid
 25	32	stime				sys_stime32
 25	64	stime				sys_stime
-25	spu	stime				sys_stime
-26	nospu	ptrace				sys_ptrace			compat_sys_ptrace
+26	common	ptrace				sys_ptrace			compat_sys_ptrace
 27	common	alarm				sys_alarm
 28	32	oldfstat			sys_fstat			sys_ni_syscall
 28	64	oldfstat			sys_ni_syscall
-28	spu	oldfstat			sys_ni_syscall
-29	nospu	pause				sys_pause
+29	common	pause				sys_pause
 30	32	utime				sys_utime32
 30	64	utime				sys_utime
 31	common	stty				sys_ni_syscall
@@ -68,11 +62,11 @@
 45	common	brk				sys_brk
 46	common	setgid				sys_setgid
 47	common	getgid				sys_getgid
-48	nospu	signal				sys_signal
+48	common	signal				sys_signal
 49	common	geteuid				sys_geteuid
 50	common	getegid				sys_getegid
-51	nospu	acct				sys_acct
-52	nospu	umount2				sys_umount
+51	common	acct				sys_acct
+52	common	umount2				sys_umount
 53	common	lock				sys_ni_syscall
 54	common	ioctl				sys_ioctl			compat_sys_ioctl
 55	common	fcntl				sys_fcntl			compat_sys_fcntl
@@ -81,32 +75,27 @@
 58	common	ulimit				sys_ni_syscall
 59	32	oldolduname			sys_olduname
 59	64	oldolduname			sys_ni_syscall
-59	spu	oldolduname			sys_ni_syscall
 60	common	umask				sys_umask
 61	common	chroot				sys_chroot
-62	nospu	ustat				sys_ustat			compat_sys_ustat
+62	common	ustat				sys_ustat			compat_sys_ustat
 63	common	dup2				sys_dup2
 64	common	getppid				sys_getppid
 65	common	getpgrp				sys_getpgrp
 66	common	setsid				sys_setsid
 67	32	sigaction			sys_sigaction			compat_sys_sigaction
 67	64	sigaction			sys_ni_syscall
-67	spu	sigaction			sys_ni_syscall
 68	common	sgetmask			sys_sgetmask
 69	common	ssetmask			sys_ssetmask
 70	common	setreuid			sys_setreuid
 71	common	setregid			sys_setregid
 72	32	sigsuspend			sys_sigsuspend
 72	64	sigsuspend			sys_ni_syscall
-72	spu	sigsuspend			sys_ni_syscall
 73	32	sigpending			sys_sigpending			compat_sys_sigpending
 73	64	sigpending			sys_ni_syscall
-73	spu	sigpending			sys_ni_syscall
 74	common	sethostname			sys_sethostname
 75	common	setrlimit			sys_setrlimit			compat_sys_setrlimit
 76	32	getrlimit			sys_old_getrlimit		compat_sys_old_getrlimit
 76	64	getrlimit			sys_ni_syscall
-76	spu	getrlimit			sys_ni_syscall
 77	common	getrusage			sys_getrusage			compat_sys_getrusage
 78	common	gettimeofday			sys_gettimeofday		compat_sys_gettimeofday
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
@@ -114,18 +103,15 @@
 81	common	setgroups			sys_setgroups
 82	32	select				ppc_select			sys_ni_syscall
 82	64	select				sys_ni_syscall
-82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
 84	32	oldlstat			sys_lstat			sys_ni_syscall
 84	64	oldlstat			sys_ni_syscall
-84	spu	oldlstat			sys_ni_syscall
 85	common	readlink			sys_readlink
-86	nospu	uselib				sys_uselib
-87	nospu	swapon				sys_swapon
-88	nospu	reboot				sys_reboot
+86	common	uselib				sys_uselib
+87	common	swapon				sys_swapon
+88	common	reboot				sys_reboot
 89	32	readdir				sys_old_readdir			compat_sys_old_readdir
 89	64	readdir				sys_ni_syscall
-89	spu	readdir				sys_ni_syscall
 90	common	mmap				sys_mmap
 91	common	munmap				sys_munmap
 92	common	truncate			sys_truncate			compat_sys_truncate
@@ -135,8 +121,8 @@
 96	common	getpriority			sys_getpriority
 97	common	setpriority			sys_setpriority
 98	common	profil				sys_ni_syscall
-99	nospu	statfs				sys_statfs			compat_sys_statfs
-100	nospu	fstatfs				sys_fstatfs			compat_sys_fstatfs
+99	common	statfs				sys_statfs			compat_sys_statfs
+100	common	fstatfs				sys_fstatfs			compat_sys_fstatfs
 101	common	ioperm				sys_ni_syscall
 102	common	socketcall			sys_socketcall			compat_sys_socketcall
 103	common	syslog				sys_syslog
@@ -147,44 +133,38 @@
 108	common	fstat				sys_newfstat			compat_sys_newfstat
 109	32	olduname			sys_uname
 109	64	olduname			sys_ni_syscall
-109	spu	olduname			sys_ni_syscall
 110	common	iopl				sys_ni_syscall
 111	common	vhangup				sys_vhangup
 112	common	idle				sys_ni_syscall
 113	common	vm86				sys_ni_syscall
 114	common	wait4				sys_wait4			compat_sys_wait4
-115	nospu	swapoff				sys_swapoff
+115	common	swapoff				sys_swapoff
 116	common	sysinfo				sys_sysinfo			compat_sys_sysinfo
-117	nospu	ipc				sys_ipc				compat_sys_ipc
+117	common	ipc				sys_ipc				compat_sys_ipc
 118	common	fsync				sys_fsync
 119	32	sigreturn			sys_sigreturn			compat_sys_sigreturn
 119	64	sigreturn			sys_ni_syscall
-119	spu	sigreturn			sys_ni_syscall
 120	32	clone				ppc_clone			sys_clone
 120	64	clone				sys_clone
-120	spu	clone				sys_ni_syscall
 121	common	setdomainname			sys_setdomainname
 122	common	uname				sys_newuname
 123	common	modify_ldt			sys_ni_syscall
 124	32	adjtimex			sys_adjtimex_time32
 124	64	adjtimex			sys_adjtimex
-124	spu	adjtimex			sys_adjtimex
 125	common	mprotect			sys_mprotect
 126	32	sigprocmask			sys_sigprocmask			compat_sys_sigprocmask
 126	64	sigprocmask			sys_ni_syscall
-126	spu	sigprocmask			sys_ni_syscall
 127	common	create_module			sys_ni_syscall
-128	nospu	init_module			sys_init_module
-129	nospu	delete_module			sys_delete_module
+128	common	init_module			sys_init_module
+129	common	delete_module			sys_delete_module
 130	common	get_kernel_syms			sys_ni_syscall
-131	nospu	quotactl			sys_quotactl
+131	common	quotactl			sys_quotactl
 132	common	getpgid				sys_getpgid
 133	common	fchdir				sys_fchdir
 134	common	bdflush				sys_bdflush
 135	common	sysfs				sys_sysfs
 136	32	personality			sys_personality			ppc64_personality
 136	64	personality			ppc64_personality
-136	spu	personality			ppc64_personality
 137	common	afs_syscall			sys_ni_syscall
 138	common	setfsuid			sys_setfsuid
 139	common	setfsgid			sys_setfsgid
@@ -197,7 +177,7 @@
 146	common	writev				sys_writev			compat_sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	nospu	_sysctl				sys_sysctl			compat_sys_sysctl
+149	common	_sysctl				sys_sysctl			compat_sys_sysctl
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
@@ -211,10 +191,8 @@
 160	common	sched_get_priority_min		sys_sched_get_priority_min
 161	32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
 161	64	sched_rr_get_interval		sys_sched_rr_get_interval
-161	spu	sched_rr_get_interval		sys_sched_rr_get_interval
 162	32	nanosleep			sys_nanosleep_time32
 162	64	nanosleep			sys_nanosleep
-162	spu	nanosleep			sys_nanosleep
 163	common	mremap				sys_mremap
 164	common	setresuid			sys_setresuid
 165	common	getresuid			sys_getresuid
@@ -224,29 +202,27 @@
 169	common	setresgid			sys_setresgid
 170	common	getresgid			sys_getresgid
 171	common	prctl				sys_prctl
-172	nospu	rt_sigreturn			sys_rt_sigreturn		compat_sys_rt_sigreturn
-173	nospu	rt_sigaction			sys_rt_sigaction		compat_sys_rt_sigaction
-174	nospu	rt_sigprocmask			sys_rt_sigprocmask		compat_sys_rt_sigprocmask
-175	nospu	rt_sigpending			sys_rt_sigpending		compat_sys_rt_sigpending
+172	common	rt_sigreturn			sys_rt_sigreturn		compat_sys_rt_sigreturn
+173	common	rt_sigaction			sys_rt_sigaction		compat_sys_rt_sigaction
+174	common	rt_sigprocmask			sys_rt_sigprocmask		compat_sys_rt_sigprocmask
+175	common	rt_sigpending			sys_rt_sigpending		compat_sys_rt_sigpending
 176	32	rt_sigtimedwait			sys_rt_sigtimedwait_time32	compat_sys_rt_sigtimedwait_time32
 176	64	rt_sigtimedwait			sys_rt_sigtimedwait
-177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
-178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
+177	common 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
+178	common 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
 179	common	pread64				sys_pread64			compat_sys_pread64
 180	common	pwrite64			sys_pwrite64			compat_sys_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
 184	common	capset				sys_capset
-185	nospu	sigaltstack			sys_sigaltstack			compat_sys_sigaltstack
+185	common	sigaltstack			sys_sigaltstack			compat_sys_sigaltstack
 186	32	sendfile			sys_sendfile			compat_sys_sendfile
 186	64	sendfile			sys_sendfile64
-186	spu	sendfile			sys_sendfile64
 187	common	getpmsg				sys_ni_syscall
 188	common 	putpmsg				sys_ni_syscall
 189	32	vfork				ppc_vfork			sys_vfork
 189	64	vfork				sys_vfork
-189	spu	vfork				sys_ni_syscall
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
@@ -255,9 +231,9 @@
 195	32	stat64				sys_stat64
 196	32	lstat64				sys_lstat64
 197	32	fstat64				sys_fstat64
-198	nospu 	pciconfig_read			sys_pciconfig_read
-199	nospu 	pciconfig_write			sys_pciconfig_write
-200	nospu 	pciconfig_iobase		sys_pciconfig_iobase
+198	common 	pciconfig_read			sys_pciconfig_read
+199	common 	pciconfig_write			sys_pciconfig_write
+200	common 	pciconfig_iobase		sys_pciconfig_iobase
 201	common 	multiplexer			sys_ni_syscall
 202	common	getdents64			sys_getdents64
 203	common	pivot_root			sys_pivot_root
@@ -280,7 +256,6 @@
 220	common	fremovexattr			sys_fremovexattr
 221	32	futex				sys_futex_time32
 221	64	futex				sys_futex
-221	spu	futex				sys_futex
 222	common	sched_setaffinity		sys_sched_setaffinity		compat_sys_sched_setaffinity
 223	common	sched_getaffinity		sys_sched_getaffinity		compat_sys_sched_getaffinity
 # 224 unused
@@ -290,13 +265,12 @@
 228	common	io_destroy			sys_io_destroy
 229	32	io_getevents			sys_io_getevents_time32
 229	64	io_getevents			sys_io_getevents
-229	spu	io_getevents			sys_io_getevents
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
-232	nospu	set_tid_address			sys_set_tid_address
+232	common	set_tid_address			sys_set_tid_address
 233	common	fadvise64			sys_fadvise64			ppc32_fadvise64
-234	nospu	exit_group			sys_exit_group
-235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
+234	common	exit_group			sys_exit_group
+235	common	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
 236	common	epoll_create			sys_epoll_create
 237	common	epoll_ctl			sys_epoll_ctl
 238	common	epoll_wait			sys_epoll_wait
@@ -304,64 +278,54 @@
 240	common	timer_create			sys_timer_create		compat_sys_timer_create
 241	32	timer_settime			sys_timer_settime32
 241	64	timer_settime			sys_timer_settime
-241	spu	timer_settime			sys_timer_settime
 242	32	timer_gettime			sys_timer_gettime32
 242	64	timer_gettime			sys_timer_gettime
-242	spu	timer_gettime			sys_timer_gettime
 243	common	timer_getoverrun		sys_timer_getoverrun
 244	common	timer_delete			sys_timer_delete
 245	32	clock_settime			sys_clock_settime32
 245	64	clock_settime			sys_clock_settime
-245	spu	clock_settime			sys_clock_settime
 246	32	clock_gettime			sys_clock_gettime32
 246	64	clock_gettime			sys_clock_gettime
-246	spu	clock_gettime			sys_clock_gettime
 247	32	clock_getres			sys_clock_getres_time32
 247	64	clock_getres			sys_clock_getres
-247	spu	clock_getres			sys_clock_getres
 248	32	clock_nanosleep			sys_clock_nanosleep_time32
 248	64	clock_nanosleep			sys_clock_nanosleep
-248	spu	clock_nanosleep			sys_clock_nanosleep
 249	32	swapcontext			ppc_swapcontext			compat_sys_swapcontext
 249	64	swapcontext			sys_swapcontext
-249	spu	swapcontext			sys_ni_syscall
 250	common	tgkill				sys_tgkill
 251	32	utimes				sys_utimes_time32
 251	64	utimes				sys_utimes
-251	spu	utimes				sys_utimes
 252	common	statfs64			sys_statfs64			compat_sys_statfs64
 253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
 254	32	fadvise64_64			ppc_fadvise64_64
-254	spu	fadvise64_64			sys_ni_syscall
 255	common	rtas				sys_rtas
 256	32	sys_debug_setcontext		sys_debug_setcontext		sys_ni_syscall
 256	64	sys_debug_setcontext		sys_ni_syscall
-256	spu	sys_debug_setcontext		sys_ni_syscall
 # 257 reserved for vserver
-258	nospu	migrate_pages			sys_migrate_pages		compat_sys_migrate_pages
-259	nospu	mbind				sys_mbind			compat_sys_mbind
-260	nospu	get_mempolicy			sys_get_mempolicy		compat_sys_get_mempolicy
-261	nospu	set_mempolicy			sys_set_mempolicy		compat_sys_set_mempolicy
-262	nospu	mq_open				sys_mq_open			compat_sys_mq_open
-263	nospu	mq_unlink			sys_mq_unlink
+258	common	migrate_pages			sys_migrate_pages		compat_sys_migrate_pages
+259	common	mbind				sys_mbind			compat_sys_mbind
+260	common	get_mempolicy			sys_get_mempolicy		compat_sys_get_mempolicy
+261	common	set_mempolicy			sys_set_mempolicy		compat_sys_set_mempolicy
+262	common	mq_open				sys_mq_open			compat_sys_mq_open
+263	common	mq_unlink			sys_mq_unlink
 264	32	mq_timedsend			sys_mq_timedsend_time32
 264	64	mq_timedsend			sys_mq_timedsend
 265	32	mq_timedreceive			sys_mq_timedreceive_time32
 265	64	mq_timedreceive			sys_mq_timedreceive
-266	nospu	mq_notify			sys_mq_notify			compat_sys_mq_notify
-267	nospu	mq_getsetattr			sys_mq_getsetattr		compat_sys_mq_getsetattr
-268	nospu	kexec_load			sys_kexec_load			compat_sys_kexec_load
-269	nospu	add_key				sys_add_key
-270	nospu	request_key			sys_request_key
-271	nospu	keyctl				sys_keyctl			compat_sys_keyctl
-272	nospu	waitid				sys_waitid			compat_sys_waitid
-273	nospu	ioprio_set			sys_ioprio_set
-274	nospu	ioprio_get			sys_ioprio_get
-275	nospu	inotify_init			sys_inotify_init
-276	nospu	inotify_add_watch		sys_inotify_add_watch
-277	nospu	inotify_rm_watch		sys_inotify_rm_watch
-278	nospu	spu_run				sys_spu_run
-279	nospu	spu_create			sys_spu_create
+266	common	mq_notify			sys_mq_notify			compat_sys_mq_notify
+267	common	mq_getsetattr			sys_mq_getsetattr		compat_sys_mq_getsetattr
+268	common	kexec_load			sys_kexec_load			compat_sys_kexec_load
+269	common	add_key				sys_add_key
+270	common	request_key			sys_request_key
+271	common	keyctl				sys_keyctl			compat_sys_keyctl
+272	common	waitid				sys_waitid			compat_sys_waitid
+273	common	ioprio_set			sys_ioprio_set
+274	common	ioprio_get			sys_ioprio_get
+275	common	inotify_init			sys_inotify_init
+276	common	inotify_add_watch		sys_inotify_add_watch
+277	common	inotify_rm_watch		sys_inotify_rm_watch
+278	common	spu_run				sys_spu_run
+279	common	spu_create			sys_spu_create
 280	32	pselect6			sys_pselect6_time32		compat_sys_pselect6_time32
 280	64	pselect6			sys_pselect6
 281	32	ppoll				sys_ppoll_time32		compat_sys_ppoll_time32
@@ -376,10 +340,8 @@
 289	common	fchownat			sys_fchownat
 290	32	futimesat			sys_futimesat_time32
 290	64	futimesat			sys_futimesat
-290	spu	utimesat			sys_futimesat
 291	32	fstatat64			sys_fstatat64
 291	64	newfstatat			sys_newfstatat
-291	spu	newfstatat			sys_newfstatat
 292	common	unlinkat			sys_unlinkat
 293	common	renameat			sys_renameat
 294	common	linkat				sys_linkat
@@ -391,34 +353,31 @@
 300	common	set_robust_list			sys_set_robust_list		compat_sys_set_robust_list
 301	common	move_pages			sys_move_pages			compat_sys_move_pages
 302	common	getcpu				sys_getcpu
-303	nospu	epoll_pwait			sys_epoll_pwait			compat_sys_epoll_pwait
+303	common	epoll_pwait			sys_epoll_pwait			compat_sys_epoll_pwait
 304	32	utimensat			sys_utimensat_time32
 304	64	utimensat			sys_utimensat
-304	spu	utimensat			sys_utimensat
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
 308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
-310	nospu	subpage_prot			sys_subpage_prot
+309	common	fallocate			sys_fallocate			compat_sys_fallocate
+310	common	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
-311	spu	timerfd_settime			sys_timerfd_settime
 312	32	timerfd_gettime			sys_timerfd_gettime32
 312	64	timerfd_gettime			sys_timerfd_gettime
-312	spu	timerfd_gettime			sys_timerfd_gettime
 313	common	signalfd4			sys_signalfd4			compat_sys_signalfd4
 314	common	eventfd2			sys_eventfd2
 315	common	epoll_create1			sys_epoll_create1
 316	common	dup3				sys_dup3
 317	common	pipe2				sys_pipe2
-318	nospu	inotify_init1			sys_inotify_init1
+318	common	inotify_init1			sys_inotify_init1
 319	common	perf_event_open			sys_perf_event_open
 320	common	preadv				sys_preadv			compat_sys_preadv
 321	common	pwritev				sys_pwritev			compat_sys_pwritev
-322	nospu	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
-323	nospu	fanotify_init			sys_fanotify_init
-324	nospu	fanotify_mark			sys_fanotify_mark		compat_sys_fanotify_mark
+322	common	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
+323	common	fanotify_init			sys_fanotify_init
+324	common	fanotify_mark			sys_fanotify_mark		compat_sys_fanotify_mark
 325	common	prlimit64			sys_prlimit64
 326	common	socket				sys_socket
 327	common	bind				sys_bind
@@ -439,20 +398,18 @@
 342	common	recvmsg				sys_recvmsg			compat_sys_recvmsg
 343	32	recvmmsg			sys_recvmmsg_time32		compat_sys_recvmmsg_time32
 343	64	recvmmsg			sys_recvmmsg
-343	spu	recvmmsg			sys_recvmmsg
 344	common	accept4				sys_accept4
 345	common	name_to_handle_at		sys_name_to_handle_at
 346	common	open_by_handle_at		sys_open_by_handle_at		compat_sys_open_by_handle_at
 347	32	clock_adjtime			sys_clock_adjtime32
 347	64	clock_adjtime			sys_clock_adjtime
-347	spu	clock_adjtime			sys_clock_adjtime
 348	common	syncfs				sys_syncfs
 349	common	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
 350	common	setns				sys_setns
-351	nospu	process_vm_readv		sys_process_vm_readv		compat_sys_process_vm_readv
-352	nospu	process_vm_writev		sys_process_vm_writev		compat_sys_process_vm_writev
-353	nospu	finit_module			sys_finit_module
-354	nospu	kcmp				sys_kcmp
+351	common	process_vm_readv		sys_process_vm_readv		compat_sys_process_vm_readv
+352	common	process_vm_writev		sys_process_vm_writev		compat_sys_process_vm_writev
+353	common	finit_module			sys_finit_module
+354	common	kcmp				sys_kcmp
 355	common	sched_setattr			sys_sched_setattr
 356	common	sched_getattr			sys_sched_getattr
 357	common	renameat2			sys_renameat2
@@ -460,23 +417,22 @@
 359	common	getrandom			sys_getrandom
 360	common	memfd_create			sys_memfd_create
 361	common	bpf				sys_bpf
-362	nospu	execveat			sys_execveat			compat_sys_execveat
+362	common	execveat			sys_execveat			compat_sys_execveat
 363	32	switch_endian			sys_ni_syscall
 363	64	switch_endian			sys_switch_endian
-363	spu	switch_endian			sys_ni_syscall
 364	common	userfaultfd			sys_userfaultfd
 365	common	membarrier			sys_membarrier
 # 366-377 originally left for IPC, now unused
-378	nospu	mlock2				sys_mlock2
-379	nospu	copy_file_range			sys_copy_file_range
+378	common	mlock2				sys_mlock2
+379	common	copy_file_range			sys_copy_file_range
 380	common	preadv2				sys_preadv2			compat_sys_preadv2
 381	common	pwritev2			sys_pwritev2			compat_sys_pwritev2
-382	nospu	kexec_file_load			sys_kexec_file_load
-383	nospu	statx				sys_statx
-384	nospu	pkey_alloc			sys_pkey_alloc
-385	nospu	pkey_free			sys_pkey_free
-386	nospu	pkey_mprotect			sys_pkey_mprotect
-387	nospu	rseq				sys_rseq
+382	common	kexec_file_load			sys_kexec_file_load
+383	common	statx				sys_statx
+384	common	pkey_alloc			sys_pkey_alloc
+385	common	pkey_free			sys_pkey_free
+386	common	pkey_mprotect			sys_pkey_mprotect
+387	common	rseq				sys_rseq
 388	32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
 388	64	io_pgetevents			sys_io_pgetevents
 # room for arch specific syscalls
@@ -524,7 +480,6 @@
 434	common	pidfd_open			sys_pidfd_open
 435	32	clone3				ppc_clone3			sys_clone3
 435	64	clone3				sys_clone3
-435	spu	clone3				sys_ni_syscall
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
 439	common	faccessat2			sys_faccessat2
diff --git a/arch/powerpc/kernel/syscalls/syscalltbl.sh b/arch/powerpc/kernel/syscalls/syscalltbl.sh
index f7393a7b18aa..1a760242620c 100644
--- a/arch/powerpc/kernel/syscalls/syscalltbl.sh
+++ b/arch/powerpc/kernel/syscalls/syscalltbl.sh
@@ -6,6 +6,7 @@ out="$2"
 my_abis=`echo "($3)" | tr ',' '|'`
 my_abi="$4"
 offset="$5"
+spu_table="$6"
 
 emit() {
 	t_nxt="$1"
@@ -28,9 +29,16 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	while read nr abi name entry compat ; do
 		if [ "$my_abi" = "c32" ] && [ ! -z "$compat" ]; then
 			emit $((nxt+offset)) $((nr+offset)) $compat
+			nxt=$((nr+1))
+		elif [ "$my_abi" = "spu" ]; then
+			grep -E "^$nr[[:space:]]+$name[[:space:]]+spu[[:space:]]*$" "$spu_table" > /dev/null
+			if [ $? -eq 0 ]; then
+				emit $((nxt+offset)) $((nr+offset)) $entry
+				nxt=$((nr+1))
+			fi
 		else
 			emit $((nxt+offset)) $((nr+offset)) $entry
+			nxt=$((nr+1))
 		fi
-		nxt=$((nr+1))
 	done
 ) > "$out"
-- 
2.25.1

