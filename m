Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE489FB30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:12:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aYAvunXR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF5sd1Yf4z3vfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aYAvunXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF5qJ10t1z3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:10:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43AEuYeF024033;
	Wed, 10 Apr 2024 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iVwvZSHTk0sajjmtt3NjqRVWU0hXUazHKS+Ps5brC9w=;
 b=aYAvunXRrqmSB8vYblJX/Z6sE60et8FwTcMCcWU6p5cPyrFlpv4RLnI7pF5G79RrlD8G
 5yzsNiVS53rP78740ux7Si0DfMkamg42z/J3M6eakyH9ywoGwK/q8lSCtfFcn8NEAlK3
 KJnRfZF+uFxo90wlo7K4tNYHQajbMEVCrTmutQz5gnUZYzBV///luZR07xMRyzJkatR/
 wzACSQQ6upBxI4JQD6sT2Qd7Fr+sQaiShhthdyftJiovhacXKv0IY9aa40BTJyhozBkg
 E/Q66RYMflxrssHk3nkFfTxbhMI+gAMKDQ/VMJcQh/ebbWWWX5up4qTXCDX55VA8pbOF GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdrh70qkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:56 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43AF9tEP012896;
	Wed, 10 Apr 2024 15:09:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdrh70qk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:55 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43AD2AlN013544;
	Wed, 10 Apr 2024 15:09:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqtnpn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43AF9nBK39715114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 15:09:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B9962004E;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 199522004B;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id D31C7E0A03; Wed, 10 Apr 2024 17:09:48 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 RESEND 4/5] s390/irq,nmi: include <asm/vtime.h> header directly
Date: Wed, 10 Apr 2024 17:09:47 +0200
Message-Id: <3fb696637c0eb7e9d6ffd6cbf9e647d7c5986b3d.1712760275.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1712760275.git.agordeev@linux.ibm.com>
References: <cover.1712760275.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6akCn5HRYeQ6TNtTN8-3dk_RAuUBQ7np
X-Proofpoint-GUID: prDHpVM-oHQMna2nCY1cEOrp4KLyfFFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=561 suspectscore=0 phishscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100109
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>
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
index c77382a67325..230d010bac9b 100644
--- a/arch/s390/kernel/nmi.c
+++ b/arch/s390/kernel/nmi.c
@@ -31,6 +31,7 @@
 #include <asm/crw.h>
 #include <asm/asm-offsets.h>
 #include <asm/pai.h>
+#include <asm/vtime.h>
 
 struct mcck_struct {
 	unsigned int kill_task : 1;
-- 
2.40.1

