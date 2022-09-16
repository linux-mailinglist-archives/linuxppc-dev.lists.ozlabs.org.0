Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433175BA65B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTN6v4CSzz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:34:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FVby6n4r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FVby6n4r;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5j4xYBz3bZ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VA9W036445;
	Fri, 16 Sep 2022 05:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fgtYST3d6ORMSboYyjfVA3Kr6KgSetX45I0iwvG7yiE=;
 b=FVby6n4r3AR7AB+UFCGyHVHmrYHwLZ2ZfC9Dbfj8Iu0fLeWeM0uwtmpohsZrbiUYqH6Z
 cAyNSvGZHbD3xl5ulEVIRjwXYM1wX75FSKL5NJXKNiY2fUE8pKjVTEdcLY7y0lSsnRTG
 tUyWsWORmADIK9/rVCVE+2BNsptWjKwLrG5hLvei7FWtGCJ+Tt+L+Zcem4rDjI7tYeCW
 S4W4djsbzzYLntalwhBxQbtuk3LoDmO2UWxTQPEBcUgoyTWP++nV/hD4Vcdq90cZ+fxG
 4J+KuM5p82KEa7bT7Y8R5khE+qLImR7+P6LhXyPmrRWqskbOB8P5b+9VPSSee3FKk+Je QQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2kr1n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Koud013525;
	Fri, 16 Sep 2022 05:33:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jm918ggvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XKO940304918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 047CCA4053;
	Fri, 16 Sep 2022 05:33:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B790A404D;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 889AD6058C;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/23] powerpc: Include all arch-specific syscall prototypes
Date: Fri, 16 Sep 2022 15:32:53 +1000
Message-Id: <20220916053300.786330-17-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lfLhb7P2iGPhU5XVdYLc-O9i9Sx8yqhP
X-Proofpoint-ORIG-GUID: lfLhb7P2iGPhU5XVdYLc-O9i9Sx8yqhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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

Forward declare all syscall handler prototypes where a generic prototype
is not provided in either linux/syscalls.h or linux/compat.h in
asm/syscalls.h. This is required for compile-time type-checking for
syscall handlers, which is implemented later in this series.

32-bit compatibility syscall handlers are expressed in terms of types in
ppc32.h. Expose this header globally.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Explicitly include prototypes.
V2 -> V3: Remove extraneous #include <asm/compat.h> and ppc_fallocate
prototype. Rename header.
V4 -> V5: Clean. Elaborate comment on long long munging. Remove
prototype hiding conditional on SYSCALL_WRAPPER.
---
 arch/powerpc/include/asm/syscalls.h          | 97 ++++++++++++++----
 .../ppc32.h => include/asm/syscalls_32.h}    |  0
 arch/powerpc/kernel/signal_32.c              |  2 +-
 arch/powerpc/perf/callchain_32.c             |  2 +-
 4 files changed, 77 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 525d2aa0c8ca..5d106acf7906 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,6 +8,14 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+#ifdef CONFIG_PPC64
+#include <asm/syscalls_32.h>
+#endif
+#include <asm/unistd.h>
+#include <asm/ucontext.h>
+
+struct rtas_args;
+
 /*
  * long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
@@ -20,44 +28,89 @@
 #define merge_64(high, low) ((u64)high << 32) | low
 #endif
 
-struct rtas_args;
+long sys_ni_syscall(void);
+
+/*
+ * PowerPC architecture-specific syscalls
+ */
+
+long sys_rtas(struct rtas_args __user *uargs);
+
+#ifdef CONFIG_PPC64
+long sys_ppc64_personality(unsigned long personality);
+#ifdef CONFIG_COMPAT
+long compat_sys_ppc64_personality(unsigned long personality);
+#endif /* CONFIG_COMPAT */
+#endif /* CONFIG_PPC64 */
 
+long sys_swapcontext(struct ucontext __user *old_ctx,
+		     struct ucontext __user *new_ctx, long ctx_size);
 long sys_mmap(unsigned long addr, size_t len,
 	      unsigned long prot, unsigned long flags,
 	      unsigned long fd, off_t offset);
 long sys_mmap2(unsigned long addr, size_t len,
 	       unsigned long prot, unsigned long flags,
 	       unsigned long fd, unsigned long pgoff);
-long sys_ppc64_personality(unsigned long personality);
-long sys_rtas(struct rtas_args __user *uargs);
-long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-			  u32 len_high, u32 len_low);
+long sys_switch_endian(void);
 
-#ifdef CONFIG_COMPAT
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			       unsigned long prot, unsigned long flags,
-			       unsigned long fd, unsigned long pgoff);
-
-compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
-				  u32 reg6, u32 pos1, u32 pos2);
+#ifdef CONFIG_PPC32
+long sys_sigreturn(void);
+long sys_debug_setcontext(struct ucontext __user *ctx, int ndbg,
+			  struct sig_dbg_op __user *dbg);
+#endif
 
-compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
-				   u32 reg6, u32 pos1, u32 pos2);
+long sys_rt_sigreturn(void);
 
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count);
+long sys_subpage_prot(unsigned long addr,
+		      unsigned long len, u32 __user *map);
 
-int compat_sys_truncate64(const char __user *path, u32 reg4,
-			  unsigned long len1, unsigned long len2);
+#ifdef CONFIG_COMPAT
+long compat_sys_swapcontext(struct ucontext32 __user *old_ctx,
+			    struct ucontext32 __user *new_ctx,
+			    int ctx_size);
+long compat_sys_old_getrlimit(unsigned int resource,
+			      struct compat_rlimit __user *rlim);
+long compat_sys_sigreturn(void);
+long compat_sys_rt_sigreturn(void);
+#endif /* CONFIG_COMPAT */
 
-int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-			   unsigned long len2);
+/*
+ * Architecture specific signatures required by long long munging:
+ * The 32 bit ABI passes long longs in an odd even register pair.
+ * The following signatures provide a machine long parameter for
+ * each register that will be supplied. The implementation is
+ * responsible for combining parameter pairs.
+ */
 
+#ifdef CONFIG_COMPAT
+long compat_sys_mmap2(unsigned long addr, size_t len,
+		      unsigned long prot, unsigned long flags,
+		      unsigned long fd, unsigned long pgoff);
+long compat_sys_ppc_pread64(unsigned int fd,
+			    char __user *ubuf, compat_size_t count,
+			    u32 reg6, u32 pos1, u32 pos2);
+long compat_sys_ppc_pwrite64(unsigned int fd,
+			     const char __user *ubuf, compat_size_t count,
+			     u32 reg6, u32 pos1, u32 pos2);
+long compat_sys_ppc_readahead(int fd, u32 r4,
+			      u32 offset1, u32 offset2, u32 count);
+long compat_sys_ppc_truncate64(const char __user *path, u32 reg4,
+			       unsigned long len1, unsigned long len2);
+long compat_sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
+				unsigned long len1, unsigned long len2);
 long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
 				size_t len, int advice);
+long compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
+				     unsigned int offset1,
+				     unsigned int offset2,
+				     unsigned int nbytes1,
+				     unsigned int nbytes2);
+#endif /* CONFIG_COMPAT */
 
-long compat_sys_sync_file_range2(int fd, unsigned int flags,
-				 unsigned int offset1, unsigned int offset2,
-				 unsigned int nbytes1, unsigned int nbytes2);
+#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
+long sys_ppc_fadvise64_64(int fd, int advice,
+			  u32 offset_high, u32 offset_low,
+			  u32 len_high, u32 len_low);
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/ppc32.h b/arch/powerpc/include/asm/syscalls_32.h
similarity index 100%
rename from arch/powerpc/kernel/ppc32.h
rename to arch/powerpc/include/asm/syscalls_32.h
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 157a7403e3eb..c114c7f25645 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -43,7 +43,7 @@
 #include <asm/tm.h>
 #include <asm/asm-prototypes.h>
 #ifdef CONFIG_PPC64
-#include "ppc32.h"
+#include <asm/syscalls_32.h>
 #include <asm/unistd.h>
 #else
 #include <asm/ucontext.h>
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index b83c47b7947f..ea8cfe3806dc 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -19,7 +19,7 @@
 #include "callchain.h"
 
 #ifdef CONFIG_PPC64
-#include "../kernel/ppc32.h"
+#include <asm/syscalls_32.h>
 #else  /* CONFIG_PPC64 */
 
 #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
-- 
2.34.1

