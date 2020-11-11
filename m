Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A67392AE7A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 05:52:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWC5K4DK1zDqXg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:52:21 +1100 (AEDT)
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
 header.s=pp1 header.b=IMTXB0pk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWC1N3YB0zDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 15:48:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AB4X7O3025851; Tue, 10 Nov 2020 23:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=C3uYGbXkXUxOr/2vYWxByJbgHLQJvI1u+7vLt5wSxw8=;
 b=IMTXB0pknqy2k6fwmQIXwX+Bc9ekPbYutiUtldxOvC2mrNf1v7ZAIxSOZzT28MShyD3V
 vyI+YpXJtkfAYDl8jpuTBpd3DxHvM5FMZ6m68j4cjcEnYcGVc9//YRkmXH9NlM7cUxBI
 VnLSP1CRKea6Ts/QHRumfsWrUA5NYn4lKaaDtfziiAnt2EV/Yrx+W10q8o5jjtEiJASg
 SkM8sW82CTYNaX3q2Ypwa5+eOVM6oUM01Km8DY5CUAiO9bVsYGNq6at7ADRLtZPXQSXr
 QOcEePA2B4gDPXIXJ/HWPicnn4ubCsLisDHNC/BrfZIHnOdICPTqidA/sqPqJMnLQ6DG AQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r8a80ya1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 23:33:23 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4VUs2017472;
 Wed, 11 Nov 2020 04:33:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 34njuh1y64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 04:33:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AB4XJGZ53149972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:33:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5796E4C044;
 Wed, 11 Nov 2020 04:33:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB84E4C04A;
 Wed, 11 Nov 2020 04:33:17 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.242.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Nov 2020 04:33:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/4] powerpc/perf: MMCR0 control for PMU registers under
 PMCC=00
Date: Tue, 10 Nov 2020 23:33:09 -0500
Message-Id: <1605069189-2740-5-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_01:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=738 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110022
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerISA v3.1 introduces new control bit (PMCCEXT) for enabling
secure access to group B PMU registers in problem state when
MMCR0 PMCC=0b00. This patch adds support for MMCR0 PMCCEXT bit
in power10 by enabling this bit during boot and during the PMU
event enable/disable operations when MMCR0 PMCC=0b00

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/reg.h        |  1 +
 arch/powerpc/kernel/cpu_setup_power.S |  2 ++
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  1 +
 arch/powerpc/perf/core-book3s.c       | 16 ++++++++++++++++
 4 files changed, 20 insertions(+)

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
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index 704e8b9..8fc8b72 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -249,4 +249,6 @@ __init_PMU_ISA31:
 	mtspr	SPRN_MMCR3,r5
 	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
 	mtspr	SPRN_MMCRA,r5
+	LOAD_REG_IMMEDIATE(r5, MMCR0_PMCCEXT)
+	mtspr	SPRN_MMCR0,r5
 	blr
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
index 08643cb..f328bc0 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -95,6 +95,7 @@ struct cpu_hw_events {
 #define SPRN_SIER3		0
 #define MMCRA_SAMPLE_ENABLE	0
 #define MMCRA_BHRB_DISABLE     0
+#define MMCR0_PMCCEXT		0
 
 static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
 {
@@ -1242,6 +1243,9 @@ static void power_pmu_disable(struct pmu *pmu)
 		val |= MMCR0_FC;
 		val &= ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | MMCR0_PMAO |
 			 MMCR0_FC56);
+		/* Set mmcr0 PMCCEXT for p10 */
+		if (ppmu->flags & PPMU_ARCH_31)
+			val |= MMCR0_PMCCEXT;
 
 		/*
 		 * The barrier is to make sure the mtspr has been
@@ -1449,6 +1453,18 @@ static void power_pmu_enable(struct pmu *pmu)
 
 	mmcr0 = ebb_switch_in(ebb, cpuhw);
 
+	/*
+	 * Set mmcr0 (PMCCEXT) for p10
+	 * if mmcr0 PMCC=0b00 to allow secure
+	 * mode of access to group B registers.
+	 */
+	if (ppmu->flags & PPMU_ARCH_31) {
+		if (!(mmcr0 & MMCR0_PMCC)) {
+			cpuhw->mmcr.mmcr0 |= MMCR0_PMCCEXT;
+			mmcr0 |= MMCR0_PMCCEXT;
+		}
+	}
+
 	mb();
 	if (cpuhw->bhrb_users)
 		ppmu->config_bhrb(cpuhw->bhrb_filter);
-- 
1.8.3.1

