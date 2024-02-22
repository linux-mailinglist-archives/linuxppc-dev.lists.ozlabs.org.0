Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591F85FB6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 15:38:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dryfcnzx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgbNj0LB2z3vZs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 01:38:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dryfcnzx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgbMz1YKFz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 01:37:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41MEW0jB016154;
	Thu, 22 Feb 2024 14:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fCcHbyEAzqbnRluYnPu4Vp7xopD1bdKUBz6WsH9/P5c=;
 b=DryfcnzxQqO6fST2vJXWffH+dLtdVE3DyiNxVZ+lSKfheAfA66Qh3MGhWhxnEJ6liG5M
 Kal8PO6Vy3TTFwEL41OudtB3eg/qv0+k5ebf+mLyF+xZhzlM28W2Q5aQ2TBHrjYswoit
 fMiDbZHiuxVRvhM0C8db3r4w6zgumzJrZYRpe1cuQ7wX4+eXs36W1EtIW7oz90s+ZEi7
 hIsi0/ZBR020fXFDfVNat37YzeW9INe2fFJOPKMpjl4DV9wULelvNhWra0/joGHaXE3l
 8BDSBE6+iGDjR6X436EWjqWi+VM3Jy7bDuQPK7Ca+vKQbj2aZlu0GoHfkQUgfQdZrS1h XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we84588yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:37:42 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41MEW8Il016564;
	Thu, 22 Feb 2024 14:37:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we84588x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:37:42 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41MBwRNr017261;
	Thu, 22 Feb 2024 14:33:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb8mmpkht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41MEXghf64946660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 14:33:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 361BA2004E;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 237092004B;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id DC7BDE0365; Thu, 22 Feb 2024 15:33:41 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 RESEND 4/5] s390/irq,nmi: include <asm/vtime.h> header directly
Date: Thu, 22 Feb 2024 15:33:40 +0100
Message-Id: <98c78ea88bed855f06bd59ee44ab1ce6e1e7d52e.1708612016.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1708612016.git.agordeev@linux.ibm.com>
References: <cover.1708612016.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8qsYZ-Ab7jjxx4bNs03beryHUGUd7ZpR
X-Proofpoint-ORIG-GUID: kPMs4W0l34uBOy6f3H2upLfVePIcG6JX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_11,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=677 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402220116
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

update_timer_sys() and update_timer_mcck() are inlines used for
CPU time accounting from the interrupt and machine-check handlers.
These routines are specific to s390 architecture, but included
via <linux/vtime.h> header implicitly. Avoid the extra loop and
include <asm/vtime.h> header directly.

Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/kernel/irq.c | 1 +
 arch/s390/kernel/nmi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/s390/kernel/irq.c b/arch/s390/kernel/irq.c
index 6f71b0ce1068..259496fe0ef9 100644
--- a/arch/s390/kernel/irq.c
+++ b/arch/s390/kernel/irq.c
@@ -29,6 +29,7 @@
 #include <asm/hw_irq.h>
 #include <asm/stacktrace.h>
 #include <asm/softirq_stack.h>
+#include <asm/vtime.h>
 #include "entry.h"
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct irq_stat, irq_stat);
diff --git a/arch/s390/kernel/nmi.c b/arch/s390/kernel/nmi.c
index 9ad44c26d1a2..4422a27faace 100644
--- a/arch/s390/kernel/nmi.c
+++ b/arch/s390/kernel/nmi.c
@@ -32,6 +32,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/pai.h>
 #include <asm/vx-insn.h>
+#include <asm/vtime.h>
 #include <asm/fpu/api.h>
 
 struct mcck_struct {
-- 
2.40.1

