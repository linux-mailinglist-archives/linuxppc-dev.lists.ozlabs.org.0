Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C12C9C8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 10:31:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClcLM5GyFzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 20:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HvG0Pmo+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClcGS2y4zzDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 20:28:16 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B192QsP174598; Tue, 1 Dec 2020 04:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=h+H2j61XnIj4yux4GiKfwYu/VvYViXaqljVXUIzH/6o=;
 b=HvG0Pmo+qCgsGgCFNB/LXUH9EQhNCljmcCMiNr1ZgxDublBpHhddg8Zegided3jz2sQc
 54I0xJ9xCcyvwELssqp7F8gR6VErzAkUWN3uStVG2Q97kIaD3ZqlUdNqJmd4TblEDSHC
 e8ce4WXmMRdEF4raoYAe/vHjNvrx192sr074MZiEtltAxaIMTWy2gjAPqNChptyPHIOQ
 /N6iXzotSha0QxyjsYcVpWJlmjM8Iy0y52379UTR4Uf3eIoI27976YmtDZfxSdQ3VcbF
 P+nT1h+Tz5IMsbckHbzQKlO/KXzYxDsa4SL0ZCL1O1eU0f+CoED2lqiucVlx3mFrzeFX uA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355a79nxyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 04:28:07 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B19DniC005319;
 Tue, 1 Dec 2020 09:28:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 353e682y12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 09:28:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B19S3dQ56033608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 09:28:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D3F44C04A;
 Tue,  1 Dec 2020 09:28:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 349D74C052;
 Tue,  1 Dec 2020 09:28:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.237.135])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 09:28:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Invoke per-CPU variable access with disabled
 interrupts
Date: Tue,  1 Dec 2020 04:28:00 -0500
Message-Id: <1606814880-1720-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_01:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=1
 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010057
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
Cc: bigeasy@linutronix.de, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The power_pmu_event_init() callback access per-cpu variable
(cpu_hw_events) to check for event constraints and Branch Stack
(BHRB). Current usage is to disable preemption when accessing the
per-cpu variable, but this does not prevent timer callback from
interrupting event_init. Fix this by using 'local_irq_save/restore'
to make sure the code path is invoked with disabled interrupts.

This change is tested in mambo simulator to ensure that, if a timer
interrupt comes in during the per-cpu access in event_init, it will be
soft masked and replayed later. For testing purpose, introduced a
udelay() in power_pmu_event_init() to make sure a timer interrupt arrives
while in per-cpu variable access code between local_irq_save/resore.
As expected the timer interrupt was replayed later during local_irq_restore
called from power_pmu_event_init. This was confirmed by adding
breakpoint in mambo and checking the backtrace when timer_interrupt
was hit.

Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3c8c6ce..e38648f0 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1909,7 +1909,7 @@ static bool is_event_blacklisted(u64 ev)
 static int power_pmu_event_init(struct perf_event *event)
 {
 	u64 ev;
-	unsigned long flags;
+	unsigned long flags, irq_flags;
 	struct perf_event *ctrs[MAX_HWEVENTS];
 	u64 events[MAX_HWEVENTS];
 	unsigned int cflags[MAX_HWEVENTS];
@@ -2017,7 +2017,9 @@ static int power_pmu_event_init(struct perf_event *event)
 	if (check_excludes(ctrs, cflags, n, 1))
 		return -EINVAL;
 
-	cpuhw = &get_cpu_var(cpu_hw_events);
+	local_irq_save(irq_flags);
+	cpuhw = this_cpu_ptr(&cpu_hw_events);
+
 	err = power_check_constraints(cpuhw, events, cflags, n + 1);
 
 	if (has_branch_stack(event)) {
@@ -2028,13 +2030,13 @@ static int power_pmu_event_init(struct perf_event *event)
 					event->attr.branch_sample_type);
 
 		if (bhrb_filter == -1) {
-			put_cpu_var(cpu_hw_events);
+			local_irq_restore(irq_flags);
 			return -EOPNOTSUPP;
 		}
 		cpuhw->bhrb_filter = bhrb_filter;
 	}
 
-	put_cpu_var(cpu_hw_events);
+	local_irq_restore(irq_flags);
 	if (err)
 		return -EINVAL;
 
-- 
1.8.3.1

