Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67B57F966
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqr147V8z3drZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STj0kdp8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STj0kdp8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqq93lhqz3dxm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:28:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6KdPq024875;
	Mon, 25 Jul 2022 06:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rjXkcqz5AYTcQwIeTuFmIZq8LW9NIA8BDoXWtn/mXQM=;
 b=STj0kdp89bCEMf3Ec0n02wIu0rjBjBYe6kcU5P11KRlyNaQC/asIDq2EcM16/jXhu9UK
 DFsmjpulUusiOVuwtvjA4ztygJPUOknWSclZb7NhY6MFmxttF79psOwqJyAAubRfFQeB
 v6PVaKnDrmMYM6sY0FS8tX9YpHXjH8Cw5EnbY0FWi7S2+evSnZgZh7zQAHm4S6ZJR8nb
 kdz2iQA9VH4+cf34VUMndv10mF8YdmjaoBRv6fS/9z6XASKpr/U2TpBvTeAdSf8LYt16
 eQo+ektS0sN2JL+hZBgxGlNPgDfBiiMFuwz3ReTSTdq47o+Y8uLWwQJTy4gthsLjlX+H Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhntvg4bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:00 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6MYBj029015;
	Mon, 25 Jul 2022 06:27:59 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhntvg4b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:27:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6Lgwb001238;
	Mon, 25 Jul 2022 06:27:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hg96whywp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:27:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6S98X32244202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:28:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9555BAE053;
	Mon, 25 Jul 2022 06:27:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A508EAE045;
	Mon, 25 Jul 2022 06:27:53 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:27:53 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/14] powerpc: Include all arch-specific syscall prototypes
Date: Mon, 25 Jul 2022 16:27:50 +1000
Message-Id: <20220725062750.119476-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 76_Cw-zYORFpYmLCXUU2TyTUor6_ocEg
X-Proofpoint-ORIG-GUID: bSvCd-A1IHYnm5Jd3JC7cN8WSM0NH78s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Forward declare all syscall handler prototypes where a generic prototype
is not provided in either linux/syscalls.h or linux/compat.h in
asm/syscalls.h. This is required for compile-time type-checking for
syscall handlers, which is implemented later in this series.

32-bit compatibility syscall handlers are expressed in terms of types in
ppc32.h. Expose this header globally.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Explicitly include prototypes.
---
 arch/powerpc/{kernel => include/asm}/ppc32.h |   0
 arch/powerpc/include/asm/syscalls.h          | 104 ++++++++++++-----
 arch/powerpc/kernel/signal_32.c              |   2 +-
 arch/powerpc/perf/callchain_32.c             |   2 +-
 4 files changed, 76 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/ppc32.h b/arch/powerpc/include/asm/ppc32.h
similarity index 100%
rename from arch/powerpc/kernel/ppc32.h
rename to arch/powerpc/include/asm/ppc32.h
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 025d4b877161..8b2757d7f423 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,49 +8,93 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+#ifdef CONFIG_PPC64
+#include <asm/ppc32.h>
+#endif
+#include <asm/unistd.h>
+#include <asm/ucontext.h>
+
 struct rtas_args;
 
-asmlinkage long sys_mmap(unsigned long addr, size_t len,
-		unsigned long prot, unsigned long flags,
-		unsigned long fd, off_t offset);
-asmlinkage long sys_mmap2(unsigned long addr, size_t len,
-		unsigned long prot, unsigned long flags,
-		unsigned long fd, unsigned long pgoff);
-asmlinkage long sys_ppc64_personality(unsigned long personality);
+#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+
+/*
+ * PowerPC architecture-specific syscalls
+ */
+
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
-int sys_ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
-		   fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
-long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-			  u32 len_high, u32 len_low);
+asmlinkage long sys_ni_syscall(void);
 
+#ifdef CONFIG_PPC64
+asmlinkage long sys_ppc64_personality(unsigned long personality);
 #ifdef CONFIG_COMPAT
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			       unsigned long prot, unsigned long flags,
-			       unsigned long fd, unsigned long pgoff);
+asmlinkage long compat_sys_ppc64_personality(unsigned long personality);
+#endif /* CONFIG_COMPAT */
+#endif /* CONFIG_PPC64 */
 
-compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
-				  u32 reg6, u32 pos1, u32 pos2);
+/* Parameters are reordered for powerpc to avoid padding */
+asmlinkage long sys_ppc_fadvise64_64(int fd, int advice,
+				     u32 offset_high, u32 offset_low,
+				     u32 len_high, u32 len_low);
+asmlinkage long sys_swapcontext(struct ucontext __user *old_ctx,
+				struct ucontext __user *new_ctx, long ctx_size);
+asmlinkage long sys_mmap(unsigned long addr, size_t len,
+			 unsigned long prot, unsigned long flags,
+			 unsigned long fd, off_t offset);
+asmlinkage long sys_mmap2(unsigned long addr, size_t len,
+			  unsigned long prot, unsigned long flags,
+			  unsigned long fd, unsigned long pgoff);
+asmlinkage long sys_switch_endian(void);
 
-compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
-				   u32 reg6, u32 pos1, u32 pos2);
+#ifdef CONFIG_PPC32
+asmlinkage long sys_sigreturn(void);
+asmlinkage long sys_debug_setcontext(struct ucontext __user *ctx, int ndbg,
+				     struct sig_dbg_op __user *dbg);
+#endif
 
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count);
+asmlinkage long sys_rt_sigreturn(void);
 
-int compat_sys_truncate64(const char __user *path, u32 reg4,
-			  unsigned long len1, unsigned long len2);
+asmlinkage long sys_subpage_prot(unsigned long addr,
+				 unsigned long len, u32 __user *map);
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1, u32 len2);
+#ifdef CONFIG_COMPAT
+asmlinkage long compat_sys_swapcontext(struct ucontext32 __user *old_ctx,
+				       struct ucontext32 __user *new_ctx,
+				       int ctx_size);
+asmlinkage long compat_sys_old_getrlimit(unsigned int resource,
+					 struct compat_rlimit __user *rlim);
+asmlinkage long compat_sys_sigreturn(void);
+asmlinkage long compat_sys_rt_sigreturn(void);
 
-int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-			   unsigned long len2);
+/* Architecture-specific implementations in sys_ppc32.c */
 
-long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-				size_t len, int advice);
+asmlinkage long compat_sys_mmap2(unsigned long addr, size_t len,
+				     unsigned long prot, unsigned long flags,
+				     unsigned long fd, unsigned long pgoff);
+asmlinkage long compat_sys_ppc_pread64(unsigned int fd,
+				       char __user *ubuf, compat_size_t count,
+				       u32 reg6, u32 pos1, u32 pos2);
+asmlinkage long compat_sys_ppc_pwrite64(unsigned int fd,
+					const char __user *ubuf, compat_size_t count,
+					u32 reg6, u32 pos1, u32 pos2);
+asmlinkage long compat_sys_ppc_readahead(int fd, u32 r4,
+					 u32 offset1, u32 offset2, u32 count);
+asmlinkage long compat_sys_ppc_truncate64(const char __user *path, u32 reg4,
+					  unsigned long len1, unsigned long len2);
+asmlinkage long compat_sys_ppc_fallocate(int fd, int mode, u32 offset1, u32 offset2,
+					 u32 len1, u32 len2);
+asmlinkage long compat_sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
+					   unsigned long len1, unsigned long len2);
+asmlinkage long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+					   size_t len, int advice);
+asmlinkage long compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
+						unsigned int offset1,
+						unsigned int offset2,
+						unsigned int nbytes1,
+						unsigned int nbytes2);
+#endif /* CONFIG_COMPAT */
 
-long compat_sys_sync_file_range2(int fd, unsigned int flags,
-				 unsigned int offset1, unsigned int offset2,
-				 unsigned int nbytes1, unsigned int nbytes2);
-#endif
+#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
 
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_SYSCALLS_H */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 157a7403e3eb..d45c0d7d0a55 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -43,7 +43,7 @@
 #include <asm/tm.h>
 #include <asm/asm-prototypes.h>
 #ifdef CONFIG_PPC64
-#include "ppc32.h"
+#include <asm/ppc32.h>
 #include <asm/unistd.h>
 #else
 #include <asm/ucontext.h>
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index b83c47b7947f..7e94c32b8398 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -19,7 +19,7 @@
 #include "callchain.h"
 
 #ifdef CONFIG_PPC64
-#include "../kernel/ppc32.h"
+#include <asm/ppc32.h>
 #else  /* CONFIG_PPC64 */
 
 #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
-- 
2.34.1

