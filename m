Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3E539CD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 07:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCdbF3WDgz3brR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 15:52:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=piORRS+y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=piORRS+y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCdWY1dZXz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 15:49:29 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2515gKse024791;
	Wed, 1 Jun 2022 05:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Vh7do/3HXMhwhvFiRWGof9JQR/GlTj+KphP3SRAsUrI=;
 b=piORRS+yZ6lZErMwfVC2G6167rTJJ4i03uZVivZroh7GbshX7xvLNMaYD2HFb+cRcXX9
 MDxDujyoztbL2sBTeg9BVPshFzktFt5f0DtO8v0MkLq5AV22b5NyFwObgO0O1p7MYGK6
 8OtLlfYKp2EXPUr5tgZSw6SvdOr3dUCbfPrpcyizfyM638lJ9HdXIC5GjkBgNJYeXRV0
 NolomKluGQiNkNMmtxXAvq0nBH2VPBsQTsE0zmdIWidPAzWx/qayogA3NaJH1U3KU293
 Zr1dQimpclsSyvTpndGuqQWr6LJ/j6eQ1vOoXaV+WmEeiom9KnhcrkgqbavUb/1q0Q+5 lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge26nr31t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:21 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2515jKRd031362;
	Wed, 1 Jun 2022 05:49:21 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge26nr31b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2515ZBSg001871;
	Wed, 1 Jun 2022 05:49:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gbcae530n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2515nG5a50266440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 05:49:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 601BB11C04C;
	Wed,  1 Jun 2022 05:49:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99EE111C04A;
	Wed,  1 Jun 2022 05:49:14 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.94])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 05:49:14 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc: Move syscall handler prototypes to header
Date: Wed,  1 Jun 2022 15:48:49 +1000
Message-Id: <20220601054850.250287-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601054850.250287-1-rmclure@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e4xqJrTGnXMdBJjvroSTHqZVgtZvP5n9
X-Proofpoint-ORIG-GUID: K4qnUYg0XZeMGNcKXg13bC-Y8Fbp7iOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=960 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010025
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

Since some power syscall handlers call into other syscall handlers with
the usual in-register calling convention, emit symbols for both
conventions when required. The prototypes for handlers supporting
in-register parameters should exist in a header rather than immediately
preceding their usage.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/syscalls.h | 16 ++++++++++++++++
 arch/powerpc/kernel/syscalls.c      |  7 -------
 arch/powerpc/kernel/vdso.c          |  3 +--
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 75d8e1822caf..1e5f2ddcabe0 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -43,6 +43,22 @@
 
 struct rtas_args;
 
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+#include <linux/syscalls.h>
+asmlinkage long sys_ni_syscall(void);
+#ifdef CONFIG_PPC32
+asmlinkage long sys_old_select(struct sel_arg_struct __user *arg);
+asmlinkage long sys_select(int n, fd_set __user *inp, fd_set __user *outp,
+			   fd_set __user *exp,
+			   struct __kernel_old_timeval __user *tvp);
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+asmlinkage long sys_personality(unsigned int personality);
+#endif /* CONFIG_PPC64 */
+
+#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
+
 asmlinkage long sys_mmap(unsigned long addr, size_t len,
 			 unsigned long prot, unsigned long flags,
 			 unsigned long fd, off_t offset);
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index c64cdb5c4435..6107bdd5dad1 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -64,11 +64,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 }
 
 #ifdef CONFIG_PPC32
-asmlinkage long sys_old_select(struct sel_arg_struct __user *arg);
-asmlinkage long sys_select(int n, fd_set __user *inp, fd_set __user *outp,
-			   fd_set __user *exp,
-			   struct __kernel_old_timeval __user *tvp);
-
 /*
  * Due to some executables calling the wrong select we sometimes
  * get wrong args.  This determines how the args are being passed
@@ -87,8 +82,6 @@ PPC_SYSCALL_DEFINE(5, long, ppc_select,
 #endif
 
 #ifdef CONFIG_PPC64
-asmlinkage long sys_personality(unsigned int personality);
-
 PPC_SYSCALL_DEFINE(1, long, ppc64_personality, unsigned long, personality)
 {
 	long ret;
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index dcf57c07dbad..8a56e290fcaf 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -22,6 +22,7 @@
 #include <vdso/datapage.h>
 
 #include <asm/syscall.h>
+#include <asm/syscalls.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -40,8 +41,6 @@
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 
-asmlinkage long sys_ni_syscall(void);
-
 /*
  * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
  * Once the early boot kernel code no longer needs to muck around
-- 
2.34.1

