Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42AA1D77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K54D1vjmzDqsW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 00:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=acme@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="n40sgmZr"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K4yB2Mg9zDrdl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 00:39:45 +1000 (AEST)
Received: from quaco.ghostprotocols.net (unknown [179.97.35.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3B5E22CED;
 Thu, 29 Aug 2019 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567089583;
 bh=BN6CX3kCR5no9gsPiS/NPERiaWMhRA44585VumIY9wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n40sgmZrI29kK5aG+PV38qth1nLuuY2IUDXd9eJllDtA/jbe+Z5CSTxTKwA3XpTNU
 nlS02gr7eiNANSUlHjrSaalRmbT5lC0a0tQjaQjl1jIOFCiQVBa3mQWxZYfVdKiExJ
 5onsId5v4gS1t4or2OqgO6LbyZp7bvqj8JBTmNg0=
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/37] perf arch powerpc: Sync powerpc syscall.tbl
Date: Thu, 29 Aug 2019 11:38:41 -0300
Message-Id: <20190829143917.29745-2-acme@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143917.29745-1-acme@kernel.org>
References: <20190829143917.29745-1-acme@kernel.org>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

Copy over powerpc syscall.tbl to grab changes from the below commits:

  commit cee3536d24a1 ("powerpc: Wire up clone3 syscall")
  commit 1a271a68e030 ("arch: mark syscall number 435 reserved for clone3")
  commit 7615d9e1780e ("arch: wire-up pidfd_open()")
  commit d8076bdb56af ("uapi: Wire up the mount API syscalls on non-x86 arches [ver #2]")
  commit 39036cd27273 ("arch: add pidfd and io_uring syscalls everywhere")
  commit 48166e6ea47d ("y2038: add 64-bit time_t syscalls to all 32-bit architectures")
  commit d33c577cccd0 ("y2038: rename old time and utime syscalls")
  commit 00bf25d693e7 ("y2038: use time32 syscall names on 32-bit")
  commit 8dabe7245bbc ("y2038: syscalls: rename y2038 compat syscalls")
  commit 0d6040d46817 ("arch: add split IPC system calls where needed")

Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lkml.kernel.org/r/20190827071458.19897-1-naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 .../arch/powerpc/entry/syscalls/syscall.tbl   | 146 ++++++++++++++----
 1 file changed, 119 insertions(+), 27 deletions(-)

diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index db3bbb8744af..43f736ed47f2 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -20,7 +20,9 @@
 10	common	unlink				sys_unlink
 11	nospu	execve				sys_execve			compat_sys_execve
 12	common	chdir				sys_chdir
-13	common	time				sys_time			compat_sys_time
+13	32	time				sys_time32
+13	64	time				sys_time
+13	spu	time				sys_time
 14	common	mknod				sys_mknod
 15	common	chmod				sys_chmod
 16	common	lchown				sys_lchown
@@ -36,14 +38,17 @@
 22	spu	umount				sys_ni_syscall
 23	common	setuid				sys_setuid
 24	common	getuid				sys_getuid
-25	common	stime				sys_stime			compat_sys_stime
+25	32	stime				sys_stime32
+25	64	stime				sys_stime
+25	spu	stime				sys_stime
 26	nospu	ptrace				sys_ptrace			compat_sys_ptrace
 27	common	alarm				sys_alarm
 28	32	oldfstat			sys_fstat			sys_ni_syscall
 28	64	oldfstat			sys_ni_syscall
 28	spu	oldfstat			sys_ni_syscall
 29	nospu	pause				sys_pause
-30	nospu	utime				sys_utime			compat_sys_utime
+30	32	utime				sys_utime32
+30	64	utime				sys_utime
 31	common	stty				sys_ni_syscall
 32	common	gtty				sys_ni_syscall
 33	common	access				sys_access
@@ -157,7 +162,9 @@
 121	common	setdomainname			sys_setdomainname
 122	common	uname				sys_newuname
 123	common	modify_ldt			sys_ni_syscall
-124	common	adjtimex			sys_adjtimex			compat_sys_adjtimex
+124	32	adjtimex			sys_adjtimex_time32
+124	64	adjtimex			sys_adjtimex
+124	spu	adjtimex			sys_adjtimex
 125	common	mprotect			sys_mprotect
 126	32	sigprocmask			sys_sigprocmask			compat_sys_sigprocmask
 126	64	sigprocmask			sys_ni_syscall
@@ -198,8 +205,12 @@
 158	common	sched_yield			sys_sched_yield
 159	common	sched_get_priority_max		sys_sched_get_priority_max
 160	common	sched_get_priority_min		sys_sched_get_priority_min
-161	common	sched_rr_get_interval		sys_sched_rr_get_interval	compat_sys_sched_rr_get_interval
-162	common	nanosleep			sys_nanosleep			compat_sys_nanosleep
+161	32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
+161	64	sched_rr_get_interval		sys_sched_rr_get_interval
+161	spu	sched_rr_get_interval		sys_sched_rr_get_interval
+162	32	nanosleep			sys_nanosleep_time32
+162	64	nanosleep			sys_nanosleep
+162	spu	nanosleep			sys_nanosleep
 163	common	mremap				sys_mremap
 164	common	setresuid			sys_setresuid
 165	common	getresuid			sys_getresuid
@@ -213,7 +224,8 @@
 173	nospu	rt_sigaction			sys_rt_sigaction		compat_sys_rt_sigaction
 174	nospu	rt_sigprocmask			sys_rt_sigprocmask		compat_sys_rt_sigprocmask
 175	nospu	rt_sigpending			sys_rt_sigpending		compat_sys_rt_sigpending
-176	nospu	rt_sigtimedwait			sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait
+176	32	rt_sigtimedwait			sys_rt_sigtimedwait_time32	compat_sys_rt_sigtimedwait_time32
+176	64	rt_sigtimedwait			sys_rt_sigtimedwait
 177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
 179	common	pread64				sys_pread64			compat_sys_pread64
@@ -260,7 +272,9 @@
 218	common	removexattr			sys_removexattr
 219	common	lremovexattr			sys_lremovexattr
 220	common	fremovexattr			sys_fremovexattr
-221	common	futex				sys_futex			compat_sys_futex
+221	32	futex				sys_futex_time32
+221	64	futex				sys_futex
+221	spu	futex				sys_futex
 222	common	sched_setaffinity		sys_sched_setaffinity		compat_sys_sched_setaffinity
 223	common	sched_getaffinity		sys_sched_getaffinity		compat_sys_sched_getaffinity
 # 224 unused
@@ -268,7 +282,9 @@
 226	32	sendfile64			sys_sendfile64			compat_sys_sendfile64
 227	common	io_setup			sys_io_setup			compat_sys_io_setup
 228	common	io_destroy			sys_io_destroy
-229	common	io_getevents			sys_io_getevents		compat_sys_io_getevents
+229	32	io_getevents			sys_io_getevents_time32
+229	64	io_getevents			sys_io_getevents
+229	spu	io_getevents			sys_io_getevents
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
 232	nospu	set_tid_address			sys_set_tid_address
@@ -280,19 +296,33 @@
 238	common	epoll_wait			sys_epoll_wait
 239	common	remap_file_pages		sys_remap_file_pages
 240	common	timer_create			sys_timer_create		compat_sys_timer_create
-241	common	timer_settime			sys_timer_settime		compat_sys_timer_settime
-242	common	timer_gettime			sys_timer_gettime		compat_sys_timer_gettime
+241	32	timer_settime			sys_timer_settime32
+241	64	timer_settime			sys_timer_settime
+241	spu	timer_settime			sys_timer_settime
+242	32	timer_gettime			sys_timer_gettime32
+242	64	timer_gettime			sys_timer_gettime
+242	spu	timer_gettime			sys_timer_gettime
 243	common	timer_getoverrun		sys_timer_getoverrun
 244	common	timer_delete			sys_timer_delete
-245	common	clock_settime			sys_clock_settime		compat_sys_clock_settime
-246	common	clock_gettime			sys_clock_gettime		compat_sys_clock_gettime
-247	common	clock_getres			sys_clock_getres		compat_sys_clock_getres
-248	common	clock_nanosleep			sys_clock_nanosleep		compat_sys_clock_nanosleep
+245	32	clock_settime			sys_clock_settime32
+245	64	clock_settime			sys_clock_settime
+245	spu	clock_settime			sys_clock_settime
+246	32	clock_gettime			sys_clock_gettime32
+246	64	clock_gettime			sys_clock_gettime
+246	spu	clock_gettime			sys_clock_gettime
+247	32	clock_getres			sys_clock_getres_time32
+247	64	clock_getres			sys_clock_getres
+247	spu	clock_getres			sys_clock_getres
+248	32	clock_nanosleep			sys_clock_nanosleep_time32
+248	64	clock_nanosleep			sys_clock_nanosleep
+248	spu	clock_nanosleep			sys_clock_nanosleep
 249	32	swapcontext			ppc_swapcontext			ppc32_swapcontext
 249	64	swapcontext			ppc64_swapcontext
 249	spu	swapcontext			sys_ni_syscall
 250	common	tgkill				sys_tgkill
-251	common	utimes				sys_utimes			compat_sys_utimes
+251	32	utimes				sys_utimes_time32
+251	64	utimes				sys_utimes
+251	spu	utimes				sys_utimes
 252	common	statfs64			sys_statfs64			compat_sys_statfs64
 253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
 254	32	fadvise64_64			ppc_fadvise64_64
@@ -308,8 +338,10 @@
 261	nospu	set_mempolicy			sys_set_mempolicy		compat_sys_set_mempolicy
 262	nospu	mq_open				sys_mq_open			compat_sys_mq_open
 263	nospu	mq_unlink			sys_mq_unlink
-264	nospu	mq_timedsend			sys_mq_timedsend		compat_sys_mq_timedsend
-265	nospu	mq_timedreceive			sys_mq_timedreceive		compat_sys_mq_timedreceive
+264	32	mq_timedsend			sys_mq_timedsend_time32
+264	64	mq_timedsend			sys_mq_timedsend
+265	32	mq_timedreceive			sys_mq_timedreceive_time32
+265	64	mq_timedreceive			sys_mq_timedreceive
 266	nospu	mq_notify			sys_mq_notify			compat_sys_mq_notify
 267	nospu	mq_getsetattr			sys_mq_getsetattr		compat_sys_mq_getsetattr
 268	nospu	kexec_load			sys_kexec_load			compat_sys_kexec_load
@@ -324,8 +356,10 @@
 277	nospu	inotify_rm_watch		sys_inotify_rm_watch
 278	nospu	spu_run				sys_spu_run
 279	nospu	spu_create			sys_spu_create
-280	nospu	pselect6			sys_pselect6			compat_sys_pselect6
-281	nospu	ppoll				sys_ppoll			compat_sys_ppoll
+280	32	pselect6			sys_pselect6_time32		compat_sys_pselect6_time32
+280	64	pselect6			sys_pselect6
+281	32	ppoll				sys_ppoll_time32		compat_sys_ppoll_time32
+281	64	ppoll				sys_ppoll
 282	common	unshare				sys_unshare
 283	common	splice				sys_splice
 284	common	tee				sys_tee
@@ -334,7 +368,9 @@
 287	common	mkdirat				sys_mkdirat
 288	common	mknodat				sys_mknodat
 289	common	fchownat			sys_fchownat
-290	common	futimesat			sys_futimesat			compat_sys_futimesat
+290	32	futimesat			sys_futimesat_time32
+290	64	futimesat			sys_futimesat
+290	spu	utimesat			sys_futimesat
 291	32	fstatat64			sys_fstatat64
 291	64	newfstatat			sys_newfstatat
 291	spu	newfstatat			sys_newfstatat
@@ -350,15 +386,21 @@
 301	common	move_pages			sys_move_pages			compat_sys_move_pages
 302	common	getcpu				sys_getcpu
 303	nospu	epoll_pwait			sys_epoll_pwait			compat_sys_epoll_pwait
-304	common	utimensat			sys_utimensat			compat_sys_utimensat
+304	32	utimensat			sys_utimensat_time32
+304	64	utimensat			sys_utimensat
+304	spu	utimensat			sys_utimensat
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
 308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
 309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
-311	common	timerfd_settime			sys_timerfd_settime		compat_sys_timerfd_settime
-312	common	timerfd_gettime			sys_timerfd_gettime		compat_sys_timerfd_gettime
+311	32	timerfd_settime			sys_timerfd_settime32
+311	64	timerfd_settime			sys_timerfd_settime
+311	spu	timerfd_settime			sys_timerfd_settime
+312	32	timerfd_gettime			sys_timerfd_gettime32
+312	64	timerfd_gettime			sys_timerfd_gettime
+312	spu	timerfd_gettime			sys_timerfd_gettime
 313	common	signalfd4			sys_signalfd4			compat_sys_signalfd4
 314	common	eventfd2			sys_eventfd2
 315	common	epoll_create1			sys_epoll_create1
@@ -389,11 +431,15 @@
 340	common	getsockopt			sys_getsockopt			compat_sys_getsockopt
 341	common	sendmsg				sys_sendmsg			compat_sys_sendmsg
 342	common	recvmsg				sys_recvmsg			compat_sys_recvmsg
-343	common	recvmmsg			sys_recvmmsg			compat_sys_recvmmsg
+343	32	recvmmsg			sys_recvmmsg_time32		compat_sys_recvmmsg_time32
+343	64	recvmmsg			sys_recvmmsg
+343	spu	recvmmsg			sys_recvmmsg
 344	common	accept4				sys_accept4
 345	common	name_to_handle_at		sys_name_to_handle_at
 346	common	open_by_handle_at		sys_open_by_handle_at		compat_sys_open_by_handle_at
-347	common	clock_adjtime			sys_clock_adjtime		compat_sys_clock_adjtime
+347	32	clock_adjtime			sys_clock_adjtime32
+347	64	clock_adjtime			sys_clock_adjtime
+347	spu	clock_adjtime			sys_clock_adjtime
 348	common	syncfs				sys_syncfs
 349	common	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
 350	common	setns				sys_setns
@@ -414,6 +460,7 @@
 363	spu	switch_endian			sys_ni_syscall
 364	common	userfaultfd			sys_userfaultfd
 365	common	membarrier			sys_membarrier
+# 366-377 originally left for IPC, now unused
 378	nospu	mlock2				sys_mlock2
 379	nospu	copy_file_range			sys_copy_file_range
 380	common	preadv2				sys_preadv2			compat_sys_preadv2
@@ -424,4 +471,49 @@
 385	nospu	pkey_free			sys_pkey_free
 386	nospu	pkey_mprotect			sys_pkey_mprotect
 387	nospu	rseq				sys_rseq
-388	nospu	io_pgetevents			sys_io_pgetevents		compat_sys_io_pgetevents
+388	32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
+388	64	io_pgetevents			sys_io_pgetevents
+# room for arch specific syscalls
+392	64	semtimedop			sys_semtimedop
+393	common	semget				sys_semget
+394	common	semctl				sys_semctl			compat_sys_semctl
+395	common	shmget				sys_shmget
+396	common	shmctl				sys_shmctl			compat_sys_shmctl
+397	common	shmat				sys_shmat			compat_sys_shmat
+398	common	shmdt				sys_shmdt
+399	common	msgget				sys_msgget
+400	common	msgsnd				sys_msgsnd			compat_sys_msgsnd
+401	common	msgrcv				sys_msgrcv			compat_sys_msgrcv
+402	common	msgctl				sys_msgctl			compat_sys_msgctl
+403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
+404	32	clock_settime64			sys_clock_settime		sys_clock_settime
+405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
+406	32	clock_getres_time64		sys_clock_getres		sys_clock_getres
+407	32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
+408	32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
+409	32	timer_settime64			sys_timer_settime		sys_timer_settime
+410	32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
+411	32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
+412	32	utimensat_time64		sys_utimensat			sys_utimensat
+413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
+414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
+416	32	io_pgetevents_time64		sys_io_pgetevents		sys_io_pgetevents
+417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
+418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
+419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
+420	32	semtimedop_time64		sys_semtimedop			sys_semtimedop
+421	32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
+422	32	futex_time64			sys_futex			sys_futex
+423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
+424	common	pidfd_send_signal		sys_pidfd_send_signal
+425	common	io_uring_setup			sys_io_uring_setup
+426	common	io_uring_enter			sys_io_uring_enter
+427	common	io_uring_register		sys_io_uring_register
+428	common	open_tree			sys_open_tree
+429	common	move_mount			sys_move_mount
+430	common	fsopen				sys_fsopen
+431	common	fsconfig			sys_fsconfig
+432	common	fsmount				sys_fsmount
+433	common	fspick				sys_fspick
+434	common	pidfd_open			sys_pidfd_open
+435	nospu	clone3				ppc_clone3
-- 
2.21.0

