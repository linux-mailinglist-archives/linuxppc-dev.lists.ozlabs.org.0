Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8657F958
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqly2Rwsz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TAO//kGt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TAO//kGt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrqlH6BLSz2xD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:24:43 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6Bw1h008736;
	Mon, 25 Jul 2022 06:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lbGhmAsFYBW9WK8EGZHIwImBJj0MJ35Ysjngq8k4wk0=;
 b=TAO//kGtNGGuwj7P58Q0aByClsFXQCoMLn8Lsq8sX7fGeLoyr/NDYtiQUUeKslTp0Qip
 r+ScFyl6kEjs3fytrkQ0Zw5kozhA5v9mJQYvjhq9AWmRbsFU5QdlKVYOIuDOee63cblq
 rEAY0J/jeZCMSblYohMXywQkMQsadYxesjQMbJl6gOLqGsW1pDLFKbA1e58EGFywAUJX
 Dx9i1hLUkM0ulDHWVmsWWpugWV/P0Pjfp4xD78nUJ7noAzTBqwzsKvKIzDXWio4drCt0
 IuvdUWHQckqxsP/Dhrp6Q42ZIK29L5sLdJBzPz0GRO/5nZ/xlpYMXiaV+Ky3uvn63CRQ Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp89pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:24:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6DXuB014281;
	Mon, 25 Jul 2022 06:24:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp89ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:24:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LSiK016935;
	Mon, 25 Jul 2022 06:24:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3hg97t9ynm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:24:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6OVTV14352884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:24:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4B13AE055;
	Mon, 25 Jul 2022 06:24:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E6F1AE045;
	Mon, 25 Jul 2022 06:24:29 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:24:28 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/14] powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
Date: Mon, 25 Jul 2022 16:24:20 +1000
Message-Id: <20220725062420.118013-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BPla-dVPBDanCI3--i5r4PGITHtCkpRd
X-Proofpoint-ORIG-GUID: Yk4wxx_7JSs3fIqOPK_DhF8NkK0Gwk4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=494 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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
Cc: christophe.leroy@c-s.fr, Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arch-specific implementations of syscall handlers are currently used
over generic implementations for the following reasons:

 1. Semantics unique to powerpc
 2. Compatibility syscalls require 'argument padding' to comply with
    64-bit argument convention in ELF32 abi.
 3. Parameter types or order is different in other architectures.

These syscall handlers have been defined prior to this patch series
without invoking the SYSCALL_DEFINE or COMPAT_SYSCALL_DEFINE macros with
custom input and output types. We remove every such direct definition in
favour of the aforementioned macros.

Also update syscalls.tbl in order to refer to the symbol names generated
by each of these macros. Since ppc64_personality can be called by both
64 bit and 32 bit binaries through compatibility, we must generate both
both compat_sys_ and sys_ symbols for this handler.

A number of architectures including arm and powerpc agree on an
alternative argument order and numbering for most of these arch-specific
handlers. A future patch series may allow for asm/unistd.h to signal
through its defines that a generic implementation of these syscall
handlers with the correct calling convention be omitted, through the
__ARCH_WANT_COMPAT_SYS_... convention.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: All syscall handlers wrapped by this macro.
---
 arch/powerpc/include/asm/syscalls.h          | 14 ++---
 arch/powerpc/kernel/sys_ppc32.c              | 50 +++++++++++-------
 arch/powerpc/kernel/syscalls.c               | 25 ++++++---
 arch/powerpc/kernel/syscalls/syscall.tbl     | 28 +++++-----
 .../arch/powerpc/entry/syscalls/syscall.tbl  | 28 +++++-----
 5 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index a2b13e55254f..025d4b877161 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -16,12 +16,12 @@ asmlinkage long sys_mmap(unsigned long addr, size_t len,
 asmlinkage long sys_mmap2(unsigned long addr, size_t len,
 		unsigned long prot, unsigned long flags,
 		unsigned long fd, unsigned long pgoff);
-asmlinkage long ppc64_personality(unsigned long personality);
+asmlinkage long sys_ppc64_personality(unsigned long personality);
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
-int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
-	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low);
+int sys_ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
+		   fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
+long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
+			  u32 len_high, u32 len_low);
 
 #ifdef CONFIG_COMPAT
 unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
@@ -44,8 +44,8 @@ long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1,
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 			   unsigned long len2);
 
-long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-		     size_t len, int advice);
+long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+				size_t len, int advice);
 
 long compat_sys_sync_file_range2(int fd, unsigned int flags,
 				 unsigned int offset1, unsigned int offset2,
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 16ff0399a257..c3490adcb158 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -48,9 +48,10 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			  unsigned long prot, unsigned long flags,
-			  unsigned long fd, unsigned long pgoff)
+COMPAT_SYSCALL_DEFINE6(mmap2,
+		       unsigned long, addr, size_t, len,
+		       unsigned long, prot, unsigned long, flags,
+		       unsigned long, fd, unsigned long, pgoff)
 {
 	/* This should remain 12 even if PAGE_SIZE changes */
 	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
@@ -68,52 +69,63 @@ unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
 #define merge_64(high, low) ((u64)high << 32) | low
 #endif
 
-compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
-			     u32 reg6, u32 pos1, u32 pos2)
+COMPAT_SYSCALL_DEFINE6(ppc_pread64,
+		       unsigned int, fd,
+		       char __user *, ubuf, compat_size_t, count,
+		       u32, reg6, u32, pos1, u32, pos2)
 {
 	return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
-			      u32 reg6, u32 pos1, u32 pos2)
+COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
+		       unsigned int, fd,
+		       const char __user *, ubuf, compat_size_t, count,
+		       u32, reg6, u32, pos1, u32, pos2)
 {
 	return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count)
+COMPAT_SYSCALL_DEFINE5(ppc_readahead,
+		       int, fd, u32, r4,
+		       u32, offset1, u32, offset2, u32, count)
 {
 	return ksys_readahead(fd, merge_64(offset1, offset2), count);
 }
 
-asmlinkage int compat_sys_truncate64(const char __user * path, u32 reg4,
-				unsigned long len1, unsigned long len2)
+COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
+		       const char __user *, path, u32, reg4,
+		       unsigned long, len1, unsigned long, len2)
 {
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
-				     u32 len1, u32 len2)
+COMPAT_SYSCALL_DEFINE6(ppc_fallocate,
+		       int, fd, int, mode, u32, offset1, u32, offset2,
+		       u32, len1, u32, len2)
 {
 	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
 			     merge_64(len1, len2));
 }
 
-asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-				 unsigned long len2)
+COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
+		       unsigned int, fd, u32, reg4, unsigned long, len1,
+		       unsigned long, len2)
 {
 	return ksys_ftruncate(fd, merge_64(len1, len2));
 }
 
-long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-		     size_t len, int advice)
+COMPAT_SYSCALL_DEFINE6(ppc32_fadvise64,
+		       int, fd, u32, unused, u32, offset1, u32, offset2,
+		       size_t, len, int, advice)
 {
 	return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
 				 advice);
 }
 
-asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
-				   unsigned offset1, unsigned offset2,
-				   unsigned nbytes1, unsigned nbytes2)
+COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
+		       int, fd, unsigned int, flags,
+		       unsigned int, offset1, unsigned int, offset2,
+		       unsigned int, nbytes1, unsigned int, nbytes2)
 {
 	loff_t offset = merge_64(offset1, offset2);
 	loff_t nbytes = merge_64(nbytes1, nbytes2);
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index fc999140bc27..ca20083dd0ae 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -70,8 +70,9 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
  * (a single ptr to them all args passed) then calls
  * sys_select() with the appropriate args. -- Cort
  */
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
+SYSCALL_DEFINE5(ppc_select, int, n, fd_set __user *, inp,
+		fd_set __user *, outp, fd_set __user *, exp,
+		struct __kernel_old_timeval __user *, tvp)
 {
 	if ((unsigned long)n >= 4096)
 		return sys_old_select((void __user *)n);
@@ -81,7 +82,7 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, s
 #endif
 
 #ifdef CONFIG_PPC64
-long ppc64_personality(unsigned long personality)
+static inline long do_ppc64_personality(unsigned long personality)
 {
 	long ret;
 
@@ -93,10 +94,22 @@ long ppc64_personality(unsigned long personality)
 		ret = (ret & ~PER_MASK) | PER_LINUX;
 	return ret;
 }
-#endif
 
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low)
+SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
+{
+	return do_ppc64_personality(personality);
+}
+#ifdef CONFIG_COMPAT
+COMPAT_SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
+{
+	return do_ppc64_personality(personality);
+}
+#endif /* CONFIG_COMPAT */
+#endif /* CONFIG_PPC64 */
+
+SYSCALL_DEFINE6(ppc_fadvise64_64,
+		int, fd, int, advice, u32, offset_high, u32, offset_low,
+		u32, len_high, u32, len_low)
 {
 	return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
 				 (u64)len_high << 32 | len_low, advice);
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 2600b4237292..54bb5834785f 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_ppc_select			sys_ni_syscall
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
@@ -178,9 +178,9 @@
 133	common	fchdir				sys_fchdir
 134	common	bdflush				sys_ni_syscall
 135	common	sysfs				sys_sysfs
-136	32	personality			sys_personality			ppc64_personality
-136	64	personality			ppc64_personality
-136	spu	personality			ppc64_personality
+136	32	personality			sys_personality			compat_sys_ppc64_personality
+136	64	personality			sys_ppc64_personality
+136	spu	personality			sys_ppc64_personality
 137	common	afs_syscall			sys_ni_syscall
 138	common	setfsuid			sys_setfsuid
 139	common	setfsgid			sys_setfsgid
@@ -228,8 +228,8 @@
 176	64	rt_sigtimedwait			sys_rt_sigtimedwait
 177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-179	common	pread64				sys_pread64			compat_sys_pread64
-180	common	pwrite64			sys_pwrite64			compat_sys_pwrite64
+179	common	pread64				sys_pread64			compat_sys_ppc_pread64
+180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
@@ -242,10 +242,10 @@
 188	common 	putpmsg				sys_ni_syscall
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
-191	common	readahead			sys_readahead			compat_sys_readahead
-192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
+191	common	readahead			sys_readahead			compat_sys_ppc_readahead
+192	32	mmap2				sys_mmap2			compat_sys_ppc_mmap2
+193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
+194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
 196	32	lstat64				sys_lstat64
 197	32	fstat64				sys_fstat64
@@ -288,7 +288,7 @@
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
 232	nospu	set_tid_address			sys_set_tid_address
-233	common	fadvise64			sys_fadvise64			ppc32_fadvise64
+233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
 234	nospu	exit_group			sys_exit_group
 235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
 236	common	epoll_create			sys_epoll_create
@@ -323,7 +323,7 @@
 251	spu	utimes				sys_utimes
 252	common	statfs64			sys_statfs64			compat_sys_statfs64
 253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
-254	32	fadvise64_64			ppc_fadvise64_64
+254	32	fadvise64_64			sys_ppc_fadvise64_64
 254	spu	fadvise64_64			sys_ni_syscall
 255	common	rtas				sys_rtas
 256	32	sys_debug_setcontext		sys_debug_setcontext		sys_ni_syscall
@@ -390,8 +390,8 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
+308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
+309	nospu	fallocate			sys_fallocate			compat_sys_ppc_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 2600b4237292..54bb5834785f 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_ppc_select			sys_ni_syscall
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
@@ -178,9 +178,9 @@
 133	common	fchdir				sys_fchdir
 134	common	bdflush				sys_ni_syscall
 135	common	sysfs				sys_sysfs
-136	32	personality			sys_personality			ppc64_personality
-136	64	personality			ppc64_personality
-136	spu	personality			ppc64_personality
+136	32	personality			sys_personality			compat_sys_ppc64_personality
+136	64	personality			sys_ppc64_personality
+136	spu	personality			sys_ppc64_personality
 137	common	afs_syscall			sys_ni_syscall
 138	common	setfsuid			sys_setfsuid
 139	common	setfsgid			sys_setfsgid
@@ -228,8 +228,8 @@
 176	64	rt_sigtimedwait			sys_rt_sigtimedwait
 177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-179	common	pread64				sys_pread64			compat_sys_pread64
-180	common	pwrite64			sys_pwrite64			compat_sys_pwrite64
+179	common	pread64				sys_pread64			compat_sys_ppc_pread64
+180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
@@ -242,10 +242,10 @@
 188	common 	putpmsg				sys_ni_syscall
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
-191	common	readahead			sys_readahead			compat_sys_readahead
-192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
+191	common	readahead			sys_readahead			compat_sys_ppc_readahead
+192	32	mmap2				sys_mmap2			compat_sys_ppc_mmap2
+193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
+194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
 196	32	lstat64				sys_lstat64
 197	32	fstat64				sys_fstat64
@@ -288,7 +288,7 @@
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
 232	nospu	set_tid_address			sys_set_tid_address
-233	common	fadvise64			sys_fadvise64			ppc32_fadvise64
+233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
 234	nospu	exit_group			sys_exit_group
 235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
 236	common	epoll_create			sys_epoll_create
@@ -323,7 +323,7 @@
 251	spu	utimes				sys_utimes
 252	common	statfs64			sys_statfs64			compat_sys_statfs64
 253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
-254	32	fadvise64_64			ppc_fadvise64_64
+254	32	fadvise64_64			sys_ppc_fadvise64_64
 254	spu	fadvise64_64			sys_ni_syscall
 255	common	rtas				sys_rtas
 256	32	sys_debug_setcontext		sys_debug_setcontext		sys_ni_syscall
@@ -390,8 +390,8 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
+308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
+309	nospu	fallocate			sys_fallocate			compat_sys_ppc_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
-- 
2.34.1

