Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D15BA67C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNQM2nXgz3fH7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAt7E7eQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAt7E7eQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTNCS5Ydlz3fR3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:38:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VJEn004074;
	Fri, 16 Sep 2022 05:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=UX0f1CD98QltkImvvvAoNYBKLwE4PSe7YiLsOiuClZ8=;
 b=sAt7E7eQqVqwLN4Prh8IOssxB4oB/44cFUVkc0U22QMZcVT9+USliafAWNY64iZTh85y
 TiA2I+iQ48nuX89kER9R5700L3dqxfwiqut/QRs/aPv/fW6UPGRmdfFZ8SRJjpnTnxre
 HRIb0gXQMmiHflU5PU/iOkSiRPtqh0IjrC9gvSdTgoqEFkAxcQkVKdOIG3MGvZw6rNYJ
 PzxLgJnuJLbK68c2cVD/YjOiJjC+jdbqMLne8rZFPMceSqmEB8sUlPlsVo4BC/+5MDy5
 89r3a1Hq4qVwx9dFE8rG0slTGGn8Bkj56Gou+haEZI0VosvsXpvyCLBxkl/FFhQz4ma0 Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f888a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:38:24 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5WMbb008429;
	Fri, 16 Sep 2022 05:38:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f8862-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:38:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kwpw022293;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3jm921gh8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XIlr30540194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB02442042;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E3D342041;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 656DC6056F;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/23] powerpc/32: Remove powerpc select specialisation
Date: Fri, 16 Sep 2022 15:32:48 +1000
Message-Id: <20220916053300.786330-12-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QdqFp1GLsTIOvY815ia2JpjO7g17svC6
X-Proofpoint-GUID: TwD46pgajtQTRltXbL0C-PNMNkd2scwK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=924 suspectscore=0 clxscore=1015
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
a reference to sys_old_select and compat_sys_old_select
for 32-bit binaries, in keeping with how other architectures support
syscall #82.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V1 -> V2: Remove arch-specific select handler
V2 -> V3: Remove ppc_old_select prototype in <asm/syscalls.h>. Move to
earlier in patch series
V4 -> V5: Use compat_sys_old_select on 64-bit systems.
---
 arch/powerpc/include/asm/syscalls.h           |  2 --
 arch/powerpc/kernel/syscalls.c                | 17 -----------------
 arch/powerpc/kernel/syscalls/syscall.tbl      |  2 +-
 .../arch/powerpc/entry/syscalls/syscall.tbl   |  2 +-
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 960b3871db72..20cbd29b1228 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -30,8 +30,6 @@ long sys_mmap2(unsigned long addr, size_t len,
 	       unsigned long fd, unsigned long pgoff);
 long ppc64_personality(unsigned long personality);
 long sys_rtas(struct rtas_args __user *uargs);
-int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
-	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
 
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index abc3fbb3c490..34e1ae88e15b 100644
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
index 2600b4237292..64f27cbbdd2c 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_old_select			compat_sys_old_select
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 2600b4237292..64f27cbbdd2c 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -110,7 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
+82	32	select				sys_old_select			compat_sys_old_select
 82	64	select				sys_ni_syscall
 82	spu	select				sys_ni_syscall
 83	common	symlink				sys_symlink
-- 
2.34.1

