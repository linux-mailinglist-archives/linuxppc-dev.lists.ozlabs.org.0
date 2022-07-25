Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E857357F95A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:26:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqnh5LpYz3dqr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:26:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OjTiM9H8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OjTiM9H8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqn31c3Gz3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:26:15 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6L8Tc001832;
	Mon, 25 Jul 2022 06:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iVfz7UzEcA8ZWYK/uOMxQKkGmv+13Hd+lRiDlidGKBQ=;
 b=OjTiM9H8tsBvAMERGVTheDHgNFp0kR9ZW451H8TKJxr4k4oMKEOCvn2e8bHlKVCPqWf0
 xGU0vn82a17nFV9nbkh6gLGlEG1EA1IHhm6wnYh0g1/HsITWmB7Of6ea5tBjeZmPwyaz
 cVfioXPqm956SdmnElc7+kJQXcAM1gCvVboK3XLcwEcvZGka3/0MBvtf8L5A+7DtZFoJ
 EtJdXROnOGv081Nxt6yzJ/b9SiKpL29OCeoJUIegWeFbaBWIA981xYGPo3nylziApk8f
 qR072tgN+HD6MLYGyNd+apKz+OVdpfu2zG2WiaTysLcKqe5LpjlokdTLyVaAClnSpKPK /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g3yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:26:08 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6Ostq019076;
	Mon, 25 Jul 2022 06:26:08 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g3y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:26:08 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6M0vd017374;
	Mon, 25 Jul 2022 06:26:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3hg97t9yqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:26:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6Q4qq19857860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:26:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1730452057;
	Mon, 25 Jul 2022 06:26:04 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 188F452050;
	Mon, 25 Jul 2022 06:26:01 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/14] powerpc: Remove direct call to mmap2 syscall handlers
Date: Mon, 25 Jul 2022 16:25:58 +1000
Message-Id: <20220725062558.118793-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eBEZW8T5fUj64l6-I89M4hM73AmYxSTH
X-Proofpoint-GUID: vdfmjJoEkEww15e419wYfd4WjZlWv3s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Syscall handlers should not be invoked internally by their symbol names,
as these symbols defined by the architecture-defined SYSCALL_DEFINE
macro. Move the compatibility syscall definition for mmap2 to
syscalls.c, so that all mmap implementations can share an inline helper
function, as is done with the personality handlers.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
---
 arch/powerpc/kernel/sys_ppc32.c                    | 10 ----------
 arch/powerpc/kernel/syscalls.c                     | 11 +++++++++++
 arch/powerpc/kernel/syscalls/syscall.tbl           |  2 +-
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |  4 ++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index c3490adcb158..89e8c478fd6a 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -25,7 +25,6 @@
 #include <linux/poll.h>
 #include <linux/personality.h>
 #include <linux/stat.h>
-#include <linux/mman.h>
 #include <linux/in.h>
 #include <linux/syscalls.h>
 #include <linux/unistd.h>
@@ -48,15 +47,6 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-COMPAT_SYSCALL_DEFINE6(mmap2,
-		       unsigned long, addr, size_t, len,
-		       unsigned long, prot, unsigned long, flags,
-		       unsigned long, fd, unsigned long, pgoff)
-{
-	/* This should remain 12 even if PAGE_SIZE changes */
-	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
-}
-
 /* 
  * long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 22755502afc0..9f339bcb433d 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -56,6 +56,17 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, size_t, len,
 	return do_mmap2(addr, len, prot, flags, fd, pgoff, PAGE_SHIFT-12);
 }
 
+#ifdef CONFIG_COMPAT
+COMPAT_SYSCALL_DEFINE6(mmap2,
+		       unsigned long, addr, size_t, len,
+		       unsigned long, prot, unsigned long, flags,
+		       unsigned long, fd, unsigned long, pgoff)
+{
+	/* This should remain 12 even if PAGE_SIZE changes */
+	return do_mmap2(addr, len, prot, flags, fd, pgoff << 12, PAGE_SHIFT-12);
+}
+#endif
+
 SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 		unsigned long, prot, unsigned long, flags,
 		unsigned long, fd, off_t, offset)
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 54bb5834785f..59d9259dfbb5 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -243,7 +243,7 @@
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_ppc_readahead
-192	32	mmap2				sys_mmap2			compat_sys_ppc_mmap2
+192	32	mmap2				sys_mmap2			compat_sys_mmap2
 193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
 194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 54bb5834785f..437066f5c4b2 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -243,7 +243,7 @@
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_ppc_readahead
-192	32	mmap2				sys_mmap2			compat_sys_ppc_mmap2
+192	32	mmap2				sys_mmap2			compat_sys_mmap2
 193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
 194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
@@ -391,7 +391,7 @@
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
 308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_ppc_fallocate
+309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
-- 
2.34.1

