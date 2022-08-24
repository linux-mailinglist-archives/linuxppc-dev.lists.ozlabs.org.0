Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E259F144
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8fS5YB6z3cdg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lDFsa0wI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lDFsa0wI;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8br6YtWz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:06:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1xp9U008778;
	Wed, 24 Aug 2022 02:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=kxmuhJM2SGL2klW7yPeJSptmMzUwvOr1G+8LwTD0jDA=;
 b=lDFsa0wI+JJZcN1xv0OWYkLt8rrJG0x8FEwkKrqqx3JuenKlUbmv/7saAKevQJFrIuCz
 Udk3wnU4QsAsxr1vcMV6RPp4YTNSBypKGmZ4VutQQG+FBOJJyjLdQE/EtbzPY9DrWIMA
 T7TGGZgDHNg24SeRmzqFjtWLsVL34hj8aaWSN+f3se5Fwva2sjlI+2RPjoNXYlqhyxNZ
 OUIyaOv7z0w1LDPaxcRHC1Qr3AA2TcGSWjyQEZrL7iCG0VftUP5p9kZHUg1rt8c/Bakh
 41Wlg2CGtzAtBsoUpH7xXTJbGSGUohYUoyfUSQSQM7Mm+YSQ+QSBHqiNiFlcU8fGLSeX Fg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag51w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25KIS013932;
	Wed, 24 Aug 2022 02:06:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj4gk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26Zul32047550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB59442045;
	Wed, 24 Aug 2022 02:06:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3999542041;
	Wed, 24 Aug 2022 02:06:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:06:35 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3ED6760151;
	Wed, 24 Aug 2022 12:06:31 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/20] powerpc/32: Remove powerpc select specialisation
Date: Wed, 24 Aug 2022 12:05:31 +1000
Message-Id: <20220824020548.62625-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jiHff1V8jXl5TkKZaPTQbjorODUdJ2R9
X-Proofpoint-ORIG-GUID: jiHff1V8jXl5TkKZaPTQbjorODUdJ2R9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=818 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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

