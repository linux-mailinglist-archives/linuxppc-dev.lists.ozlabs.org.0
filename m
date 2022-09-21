Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8A5BF713
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTzJ5qN5z3fvy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bg0X3ByO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bg0X3ByO;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTm94kkyz3f2J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L5WNFp012429;
	Wed, 21 Sep 2022 06:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s+NOiyne/+a3sgR13fR7UuizQ4Q/7k0iQDeysu5Z0y4=;
 b=bg0X3ByOwbgxLOg2lRxH4/6gqlM0x1ZEG09Hoq1D9Y6jLPZtYKKFRtWT5ObTnGaOQpwn
 8cYxNlBHjXhNJnoGD4F1wsqUHT4MkFN151FQeRNfw7gjbvaD6pRuMEBt/EQrHBM3ygVz
 blKIgBGacj/qwir2BmLVtYkqEe1q2VFU+gaDGVkItmhUSRvB6joJ/CdtyD/klBmP116+
 W4cNcPwUlvHESr1jnqsaVkpFf6pSzImCUQ6wqGmMoDbclTZPuMpGZNGOtbtHZ9SElrM5
 U125YQxuJmoyCJo7Kfr0eoKrcXsW/c2HTUf5Zj6UudueHHHJFCVH+Hb9+5Hm2en8i8Ns Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6tx2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6mp78002552;
	Wed, 21 Sep 2022 06:58:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6tx1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rCr2025054;
	Wed, 21 Sep 2022 06:58:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jn5v94ujh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wrte15597900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5C8DA405C;
	Wed, 21 Sep 2022 06:58:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 702ECA405B;
	Wed, 21 Sep 2022 06:58:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:58:53 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B2948600EE;
	Wed, 21 Sep 2022 16:58:49 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 17/25] powerpc: Enable compile-time check for syscall handlers
Date: Wed, 21 Sep 2022 16:55:57 +1000
Message-Id: <20220921065605.1051927-18-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nG2QxW3U_3MWp6PVURJJVbk1EstVymjO
X-Proofpoint-GUID: mAHkQ5TEusGMLtEAskfdBsuIcqxPYawO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V2: New patch.
V5: For this patch only, represent handler function pointers as
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

