Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39D5BA674
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNL226Vvz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:44:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ieksT5je;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ieksT5je;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5l3YtWz3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5M66W010208;
	Fri, 16 Sep 2022 05:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6q7SrRk0n7ZvaurZg+Ju5kaD/unDcZhdgeeT5rUcecM=;
 b=ieksT5jepzeRQ5Lo/rFeFX/rXJVzGYanT/mVnqcHoloa42dHvBNN7gxM4oZXV8qBLGBa
 fNGxJA2eko82qzYx/lET1uQ15c4RvQO62uUsXIacw1ceU8iKQOjZhD4tMl2l4+F30h77
 ELvA+b/eeJIu5UOM2VNVA2NEXLW4vXjfJ1u9BotCBWIc9n+fi+/A+JzjIG/xQ6TKDnDC
 pexpZwmrRPvfBsN3JvpnOP1SEgLeelyPy7XjnyrknLF8hLmhOE58po4ySMj/VRJ+7BsU
 YPhtLjyY3UW3GOZfFHuKsaOtwzoFJkceDs92Medrk9klbdGMggzUlZBuWn/WSth0+qFp yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjxe88st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:24 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5NAQv013187;
	Fri, 16 Sep 2022 05:33:23 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjxe88s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5JvqF025385;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jm91p0cqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XJhh42664388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59A7511C054;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04AF611C052;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9063D60571;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/23] powerpc: Enable compile-time check for syscall handlers
Date: Fri, 16 Sep 2022 15:32:54 +1000
Message-Id: <20220916053300.786330-18-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vC1gBXqBodWjvtw7GrgJR7HWMBP1Brud
X-Proofpoint-ORIG-GUID: VE1vnYipVLdRO2px1zglJXr7KCPpCoK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The table of syscall handlers and registered compatibility syscall
handlers has in past been produced using assembly, with function
references resolved at link time. This moves link-time errors to
compile-time, by rewriting systbl.S in C, and including the
linux/syscalls.h, linux/compat.h and asm/syscalls.h headers for
prototypes.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Nicholas Piggin <npiggin@gmail.com>
---
V1 -> V2: New patch.
V4 -> V5: For this patch only, represent handler function pointers as
unsigned long. Remove reference to syscall wrappers. Use asm/syscalls.h
which implies asm/syscall.h
---
 arch/powerpc/kernel/{systbl.S => systbl.c} | 28 ++++++++------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.c
similarity index 61%
rename from arch/powerpc/kernel/systbl.S
rename to arch/powerpc/kernel/systbl.c
index 6c1db3b6de2d..ce52bd2ec292 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.c
@@ -10,32 +10,26 @@
  * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com) 
  */
 
-#include <asm/ppc_asm.h>
+#include <linux/syscalls.h>
+#include <linux/compat.h>
+#include <asm/unistd.h>
+#include <asm/syscalls.h>
 
-.section .rodata,"a"
+#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
+#define __SYSCALL(nr, entry) [nr] = (unsigned long) &entry,
 
-#ifdef CONFIG_PPC64
-	.p2align	3
-#define __SYSCALL(nr, entry)	.8byte entry
-#else
-	.p2align	2
-#define __SYSCALL(nr, entry)	.long entry
-#endif
-
-#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
-.globl sys_call_table
-sys_call_table:
+const unsigned long sys_call_table[] = {
 #ifdef CONFIG_PPC64
 #include <asm/syscall_table_64.h>
 #else
 #include <asm/syscall_table_32.h>
 #endif
+};
 
 #ifdef CONFIG_COMPAT
 #undef __SYSCALL_WITH_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
-.globl compat_sys_call_table
-compat_sys_call_table:
-#define compat_sys_sigsuspend	sys_sigsuspend
+const unsigned long compat_sys_call_table[] = {
 #include <asm/syscall_table_32.h>
-#endif
+};
+#endif /* CONFIG_COMPAT */
-- 
2.34.1

