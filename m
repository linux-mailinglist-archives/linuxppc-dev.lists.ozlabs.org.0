Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663335BA678
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNMW1RW4z3f8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:45:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRacq0K2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRacq0K2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5q2dpfz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5Ue0U002952;
	Fri, 16 Sep 2022 05:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1ADrWLHAPihkbJ5DH8eg6ykZQwBum7y2cHLLnAjGCg4=;
 b=BRacq0K2x7k1DJKEp/RoWuJiBMck1p1JK5YkSn5h0D2xliqV9kgKHsMd6n5uilQXf/Z5
 sRmvG6tVfJlArGuKB9dvsGlvnSPHM/zaJ28ZxKJnycmHiAToYVkbt5d+t7pxlxMJzvST
 poq2tuLPKLA+aJE4PJl+QD2EzopmnM4T7s2XsYtu/sgN6bPQKUtcBG6bCQ9KFEMIn3ya
 yolhXuO3xUzH/SVhO0hpohJ8tV863PTJApEhjIs8c6oPsZDqZ6Y59czETTw7W3VL734s
 k7Uj2evwqEik5QJ/uJVvq62aUPrHvlnxYDQ2o/DxxUG+yidsTgUkDwHGRE98ShRRoPGL Uw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f81xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kh9f020995;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3jm9218gwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XJ4s38338966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64686AE051;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB64AAE045;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D3756057F;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/23] powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
Date: Fri, 16 Sep 2022 15:32:52 +1000
Message-Id: <20220916053300.786330-16-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fUgV25Qf9F-oCk5-6bbql9lzmlPB7KDq
X-Proofpoint-GUID: fUgV25Qf9F-oCk5-6bbql9lzmlPB7KDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=831 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
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

As an aside:
A number of architectures including arm and powerpc agree on an
alternative argument order and numbering for most of these arch-specific
handlers. A future patch series may allow for asm/unistd.h to signal
through its defines that a generic implementation of these syscall
handlers with the correct calling convention be emitted, through the
__ARCH_WANT_COMPAT_SYS_... convention.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: All syscall handlers wrapped by this macro.
V2 -> V3: Move creation of do_ppc64_personality helper to prior patch.
V3 -> V4: Fix parenthesis alignment. Don't emit sys_*** symbols.
V4 -> V5: Use 'aside' in the asm-generic rant in commit message.
---
 arch/powerpc/include/asm/syscalls.h          | 10 ++---
 arch/powerpc/kernel/sys_ppc32.c              | 38 +++++++++++-------
 arch/powerpc/kernel/syscalls.c               | 17 ++++++--
 arch/powerpc/kernel/syscalls/syscall.tbl     | 22 +++++-----
 .../arch/powerpc/entry/syscalls/syscall.tbl  | 22 +++++-----
 5 files changed, 64 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 20cbd29b1228..525d2aa0c8ca 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -28,10 +28,10 @@ long sys_mmap(unsigned long addr, size_t len,
 long sys_mmap2(unsigned long addr, size_t len,
 	       unsigned long prot, unsigned long flags,
 	       unsigned long fd, unsigned long pgoff);
-long ppc64_personality(unsigned long personality);
+long sys_ppc64_personality(unsigned long personality);
 long sys_rtas(struct rtas_args __user *uargs);
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low);
+long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
+			  u32 len_high, u32 len_low);
 
 #ifdef CONFIG_COMPAT
 unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
@@ -52,8 +52,8 @@ int compat_sys_truncate64(const char __user *path, u32 reg4,
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 			   unsigned long len2);
 
-long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-		     size_t len, int advice);
+long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+				size_t len, int advice);
 
 long compat_sys_sync_file_range2(int fd, unsigned int flags,
 				 unsigned int offset1, unsigned int offset2,
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 776ae7565fc5..dcc3c9fd4cfd 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -47,45 +47,55 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
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
 
-int compat_sys_truncate64(const char __user * path, u32 reg4,
-				unsigned long len1, unsigned long len2)
+COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
+		       const char __user *, path, u32, reg4,
+		       unsigned long, len1, unsigned long, len2)
 {
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-				 unsigned long len2)
+COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
+		       unsigned int, fd, u32, reg4,
+		       unsigned long, len1, unsigned long, len2)
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
 
-long compat_sys_sync_file_range2(int fd, unsigned int flags,
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
index 135a0b9108d5..3a35c690150b 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -87,14 +87,23 @@ static long do_ppc64_personality(unsigned long personality)
 		ret = (ret & ~PER_MASK) | PER_LINUX;
 	return ret;
 }
-long ppc64_personality(unsigned long personality)
+
+SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
 {
 	return do_ppc64_personality(personality);
 }
-#endif
 
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low)
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
 	return ksys_fadvise64_64(fd, merge_64(offset_high, offset_low),
 				 merge_64(len_high, len_low), advice);
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 64f27cbbdd2c..2bca64f96164 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
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
+191	common	readahead			sys_readahead			compat_sys_ppc_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
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
@@ -390,7 +390,7 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
+308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
 309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 64f27cbbdd2c..2bca64f96164 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
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
+191	common	readahead			sys_readahead			compat_sys_ppc_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
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
@@ -390,7 +390,7 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_range2
+308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
 309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
-- 
2.34.1

