Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1AF223F2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 17:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7ZPM0gDbzDrQQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 01:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7YfK5z4RzDrNj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:39:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEWLDQ137409; Fri, 17 Jul 2020 10:38:59 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32aut5595t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:38:59 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEUCN6024265;
 Fri, 17 Jul 2020 14:38:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 327527y0c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:38:57 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HEcs5N50856128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:38:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB4D74C050;
 Fri, 17 Jul 2020 14:38:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39AB24C046;
 Fri, 17 Jul 2020 14:38:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:38:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 07/15] powerpc/perf: Add power10_feat to dt_cpu_ftrs
Date: Fri, 17 Jul 2020 10:38:19 -0400
Message-Id: <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=1 impostorscore=0 mlxlogscore=857 lowpriorityscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170103
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Add power10 feature function to dt_cpu_ftrs.c along
with a power10 specific init() to initialize pmu sprs,
sets the oprofile_cpu_type and cpu_features. This will
enable performance monitoring unit(PMU) for Power10
in CPU features with "performance-monitor-power10".

For PowerISA v3.1, BHRB disable is controlled via Monitor Mode
Control Register A (MMCRA) bit, namely "BHRB Recording Disable
(BHRBRD)". This patch initializes MMCRA BHRBRD to disable BHRB
feature at boot for power10.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/reg.h        |  3 +++
 arch/powerpc/kernel/cpu_setup_power.S |  8 ++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 21a1b2d..900ada1 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1068,6 +1068,9 @@
 #define MMCR0_PMC2_LOADMISSTIME	0x5
 #endif
 
+/* BHRB disable bit for PowerISA v3.10 */
+#define MMCRA_BHRB_DISABLE	0x0000002000000000
+
 /*
  * SPRG usage:
  *
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index efdcfa7..b8e0d1e 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -94,6 +94,7 @@ _GLOBAL(__restore_cpu_power8)
 _GLOBAL(__setup_cpu_power10)
 	mflr	r11
 	bl	__init_FSCR_power10
+	bl	__init_PMU_ISA31
 	b	1f
 
 _GLOBAL(__setup_cpu_power9)
@@ -233,3 +234,10 @@ __init_PMU_ISA207:
 	li	r5,0
 	mtspr	SPRN_MMCRS,r5
 	blr
+
+__init_PMU_ISA31:
+	li	r5,0
+	mtspr	SPRN_MMCR3,r5
+	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
+	mtspr	SPRN_MMCRA,r5
+	blr
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 3a40951..f482286 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -450,6 +450,31 @@ static int __init feat_enable_pmu_power9(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static void init_pmu_power10(void)
+{
+	init_pmu_power9();
+
+	mtspr(SPRN_MMCR3, 0);
+	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
+}
+
+static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
+{
+	hfscr_pmu_enable();
+
+	init_pmu_power10();
+	init_pmu_registers = init_pmu_power10;
+
+	cur_cpu_spec->cpu_features |= CPU_FTR_MMCRA;
+	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_PSERIES_PERFMON_COMPAT;
+
+	cur_cpu_spec->num_pmcs          = 6;
+	cur_cpu_spec->pmc_type          = PPC_PMC_IBM;
+	cur_cpu_spec->oprofile_cpu_type = "ppc64/power10";
+
+	return 1;
+}
+
 static int __init feat_enable_tm(struct dt_cpu_feature *f)
 {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -639,6 +664,7 @@ struct dt_cpu_feature_match {
 	{"pc-relative-addressing", feat_enable, 0},
 	{"machine-check-power9", feat_enable_mce_power9, 0},
 	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
+	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
 	{"event-based-branch-v3", feat_enable, 0},
 	{"random-number-generator", feat_enable, 0},
 	{"system-call-vectored", feat_disable, 0},
-- 
1.8.3.1

