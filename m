Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1548F598
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 08:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbV2w15z4z3bVG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 18:21:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EC2A0Ehq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EC2A0Ehq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbV251T6Pz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 18:20:44 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20F6veXV013725; 
 Sat, 15 Jan 2022 07:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=4QmzL4dgLYYazXNOEpqGrrS2Eb3iDChdt1kzm03MdAc=;
 b=EC2A0Ehqzg+Nwhy8KgfL6J/Za0rEMwGm3tHyNkcuJXl/8A9GxS0cVs6xT3h7vr/6A9SP
 bKymvivfs9AqeIodKUL1M67lmUOct7seVkmm4bWSctvZ0LJlmI44QuHyBJE0hUY+1iLw
 HTi4U2otjRzjF/6QN0aAUhBpld/KNjrzTL3Fk1etBPfJLlI98gkZ3mHhCWZO+gW1ME7Z
 xTn5cr7VdE5e6YOhKUi5l6PfAnHN+Yww+/gb+UCDfXfCP+lqQoebBiQtYMFlP4WpX85B
 PYcibH+Vb8UGcMYI3Eo01F0DNc9I+5qxqUJ+7kTNEIIkH2Sk1PtF3M3/e+56c6TkRSh+ 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dksf78a0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jan 2022 07:20:35 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20F7HQ4A008009;
 Sat, 15 Jan 2022 07:20:35 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dksf78a0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jan 2022 07:20:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20F7HQV8032161;
 Sat, 15 Jan 2022 07:20:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw8gsn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jan 2022 07:20:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20F7KTmQ45744602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Jan 2022 07:20:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84C2EAE055;
 Sat, 15 Jan 2022 07:20:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3670EAE045;
 Sat, 15 Jan 2022 07:20:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.114.248])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 15 Jan 2022 07:20:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix power_pmu_disable to call
 clear_pmi_irq_pending only if PMI is pending
Date: Sat, 15 Jan 2022 12:50:20 +0530
Message-Id: <20220115072020.93524-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -35BOBRUwRmee8fFXwiXoY49Pzgp68xt
X-Proofpoint-GUID: uEH8uXzFufcPZOpXGALNbUNyOJHzODh7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-15_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201150041
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
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running selftest with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG enabled in kernel
triggered below warning:

[  172.851380] ------------[ cut here ]------------
[  172.851391] WARNING: CPU: 8 PID: 2901 at arch/powerpc/include/asm/hw_irq.h:246 power_pmu_disable+0x270/0x280
[  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc xfs libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
[  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted 5.16.0-rc5-03218-g798527287598 #2
[  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: c00000000013b180
[  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  (5.16.0-rc5-03218-g798527287598)
[  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48004884  XER: 20040000
[  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1
[  172.851482] GPR00: c00000000013d5a4 c000000017687b00 c000000002a10600 0000000000000004
[  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 0000000000000000 00000008b7ed0000
[  172.851482] GPR08: 00000000446194f6 0000000000008000 c00000000013b118 c000000000d58e68
[  172.851482] GPR12: c00000000013d390 c00000001ec54a80 0000000000000000 0000000000000000
[  172.851482] GPR16: 0000000000000000 0000000000000000 c000000015d5c708 c0000000025396d0
[  172.851482] GPR20: 0000000000000000 0000000000000000 c00000000a3bbf40 0000000000000003
[  172.851482] GPR24: 0000000000000000 c0000008ba097400 c0000000161e0d00 c00000000a3bb600
[  172.851482] GPR28: c000000015d5c700 0000000000000001 0000000082384090 c0000008ba0020d8
[  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
[  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
[  172.851565] Call Trace:
[  172.851568] [c000000017687b00] [c00000000013d5a4] power_pmu_disable+0x214/0x280 (unreliable)
[  172.851579] [c000000017687b40] [c0000000003403ac] perf_pmu_disable+0x4c/0x60
[  172.851588] [c000000017687b60] [c0000000003445e4] __perf_event_task_sched_out+0x1d4/0x660
[  172.851596] [c000000017687c50] [c000000000d1175c] __schedule+0xbcc/0x12a0
[  172.851602] [c000000017687d60] [c000000000d11ea8] schedule+0x78/0x140
[  172.851608] [c000000017687d90] [c0000000001a8080] sys_sched_yield+0x20/0x40
[  172.851615] [c000000017687db0] [c0000000000334dc] system_call_exception+0x18c/0x380
[  172.851622] [c000000017687e10] [c00000000000c74c] system_call_common+0xec/0x268

The warning indicates that MSR_EE being set(interrupt enabled) when
there was an overflown PMC detected. This could happen in
power_pmu_disable since it runs under interrupt soft disable
condition ( local_irq_save ) and not with interrupts hard disabled.
commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
pending PMI before resetting an overflown PMC") intended to clear
PMI pending bit in Paca when disabling the PMU. It could happen
that PMC gets overflown while code is in power_pmu_disable
callback function. Hence add a check to see if PMI pending bit
is set in Paca before clearing it via clear_pmi_pending.

Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
---
Note: Address the warning reported here:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/238190.html
Patch is on top of powerpc/merge

 arch/powerpc/perf/core-book3s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index a684901b6965..dfb0ea0f0df3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1327,9 +1327,10 @@ static void power_pmu_disable(struct pmu *pmu)
 		 * Otherwise provide a warning if there is PMI pending, but
 		 * no counter is found overflown.
 		 */
-		if (any_pmc_overflown(cpuhw))
-			clear_pmi_irq_pending();
-		else
+		if (any_pmc_overflown(cpuhw)) {
+			if (pmi_irq_pending())
+				clear_pmi_irq_pending();
+		} else
 			WARN_ON(pmi_irq_pending());
 
 		val = mmcra = cpuhw->mmcr.mmcra;
-- 
2.33.0

