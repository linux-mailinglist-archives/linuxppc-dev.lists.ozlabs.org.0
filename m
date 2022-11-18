Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A662F903
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKzb5rnRz3f3K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:13:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N1nIUr4x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N1nIUr4x;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsX5f5yz3cK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:00 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7tTj030575
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FIlI86coPOlEvddwBlto5iPpcnoYDW43YX0SybvQvVI=;
 b=N1nIUr4xCWgYADGeH9zeMtg/aOrJZuukynyz5wCXUD4EJjX/Iindmzi6gMM4vWRMZGIE
 aYQgWTDV4mqnSevxIwTfZ+LFBwsOaECu4XTm49PSRGUI44htjccTXQqnE/ooREl717eM
 E+hL+rwQM/KoKR+PW4CxBfJmHIHojl4yoxvUcSzsJJgOVDmKtIlaYZ+BKKyxJqvDBXQI
 6rRG/e05wnkEV5ItgZ5pBtxzmpkd6tG+SHlmhlTVKor6UMgb3Smn46vkP9yo61s5ESz+
 YoYOLtUKgBSd2qUmiObSczUK7ZDTg6gJBuwJ9Cj6g8PeHHYrSaRV6J8yRUc18TN0H/TP GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxa0tc3vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEjD43039307
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:57 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxa0tc3vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:57 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF7SBS009913;
	Fri, 18 Nov 2022 15:07:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma04dal.us.ibm.com with ESMTP id 3kt34aj81a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7vWL49611182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2393158057;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A49B58059;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/13] powerpc/rtas: clean up includes
Date: Fri, 18 Nov 2022 09:07:45 -0600
Message-Id: <20221118150751.469393-8-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CenyGfBHSemBAv_bZGBjO7k_2ZwUCI_2
X-Proofpoint-GUID: nltHSuZDJreOkCBlt3vFbY1ngzcAL_5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=902 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas.c used to host complex code related to pseries-specific guest
migration and suspend, which used atomics, completions, hcalls, and
CPU hotplug APIs. That's all been deleted or moved, so remove the
include directives that have been rendered unnecessary. Sort the
remainder (with linux/ before asm/) to impose some order on where
future additions go.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 42 +++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 3fa84c247415..7a5812624e11 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -7,43 +7,33 @@
  * Copyright (C) 2001 IBM.
  */
 
-#include <linux/stdarg.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/spinlock.h>
-#include <linux/export.h>
-#include <linux/init.h>
 #include <linux/capability.h>
 #include <linux/delay.h>
-#include <linux/cpu.h>
-#include <linux/sched.h>
-#include <linux/smp.h>
-#include <linux/completion.h>
-#include <linux/cpumask.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/memblock.h>
-#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 #include <linux/reboot.h>
+#include <linux/sched.h>
 #include <linux/security.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/stdarg.h>
 #include <linux/syscalls.h>
-#include <linux/of.h>
-#include <linux/of_fdt.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
 
+#include <asm/delay.h>
+#include <asm/firmware.h>
 #include <asm/interrupt.h>
-#include <asm/rtas.h>
-#include <asm/hvcall.h>
 #include <asm/machdep.h>
-#include <asm/firmware.h>
+#include <asm/mmu.h>
 #include <asm/page.h>
-#include <asm/param.h>
-#include <asm/delay.h>
-#include <linux/uaccess.h>
-#include <asm/udbg.h>
-#include <asm/syscalls.h>
-#include <asm/smp.h>
-#include <linux/atomic.h>
+#include <asm/rtas.h>
 #include <asm/time.h>
-#include <asm/mmu.h>
-#include <asm/topology.h>
+#include <asm/udbg.h>
 
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
-- 
2.37.1

