Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F240584EF99
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 05:08:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4I7lXnA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWL2F4wjyz3c0n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 15:08:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4I7lXnA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWL1S4tSCz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 15:08:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4193EbkR024794;
	Fri, 9 Feb 2024 04:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XtQLEqC4oIHmVS7OTKq3zoA79cJ/TAbf1WlCbHorZjA=;
 b=Y4I7lXnAqYezcJrllo8QBFw2xIxEZz+BbiGZsjswpSyDbCb4sbP/PYEQYhuUTO3LcwSB
 UW6zGwExMSuiffiT1ppSIBiNNSJY3bHJJnqez3JPpJqczqP0qXejhhRzLH24JYvgpHqT
 xolGZMZEFjax+L/93PiAF+fJrQjI1ASoh3Uxau3f0n67vj8wBFFtoa9VXCXXSE33l4/l
 dXQ6jhWPAeeL7gZI5Fp1x6qyJWkILqkL6bEmPaz1E3pWEOkVQhlwcALqub2zufsjNUO0
 7Trjts8ui6maVxdfWsku+Ho6o1bldnpUYV093EdVwG/0/D/rOMhGxRyU9uIfZ+J9F59a Cw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w591xce0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 04:08:03 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4192Ftnq014778;
	Fri, 9 Feb 2024 04:08:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w20tp8yh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 04:08:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41947xVB32703184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Feb 2024 04:07:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 742B820040;
	Fri,  9 Feb 2024 04:07:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59E4120043;
	Fri,  9 Feb 2024 04:07:58 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.171.62.238])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Feb 2024 04:07:58 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 1/2] powerpc: Add Power11 architected and raw mode
Date: Fri,  9 Feb 2024 09:37:52 +0530
Message-ID: <20240209040753.748609-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HfHGn21vSuST1f1DgZuJ0EcHCXtZcytX
X-Proofpoint-ORIG-GUID: HfHGn21vSuST1f1DgZuJ0EcHCXtZcytX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402090027
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

reg.h is updated with Power11 pvr. pvr_mask value of 0x0F000007
means we are arch v3.1 compliant. This is used by phyp and
kvm when booting as a pseries guest to detect and enable
the appropriate hwcap, facility bits and PMU related fields.
Copied most of fields from Power10 table entry.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
- added macro to address logical PVR to
  handle compat mode PCR setting
- removed power11 functions which were
  just re-direction to power10. Instead
  used power10 functions as suggested.

Changelog v1
- No change 

 arch/powerpc/include/asm/cputable.h       |  3 ++
 arch/powerpc/include/asm/mmu.h            |  1 +
 arch/powerpc/include/asm/reg.h            |  2 ++
 arch/powerpc/kernel/cpu_specs_book3s_64.h | 34 +++++++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c         | 10 +++++++
 arch/powerpc/kernel/prom_init.c           | 10 ++++++-
 arch/powerpc/kvm/book3s_hv.c              |  1 +
 7 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 8765d5158324..3bd6e6e0224c 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -454,6 +454,9 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
 	    CPU_FTR_DEXCR_NPHIE)
+
+#define CPU_FTRS_POWER11	CPU_FTRS_POWER10
+
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index d8b7e246a32f..61ebe5eff2c9 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -133,6 +133,7 @@
 #define MMU_FTRS_POWER8		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER9		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER10	MMU_FTRS_POWER6
+#define MMU_FTRS_POWER11	MMU_FTRS_POWER6
 #define MMU_FTRS_CELL		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
 				MMU_FTR_CI_LARGE_PAGE
 #define MMU_FTRS_PA6T		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 7fd09f25452d..a3d844dae417 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1364,6 +1364,7 @@
 #define PVR_HX_C2000	0x0066
 #define PVR_POWER9	0x004E
 #define PVR_POWER10	0x0080
+#define PVR_POWER11	0x0082
 #define PVR_BE		0x0070
 #define PVR_PA6T	0x0090
 
@@ -1375,6 +1376,7 @@
 #define PVR_ARCH_207	0x0f000004
 #define PVR_ARCH_300	0x0f000005
 #define PVR_ARCH_31	0x0f000006
+#define PVR_ARCH_31N	0x0f000007
 
 /* Macros for setting and retrieving special purpose registers */
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
index 3ff9757df4c0..98d4274a1b6b 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
@@ -60,6 +60,9 @@
 				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
 				 PPC_FEATURE2_VEC_CRYPTO)
 
+#define COMMON_USER_POWER11	COMMON_USER_POWER10
+#define COMMON_USER2_POWER11	COMMON_USER2_POWER10
+
 static struct cpu_spec cpu_specs[] __initdata = {
 	{	/* PPC970 */
 		.pvr_mask		= 0xffff0000,
@@ -281,6 +284,20 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.cpu_restore		= __restore_cpu_power10,
 		.platform		= "power10",
 	},
+	{	/* 3.1-compliant processor, i.e. Power11 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000007,
+		.cpu_name		= "Power11 (architected)",
+		.cpu_features		= CPU_FTRS_POWER11,
+		.cpu_user_features	= COMMON_USER_POWER11,
+		.cpu_user_features2	= COMMON_USER2_POWER11,
+		.mmu_features		= MMU_FTRS_POWER11,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.platform		= "power11",
+	},
 	{	/* Power7 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x003f0000,
@@ -451,6 +468,23 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.machine_check_early	= __machine_check_early_realmode_p10,
 		.platform		= "power10",
 	},
+	{	/* Power11 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00820000,
+		.cpu_name		= "Power11 (raw)",
+		.cpu_features		= CPU_FTRS_POWER11,
+		.cpu_user_features	= COMMON_USER_POWER11,
+		.cpu_user_features2	= COMMON_USER2_POWER11,
+		.mmu_features		= MMU_FTRS_POWER11,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.machine_check_early	= __machine_check_early_realmode_p10,
+		.platform		= "power11",
+	},
 	{	/* Cell Broadband Engine */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00700000,
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c3fb9fdf5bd7..af4263594eb2 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -458,6 +458,14 @@ static int __init feat_enable_mce_power10(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_mce_power11(struct dt_cpu_feature *f)
+{
+	cur_cpu_spec->platform = "power11";
+	cur_cpu_spec->machine_check_early = __machine_check_early_realmode_p10;
+
+	return 1;
+}
+
 static int __init feat_enable_tm(struct dt_cpu_feature *f)
 {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -648,8 +656,10 @@ static struct dt_cpu_feature_match __initdata
 	{"pc-relative-addressing", feat_enable, 0},
 	{"machine-check-power9", feat_enable_mce_power9, 0},
 	{"machine-check-power10", feat_enable_mce_power10, 0},
+	{"machine-check-power11", feat_enable_mce_power11, 0},
 	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
 	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
+	{"performance-monitor-power11", feat_enable_pmu_power10, 0},
 	{"event-based-branch-v3", feat_enable, 0},
 	{"random-number-generator", feat_enable, 0},
 	{"system-call-vectored", feat_disable, 0},
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index e67effdba85c..895a3441223b 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -947,7 +947,7 @@ struct option_vector7 {
 } __packed;
 
 struct ibm_arch_vec {
-	struct { __be32 mask, val; } pvrs[14];
+	struct { __be32 mask, val; } pvrs[16];
 
 	u8 num_vectors;
 
@@ -1007,6 +1007,14 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 			.mask = cpu_to_be32(0xffff0000), /* POWER10 */
 			.val  = cpu_to_be32(0x00800000),
 		},
+		{
+			.mask = cpu_to_be32(0xffff0000), /* POWER11 */
+			.val  = cpu_to_be32(0x00820000),
+		},
+		{
+			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
+			.val  = cpu_to_be32(0x0f000007),
+		},
 		{
 			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
 			.val  = cpu_to_be32(0x0f000006),
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 52427fc2a33f..a26f3765a9e8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -427,6 +427,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 			cap = H_GUEST_CAP_POWER9;
 			break;
 		case PVR_ARCH_31:
+		case PVR_ARCH_31N:
 			guest_pcr_bit = PCR_ARCH_31;
 			cap = H_GUEST_CAP_POWER10;
 			break;
-- 
2.43.0

