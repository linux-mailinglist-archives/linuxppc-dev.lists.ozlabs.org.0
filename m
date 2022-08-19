Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5235993A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:44:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M870G56VVz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:43:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oy7t7vAA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oy7t7vAA;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vM4Rlpz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3YDtK012712;
	Fri, 19 Aug 2022 03:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=kxmuhJM2SGL2klW7yPeJSptmMzUwvOr1G+8LwTD0jDA=;
 b=Oy7t7vAAwBqAhN7DFf+BqHuNYYoOfsIWj1Yd+tUKuCPZ6ed7x0zqEixWtefHQm0An5p8
 tc7MW/6o7GR/btJEEF4+Pk/8iB+y6k+aKV08/j3gPscwDZC+dA0Bv8xmATCDQSUndefV
 xTvMQFgT1gA6KSDQZzZtO1Mt8NkZn3M6tYCB/k1xIaS8YGCTGN4duAWtIL7FC9SERDKi
 O382hvoNLO69SD2+s5F5I3eVyTrLrriBNEegnxGJEP/SJ5rcqLcR5kH4eF+n5h0xdvx5
 c9L+nGkCySDnYpHExcOfBAp920b1YAG9jSCE5REg0sU7zKZ21YZ9d8OJNSRHQK0Xb/jf 5Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22qkr3e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3atNv019364;
	Fri, 19 Aug 2022 03:39:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3hx3k950t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dVWg34013666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBF7911C050;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BE4411C04A;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8F08360306;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/18] powerpc/32: Remove powerpc select specialisation
Date: Fri, 19 Aug 2022 13:37:51 +1000
Message-Id: <20220819033806.162054-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1jLmDSI4BNGGoF_yRTy4U-JUllBmDvmM
X-Proofpoint-GUID: 1jLmDSI4BNGGoF_yRTy4U-JUllBmDvmM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=816 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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

Syscall #82 has been implemented for 32-bit platforms in a unique way on
powerpc systems. This hack will in effect guess whether the caller is
expecting new select semantics or old select semantics. It does so via a
guess, based off the first parameter. In new select, this parameter
represents the length of a user-memory array of file descriptors, and in
old select this is a pointer to an arguments structure.

The heuristic simply interprets sufficiently large values of its first
parameter as being a call to old select. The following is a discussion
on how this syscall should be handled.

Link: https://lore.kernel.org/lkml/13737de5-0eb7-e881-9af0-163b0d29a1a0@csgroup.eu/

As discussed in this thread, the existence of such a hack suggests that for
whatever powerpc binaries may predate glibc, it is most likely that they
would have taken use of the old select semantics. x86 and arm64 both
implement this syscall with oldselect semantics.

Remove the powerpc implementation, and update syscall.tbl to refer to emit
a reference to sys_old_select for 32-bit binaries, in keeping with how
other architectures support syscall #82.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Remove arch-specific select handler
V2 -> V3: Remove ppc_old_select prototype in <asm/syscalls.h>. Move to
earlier in patch series
---
 arch/powerpc/include/asm/syscalls.h           |  2 --
 arch/powerpc/kernel/syscalls.c                | 17 -----------------
 arch/powerpc/kernel/syscalls/syscall.tbl      |  2 +-
 .../arch/powerpc/entry/syscalls/syscall.tbl   |  2 +-
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 675a8f5ec3ca..739498c358a1 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -18,8 +18,6 @@ long sys_mmap2(unsigned long addr, size_t len,
 	       unsigned long fd, unsigned long pgoff);
 long ppc64_personality(unsigned long personality);
 long sys_rtas(struct rtas_args __user *uargs);
-int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
-	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
 
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index fc999140bc27..ef5896bee818 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -63,23 +63,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 	return do_mmap2(addr, len, prot, flags, fd, offset, PAGE_SHIFT);
 }
 
-#ifdef CONFIG_PPC32
-/*
- * Due to some executables calling the wrong select we sometimes
- * get wrong args.  This determines how the args are being passed
- * (a single ptr to them all args passed) then calls
- * sys_select() with the appropriate args. -- Cort
- */
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
-{
-	if ((unsigned long)n >= 4096)
-		return sys_old_select((void __user *)n);
-
-	return sys_select(n, inp, outp, exp, tvp);
-}
-#endif
-
 #ifdef CONFIG_PPC64
 long ppc64_personality(unsigned long personality)
 {
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 2600b4237292..4cbbb810ae10 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_old_select			sys_ni_syscall
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 2600b4237292..4cbbb810ae10 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_old_select			sys_ni_syscall
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
-- 
2.34.1

