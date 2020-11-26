Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D12C5A3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:09:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chkks712QzDrTy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:09:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fDiEl/qY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQX0phVzDrNh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:15 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGVNAX089499; Thu, 26 Nov 2020 11:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=mEqWrpzUiNswLxJ8bno9Ea0X/pSYRruLi4pmTX1SDfA=;
 b=fDiEl/qYUH+aV97rjVdRSi5ypYV9LBFhNvv94YSuuQ3LlNXjE9jAzD34aaLHKPleOnOs
 L+0Dl6QBkDygf9GTt7fe9ZgnyJ6HxTyJauWXKVNnfyWIkqt+QqqabbkJ9FalcydD6i6n
 I3s+P6UZ8vmFBdXaRaBEZcjOReLpJC4SXK6TN4SufhnarXtS+JAKd/JrZHu4U6dz5j4z
 pHZvEjaUtRbZkGKlkkZ95TsYUsbElh3lPkCWXwf0Idu/VOyG9NX2muwvvafAryiJSWyt
 JAr+vgL38lUAtojEqtG2MJ3GKEfWbf6OjeFxegJbjURtmTLV3A1/u0KC4NR2H1Mi3tLK /g== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352d2n5tvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:55:10 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGqhFP005108;
 Thu, 26 Nov 2020 16:55:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r38tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:55:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQGt5PW6816434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:55:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE48D4C05E;
 Thu, 26 Nov 2020 16:55:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE8EA4C040;
 Thu, 26 Nov 2020 16:55:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:55:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 7/7] powerpc/perf: MMCR0 control for PMU registers under
 PMCC=00
Date: Thu, 26 Nov 2020 11:54:44 -0500
Message-Id: <1606409684-1589-8-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 mlxlogscore=795 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011260097
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

PowerISA v3.1 introduces new control bit (PMCCEXT) for restricting
access to group B PMU registers in problem state when
MMCR0 PMCC=0b00. In problem state and when MMCR0 PMCC=0b00,
setting the Monitor Mode Control Register bit 54 (MMCR0 PMCCEXT),
will restrict read permission on Group B Performance Monitor
Registers (SIER, SIAR, SDAR and MMCR1). When this bit is set to zero,
group B registers will be readable. In other platforms (like power9),
the older behaviour is retained where group B PMU SPRs are readable.

Patch adds support for MMCR0 PMCCEXT bit in power10 by enabling
this bit during boot and during the PMU event enable/disable callback
functions.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/reg.h        | 1 +
 arch/powerpc/kernel/cpu_setup_power.c | 1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c     | 1 +
 arch/powerpc/perf/core-book3s.c       | 4 ++++
 arch/powerpc/perf/isa207-common.c     | 8 ++++++++
 5 files changed, 15 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f877a57..cba9965 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -864,6 +864,7 @@
 #define   MMCR0_BHRBA	0x00200000UL /* BHRB Access allowed in userspace */
 #define   MMCR0_EBE	0x00100000UL /* Event based branch enable */
 #define   MMCR0_PMCC	0x000c0000UL /* PMC control */
+#define   MMCR0_PMCCEXT	ASM_CONST(0x00000200) /* PMCCEXT control */
 #define   MMCR0_PMCC_U6	0x00080000UL /* PMC1-6 are R/W by user (PR) */
 #define   MMCR0_PMC1CE	0x00008000UL /* PMC1 count enable*/
 #define   MMCR0_PMCjCE	ASM_CONST(0x00004000) /* PMCj count enable*/
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index 0c2191e..3cca88e 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -123,6 +123,7 @@ static void init_PMU_ISA31(void)
 {
 	mtspr(SPRN_MMCR3, 0);
 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
+	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
 }
 
 /*
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 1098863..9d07965 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -454,6 +454,7 @@ static void init_pmu_power10(void)
 
 	mtspr(SPRN_MMCR3, 0);
 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
+	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
 }
 
 static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3c8c6ce..35cf93c 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -95,6 +95,7 @@ struct cpu_hw_events {
 #define SPRN_SIER3		0
 #define MMCRA_SAMPLE_ENABLE	0
 #define MMCRA_BHRB_DISABLE     0
+#define MMCR0_PMCCEXT		0
 
 static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
 {
@@ -1270,6 +1271,9 @@ static void power_pmu_disable(struct pmu *pmu)
 		val |= MMCR0_FC;
 		val &= ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | MMCR0_PMAO |
 			 MMCR0_FC56);
+		/* Set mmcr0 PMCCEXT for p10 */
+		if (ppmu->flags & PPMU_ARCH_31)
+			val |= MMCR0_PMCCEXT;
 
 		/*
 		 * The barrier is to make sure the mtspr has been
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 0f4983e..24f0a90 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -558,6 +558,14 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 	if (!(pmc_inuse & 0x60))
 		mmcr->mmcr0 |= MMCR0_FC56;
 
+	/*
+	 * Set mmcr0 (PMCCEXT) for p10 which
+	 * will restrict access to group B registers
+	 * when MMCR0 PMCC=0b00.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mmcr->mmcr0 |= MMCR0_PMCCEXT;
+
 	mmcr->mmcr1 = mmcr1;
 	mmcr->mmcra = mmcra;
 	mmcr->mmcr2 = mmcr2;
-- 
1.8.3.1

