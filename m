Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66930D38F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:58:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsvx5GkxzDxYr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:58:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kEXIxXd7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVss64mQVzDqYD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:55:54 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136ktc4150503; Wed, 3 Feb 2021 01:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=0dTSOTfAJyTekfRVujUq+YCyApRtjl6f66e3jzTTiMM=;
 b=kEXIxXd772oibOWswTbmA0AB/xLHCVAUw0Z0ey611PAY2KN3Ltl50DXZ3ErLbyIHanGV
 hq36F9PX6bOV28vyeRQvdDjxfYD7awudL1rApLU2o1Oborhdq2WJxDuTUmKHtDd+1rc3
 JW/lh+cSMpH/xp6eHeZKrSYMgvT9cKjJh/Pgh2pArg3iJ5XCD6bWFkB2xSeoSX+LTrEV
 wtF7su10b8pm3d/HHee6s38cFyTpPLzbpvudWFY9fEGiHg3NvZgc/JZ/2KnEvvrkyI1O
 6wid2SMMJkBnkX9rrHZcDvjtLyHWB3NAXap9c3e4Ib152k5gMR968e0BX85OBBWfuh1c Jg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpv704ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:55:48 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136r0WW003780;
 Wed, 3 Feb 2021 06:55:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 36cy389vnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:55:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1136tXOB35062216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:55:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F20D64C04E;
 Wed,  3 Feb 2021 06:55:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91BC84C040;
 Wed,  3 Feb 2021 06:55:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.224.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 06:55:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 1/3] powerpc/perf: Include PMCs as part of per-cpu
 cpuhw_events struct
Date: Wed,  3 Feb 2021 01:55:35 -0500
Message-Id: <1612335337-1888-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To support capturing of PMC's as part of extended registers, the
value of SPR's PMC1 to PMC6 has to be saved in the starting of PMI
interrupt handler. This is needed since we are resetting the
overflown PMC before creating sample and hence directly reading
SPRN_PMCx in 'perf_reg_value' will be capturing the modified value.

To solve this, add a per-cpu array as part of structure cpu_hw_events
and use this array to capture PMC values in the perf interrupt handler.
Patch also re-factor's the interrupt handler code to use this per-cpu
array instead of current local array.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 28206b1fe172..436af496e3aa 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -54,6 +54,9 @@ struct cpu_hw_events {
 	struct	perf_branch_stack	bhrb_stack;
 	struct	perf_branch_entry	bhrb_entries[BHRB_MAX_ENTRIES];
 	u64				ic_init;
+
+	/* Store the PMC values */
+	unsigned long pmcs[MAX_HWEVENTS];
 };
 
 static DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
@@ -2277,7 +2280,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	int i, j;
 	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
 	struct perf_event *event;
-	unsigned long val[8];
 	int found, active;
 	int nmi;
 
@@ -2301,12 +2303,12 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 
 	/* Read all the PMCs since we'll need them a bunch of times */
 	for (i = 0; i < ppmu->n_counter; ++i)
-		val[i] = read_pmc(i + 1);
+		cpuhw->pmcs[i] = read_pmc(i + 1);
 
 	/* Try to find what caused the IRQ */
 	found = 0;
 	for (i = 0; i < ppmu->n_counter; ++i) {
-		if (!pmc_overflow(val[i]))
+		if (!pmc_overflow(cpuhw->pmcs[i]))
 			continue;
 		if (is_limited_pmc(i + 1))
 			continue; /* these won't generate IRQs */
@@ -2321,7 +2323,7 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 			event = cpuhw->event[j];
 			if (event->hw.idx == (i + 1)) {
 				active = 1;
-				record_and_restart(event, val[i], regs);
+				record_and_restart(event, cpuhw->pmcs[i], regs);
 				break;
 			}
 		}
@@ -2335,11 +2337,11 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 			event = cpuhw->event[i];
 			if (!event->hw.idx || is_limited_pmc(event->hw.idx))
 				continue;
-			if (pmc_overflow_power7(val[event->hw.idx - 1])) {
+			if (pmc_overflow_power7(cpuhw->pmcs[event->hw.idx - 1])) {
 				/* event has overflowed in a buggy way*/
 				found = 1;
 				record_and_restart(event,
-						   val[event->hw.idx - 1],
+						   cpuhw->pmcs[event->hw.idx - 1],
 						   regs);
 			}
 		}
@@ -2356,6 +2358,9 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	 */
 	write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
 
+	/* Clear the cpuhw->pmcs */
+	memset(&cpuhw->pmcs, 0, sizeof(cpuhw->pmcs));
+
 	if (nmi)
 		nmi_exit();
 	else
-- 
1.8.3.1

