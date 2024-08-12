Return-Path: <linuxppc-dev+bounces-11-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8494EA1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 11:42:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G8nE2qNm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj8gm0mGzz2xQK;
	Mon, 12 Aug 2024 19:42:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G8nE2qNm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj8gl3YS7z2xJX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 19:42:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C4akWi025491;
	Mon, 12 Aug 2024 09:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=jMyQHgS/ARMULcqGzPivRhrrVb
	x/CVj4cEmhJf7UgdE=; b=G8nE2qNmqlD7ty4ryYdX9Fgm1W8UGwKK4kuU/WUsDE
	giKWUTooOv3G/jXfsXYm7H6K+QocaVylPx1pBPpVspQ992Sk7TrFkv3cKCSFMA6P
	Atq+x1bkTMy00v55a2/LMG0+Xnpz29gy74LKfCQ4E2A1yS6xPPt/2S6UIDDGen3P
	H66RBKoAjnWX3c7GbR75kKybp0ZC3BoeM43opEyBCWjUSMl6LRusXewYFQFVkIIC
	i+qAy1xOB7UdEFiMqcjE2jjht1PaWATx5nuKyxxaO0Wh9L5S3AlJoOsXpCGqzZvt
	0bYvSaP3GxMBKpIEb3PjS5OOECd/nEfcPTt/VT49sI2w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wyq8mgav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 09:42:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47C9gEb9032437;
	Mon, 12 Aug 2024 09:42:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wyq8mgat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 09:42:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47C7eD0b015571;
	Mon, 12 Aug 2024 09:42:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xm1mdpry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 09:42:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47C9g8jB54854080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2024 09:42:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C70A92004B;
	Mon, 12 Aug 2024 09:42:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C48920040;
	Mon, 12 Aug 2024 09:42:06 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.61.128])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Aug 2024 09:42:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2] selftest/powerpc/benchmark: remove requirement libc-dev
Date: Mon, 12 Aug 2024 15:11:52 +0530
Message-ID: <20240812094152.418586-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: afWA52iJvVeHVwNyq0Zacm3cd2C6rY-H
X-Proofpoint-ORIG-GUID: 643BMJGiJqfGfOOJMBRWiiyTzJ5sdWLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_01,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120072

Currently exec-target.c file is linked as static and this
post a requirement to install libc dev package to build.
Without it, build-break when compiling selftest/powerpc/benchmark.

  CC       exec_target
/usr/bin/ld: cannot find -lc: No such file or directory
collect2: error: ld returned 1 exit status

exec_target.c is using "syscall" library function which
could be replaced with a inline assembly and the same is
proposed as a fix here.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Chnagelog v1:
- Add comment for clobber register and proper list of
  clobber registers as suggested by Michael Ellerman and
  Christophe Leroy

 .../selftests/powerpc/benchmarks/Makefile        |  2 +-
 .../selftests/powerpc/benchmarks/exec_target.c   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
index 1321922038d0..ca4483c238b9 100644
--- a/tools/testing/selftests/powerpc/benchmarks/Makefile
+++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
@@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
 
 $(OUTPUT)/fork: LDLIBS += -lpthread
 
-$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
+$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
index c14b0fc1edde..a6408d3f26cd 100644
--- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
+++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
@@ -7,10 +7,22 @@
  */
 
 #define _GNU_SOURCE
-#include <unistd.h>
 #include <sys/syscall.h>
 
 void _start(void)
 {
-	syscall(SYS_exit, 0);
+	asm volatile (
+		"li %%r0, %[sys_exit];"
+		"li %%r3, 0;"
+		"sc;"
+		:
+		: [sys_exit] "i" (SYS_exit)
+		/*
+		 * "sc" will clobber r0, r3-r13, cr0, ctr, xer and memory.
+		 * Even though sys_exit never returns, handle clobber
+		 * registers.
+		 */
+		: "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+		  "r11", "r12", "r13", "cr0", "ctr", "xer", "memory"
+	);
 }
-- 
2.45.2


