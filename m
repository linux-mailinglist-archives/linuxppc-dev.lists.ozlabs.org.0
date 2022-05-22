Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABB530384
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 16:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5jPn306nz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 00:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CSswG3We;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CSswG3We; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5jP204V6z3035
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 00:23:17 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24M82bv5009819;
 Sun, 22 May 2022 14:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IZCGA4Ik4yr9WiSW8tEGij9/7rftyWLYotIU9wyi60s=;
 b=CSswG3WerEq0f9AItuk3dCtRmtMZGZKIMLm4+l9fJ+pLn236bSNvbtPHMwyN0Rs90Gnv
 mPh/hVTbWwDsVUxubZYgrdX+/zw8BxEajLtPqGcX/8eRtzCEt8/THnbFfHB3Xr0odDoQ
 qB16eHpc3YbXSDoxzcykSXejn9fFVEmf5hE7MucV6L/CxTGsAeDmq8fHegCamUmqiuBf
 dSFwAC/ZF4E4o1Fgbo5xaRVed1kHeFnc4n5vZwXmRvwNSnZ8ZcJM+HFmVzU5RtF/TmT4
 rZQyUtBEcBk2TliCaJfaEufSUZrS1UIWzfA7hqW/dV86YFz4kffUOpIbRnX6X6P3H8lK 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g7a4psdq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 May 2022 14:23:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24MEFErj014413;
 Sun, 22 May 2022 14:23:08 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g7a4psdpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 May 2022 14:23:07 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24MEDeWE032355;
 Sun, 22 May 2022 14:23:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3g6qq91r2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 May 2022 14:23:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24MEN3IF49348890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 22 May 2022 14:23:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6029A405B;
 Sun, 22 May 2022 14:23:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E8E7A4054;
 Sun, 22 May 2022 14:23:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.2.227])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 22 May 2022 14:23:00 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Optimize clearing the pending PMI and remove
 WARN_ON for PMI check in power_pmu_disable
Date: Sun, 22 May 2022 19:52:56 +0530
Message-Id: <20220522142256.24699-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3FDW9xHknhtNz5J8oc_V2rk74ICqvZHK
X-Proofpoint-ORIG-GUID: f_MaU63jtb5nvsBgON0TNwcXnG2ihmh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-22_04,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205220088
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
pending PMI before resetting an overflown PMC") added a new
function "pmi_irq_pending" in hw_irq.h. This function is to check
if there is a PMI marked as pending in Paca (PACA_IRQ_PMI).This is
used in power_pmu_disable in a WARN_ON. The intention here is to
provide a warning if there is PMI pending, but no counter is found
overflown.

During some of the perf runs, below warning is hit:

WARNING: CPU: 36 PID: 0 at arch/powerpc/perf/core-book3s.c:1332 power_pmu_disable+0x25c/0x2c0
 Modules linked in:
 -----

 NIP [c000000000141c3c] power_pmu_disable+0x25c/0x2c0
 LR [c000000000141c8c] power_pmu_disable+0x2ac/0x2c0
 Call Trace:
 [c000000baffcfb90] [c000000000141c8c] power_pmu_disable+0x2ac/0x2c0 (unreliable)
 [c000000baffcfc10] [c0000000003e2f8c] perf_pmu_disable+0x4c/0x60
 [c000000baffcfc30] [c0000000003e3344] group_sched_out.part.124+0x44/0x100
 [c000000baffcfc80] [c0000000003e353c] __perf_event_disable+0x13c/0x240
 [c000000baffcfcd0] [c0000000003dd334] event_function+0xc4/0x140
 [c000000baffcfd20] [c0000000003d855c] remote_function+0x7c/0xa0
 [c000000baffcfd50] [c00000000026c394] flush_smp_call_function_queue+0xd4/0x300
 [c000000baffcfde0] [c000000000065b24] smp_ipi_demux_relaxed+0xa4/0x100
 [c000000baffcfe20] [c0000000000cb2b0] xive_muxed_ipi_action+0x20/0x40
 [c000000baffcfe40] [c000000000207c3c] __handle_irq_event_percpu+0x8c/0x250
 [c000000baffcfee0] [c000000000207e2c] handle_irq_event_percpu+0x2c/0xa0
 [c000000baffcff10] [c000000000210a04] handle_percpu_irq+0x84/0xc0
 [c000000baffcff40] [c000000000205f14] generic_handle_irq+0x54/0x80
 [c000000baffcff60] [c000000000015740] __do_irq+0x90/0x1d0
 [c000000baffcff90] [c000000000016990] __do_IRQ+0xc0/0x140
 [c0000009732f3940] [c000000bafceaca8] 0xc000000bafceaca8
 [c0000009732f39d0] [c000000000016b78] do_IRQ+0x168/0x1c0
 [c0000009732f3a00] [c0000000000090c8] hardware_interrupt_common_virt+0x218/0x220

This means that there is no PMC overflown among the active events
in the PMU, but there is a PMU pending in Paca. The function
"any_pmc_overflown" checks the PMCs on active events in
cpuhw->n_events. Code snippet:

<<>>
if (any_pmc_overflown(cpuhw))
 	clear_pmi_irq_pending();
 else
 	WARN_ON(pmi_irq_pending());
<<>>

Here the PMC overflown is not from active event. Example: When we do
perf record, default cycles and instructions will be running on PMC6
and PMC5 respectively. It could happen that overflowed event is currently
not active and pending PMI is for the inactive event. Debug logs from
trace_printk:

<<>>
any_pmc_overflown: idx is 5: pmc value is 0xd9a
power_pmu_disable: PMC1: 0x0, PMC2: 0x0, PMC3: 0x0, PMC4: 0x0, PMC5: 0xd9a, PMC6: 0x80002011
<<>>

Here active PMC (from idx) is PMC5 , but overflown PMC is PMC6(0x80002011).
When we handle PMI interrupt for such cases, if the PMC overflown is
from inactive event, it will be ignored. Reference commit:
commit bc09c219b2e6 ("powerpc/perf: Fix finding overflowed PMC in interrupt")

Patch addresses two changes:
1) Fix 1 : Removal of warning ( WARN_ON(pmi_irq_pending()); )
   We were printing warning if no PMC is found overflown among active PMU
   events, but PMI pending in PACA. But this could happen in cases where
   PMC overflown is not in active PMC. An inactive event could have caused
   the overflow. Hence the warning is not needed. To know pending PMI is
   from an inactive event, we need to loop through all PMC's which will
   cause more SPR reads via mfspr and increase in context switch. Also in
   existing function: perf_event_interrupt, already we ignore PMI's
   overflown when it is from an inactive PMC.

2) Fix 2: optimization in clearing pending PMI.
   Currently we check for any active PMC overflown before clearing PMI
   pending in Paca. This is causing additional SPR read also. From point 1,
   we know that if PMI pending in Paca from inactive cases, that is going
   to be ignored during replay. Hence if there is pending PMI in Paca, just
   clear it irrespective of PMC overflown or not.

In summary, remove the any_pmc_overflown check entirely in
power_pmu_disable. ie If there is a pending PMI in Paca, clear it, since
we are in pmu_disable. There could be cases where PMI is pending because
of inactive PMC ( which later when replayed also will get ignored ), so
WARN_ON could give false warning. Hence removing it.

Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 35 ++++++++++++++-------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b5b42cf0a703..3adc08254875 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1349,27 +1349,22 @@ static void power_pmu_disable(struct pmu *pmu)
 		 * a PMI happens during interrupt replay and perf counter
 		 * values are cleared by PMU callbacks before replay.
 		 *
-		 * If any PMC corresponding to the active PMU events are
-		 * overflown, disable the interrupt by clearing the paca
-		 * bit for PMI since we are disabling the PMU now.
-		 * Otherwise provide a warning if there is PMI pending, but
-		 * no counter is found overflown.
+		 * Disable the interrupt by clearing the paca bit for PMI
+		 * since we are disabling the PMU now. Otherwise provide a
+		 * warning if there is PMI pending, but no counter is found
+		 * overflown.
+		 *
+		 * Since power_pmu_disable runs under local_irq_save, it
+		 * could happen that code hits a PMC overflow without PMI
+		 * pending in paca. Hence only clear PMI pending if it was
+		 * set.
+		 *
+		 * If a PMI is pending, then MSR[EE] must be disabled (because
+		 * the masked PMI handler disabling EE). So it is safe to
+		 * call clear_pmi_irq_pending().
 		 */
-		if (any_pmc_overflown(cpuhw)) {
-			/*
-			 * Since power_pmu_disable runs under local_irq_save, it
-			 * could happen that code hits a PMC overflow without PMI
-			 * pending in paca. Hence only clear PMI pending if it was
-			 * set.
-			 *
-			 * If a PMI is pending, then MSR[EE] must be disabled (because
-			 * the masked PMI handler disabling EE). So it is safe to
-			 * call clear_pmi_irq_pending().
-			 */
-			if (pmi_irq_pending())
-				clear_pmi_irq_pending();
-		} else
-			WARN_ON(pmi_irq_pending());
+		if (pmi_irq_pending())
+			clear_pmi_irq_pending();
 
 		val = mmcra = cpuhw->mmcr.mmcra;
 
-- 
2.35.1

