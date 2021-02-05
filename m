Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F9310785
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 10:16:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX8tr3GsMzDvW7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 20:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fri6j624; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX8rs3PPnzDsXK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 20:15:09 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11595KoT182583; Fri, 5 Feb 2021 04:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=3kecOj4oGHaTmMZieqCqeDWJieJFxluHMAtSJotnpT8=;
 b=Fri6j6244qHfw3tgXQPawdKlbN7Xz43TgUkJC5gCdxYC9KAnI2K6BE/H6p+nB1F2RUhn
 DLZGEv/039is5vPqzxLgBrbEPvX+sGDv6RELZCZB17Qiu+KKFL2QndtrxS/x85OOjZsK
 Z+pezUltSHXe1FDOgnQDkSx9j7ZHbqG5Sey27C/FdOTzCxTL+4ZiOwThmauGXIR0V0T7
 /9JBSyq+Gj5pqqFFPBjZnwXQd5dl86SgJaXpd3QNNeC+DgEC+tDFI0h3LzuMTMDP+vXh
 Dx21qeLZ7DEnHEtXJc2BkhS+QVpD5Sb20GH7BwmQiCrgIkWptRsY2kUD0DfJHKlvB1q5 CQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h1rbtfaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 04:15:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1159EDH6017841;
 Fri, 5 Feb 2021 09:14:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 36cy38nr5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:14:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1159Eunh12059092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 09:14:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56C184C04E;
 Fri,  5 Feb 2021 09:14:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B9894C04A;
 Fri,  5 Feb 2021 09:14:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.242.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 09:14:54 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Record counter overflow always if SAMPLE_IP
 is unset
Date: Fri,  5 Feb 2021 04:14:52 -0500
Message-Id: <1612516492-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_04:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050057
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While sampling for marked events, currently we record the sample only
if the SIAR valid bit of Sampled Instruction Event Register (SIER) is
set. SIAR_VALID bit is used for fetching the instruction address from
Sampled Instruction Address Register(SIAR). But there are some usecases,
where the user is interested only in the PMU stats at each counter
overflow and the exact IP of the overflow event is not required.
Dropping SIAR invalid samples will fail to record some of the counter
overflows in such cases.

Example of such usecase is dumping the PMU stats (event counts)
after some regular amount of instructions/events from the userspace
(ex: via ptrace). Here counter overflow is indicated to userspace via
signal handler, and captured by monitoring and enabling I/O
signaling on the event file descriptor. In these cases, we expect to
get sample/overflow indication after each specified sample_period.

Perf event attribute will not have PERF_SAMPLE_IP set in the
sample_type if exact IP of the overflow event is not requested. So
while profiling if SAMPLE_IP is not set, just record the counter overflow
irrespective of SIAR_VALID check.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
-- Changed the approach to include PERF_SAMPLE_IP
   condition while checking siar_valid as Suggested by
   Michael Ellerman.

 arch/powerpc/perf/core-book3s.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 28206b1fe172..0ddbe33798ce 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2149,7 +2149,17 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			left += period;
 			if (left <= 0)
 				left = period;
-			record = siar_valid(regs);
+
+			/*
+			 * If address is not requested in the sample
+			 * via PERF_SAMPLE_IP, just record that sample
+			 * irrespective of SIAR valid check.
+			 */
+			if (event->attr.sample_type & PERF_SAMPLE_IP)
+				record = siar_valid(regs);
+			else
+				record = 1;
+
 			event->hw.last_period = event->hw.sample_period;
 		}
 		if (left < 0x80000000LL)
@@ -2167,9 +2177,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
 	 * these cases.
 	 */
-	if (event->attr.exclude_kernel && record)
-		if (is_kernel_addr(mfspr(SPRN_SIAR)))
-			record = 0;
+	if (event->attr.exclude_kernel &&
+			(event->attr.sample_type & PERF_SAMPLE_IP) &&
+			is_kernel_addr(mfspr(SPRN_SIAR)))
+		record = 0;
 
 	/*
 	 * Finally record data if requested.
-- 
1.8.3.1

