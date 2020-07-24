Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE522C04E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 09:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BChQk6sZ1zDsq3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:58:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BChNF74SMzDrgb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:56:13 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O7YZZ0031553; Fri, 24 Jul 2020 03:56:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23h284q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:56:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O7tATP026395;
 Fri, 24 Jul 2020 07:56:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 32brq9tupj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:56:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O7u5ef54133036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 07:56:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E38AAC062;
 Fri, 24 Jul 2020 07:56:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32583AC05E;
 Fri, 24 Jul 2020 07:56:04 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.55.22])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 07:56:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/radix: Add kernel command line option to
 disable radix GTSE
Date: Fri, 24 Jul 2020 13:26:00 +0530
Message-Id: <20200724075600.317640-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240055
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a kernel command line option that can be used to disable GTSE support.
Disabling GTSE implies kernel will make hcalls to invalidate TLB entries.

This was done so that we can do VM migration between configs that enable/disable
GTSE support via hypervisor. To migrate a VM from a system that supports
GTSE to a system that doesn't, we can boot the guest with radix_gtse=off, thereby
forcing the guest to use hcalls for TLB invalidates.

The check for hcall availability is done in pSeries_setup_arch so that
the panic message appears on the console. This should only happen on
a hypervisor that doesn't force the guest to hash translation even
though it can't handle the radix GTSE=0 request via CAS. With radix_gtse=off
if the hypervisor doesn't support hcall_rpt_invalidate hcall it should
force the LPAR to hash translation.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/powerpc/include/asm/firmware.h             |  4 +++-
 arch/powerpc/kernel/prom_init.c                 | 13 +++++++++----
 arch/powerpc/platforms/pseries/firmware.c       |  1 +
 arch/powerpc/platforms/pseries/setup.c          |  5 +++++
 5 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79..df20c98a8920 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -896,6 +896,9 @@
 	disable_radix	[PPC]
 			Disable RADIX MMU mode on POWER9
 
+	radix_gtse=off	[PPC/PSERIES]
+			Disable RADIX GTSE feature.
+
 	disable_tlbie	[PPC]
 			Disable TLBIE instruction. Currently does not work
 			with KVM, with HASH MMU, or with coherent accelerators.
diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 6003c2e533a0..aa6a5ef5d483 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -52,6 +52,7 @@
 #define FW_FEATURE_PAPR_SCM 	ASM_CONST(0x0000002000000000)
 #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
 #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
+#define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -71,7 +72,8 @@ enum {
 		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
-		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR,
+		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
+		FW_FEATURE_RPT_INVALIDATE,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index cbc605cfdec0..e7e91965fe6c 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -169,6 +169,7 @@ static unsigned long __prombss prom_tce_alloc_end;
 
 #ifdef CONFIG_PPC_PSERIES
 static bool __prombss prom_radix_disable;
+static bool __prombss prom_radix_gtse_disable;
 static bool __prombss prom_xive_disable;
 #endif
 
@@ -823,6 +824,12 @@ static void __init early_cmdline_parse(void)
 	if (prom_radix_disable)
 		prom_debug("Radix disabled from cmdline\n");
 
+	opt = prom_strstr(prom_cmd_line, "radix_gtse=off");
+	if (opt) {
+		prom_radix_gtse_disable = true;
+		prom_debug("Radix GTSE disabled from cmdline\n");
+	}
+
 	opt = prom_strstr(prom_cmd_line, "xive=off");
 	if (opt) {
 		prom_xive_disable = true;
@@ -1285,10 +1292,8 @@ static void __init prom_parse_platform_support(u8 index, u8 val,
 		prom_parse_mmu_model(val & OV5_FEAT(OV5_MMU_SUPPORT), support);
 		break;
 	case OV5_INDX(OV5_RADIX_GTSE): /* Radix Extensions */
-		if (val & OV5_FEAT(OV5_RADIX_GTSE)) {
-			prom_debug("Radix - GTSE supported\n");
-			support->radix_gtse = true;
-		}
+		if (val & OV5_FEAT(OV5_RADIX_GTSE))
+			support->radix_gtse = !prom_radix_gtse_disable;
 		break;
 	case OV5_INDX(OV5_XIVE_SUPPORT): /* Interrupt mode */
 		prom_parse_xive_model(val & OV5_FEAT(OV5_XIVE_SUPPORT),
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 3e49cc23a97a..4c7b7f5a2ebc 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -65,6 +65,7 @@ hypertas_fw_features_table[] = {
 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
 	{FW_FEATURE_BLOCK_REMOVE,	"hcall-block-remove"},
 	{FW_FEATURE_PAPR_SCM,		"hcall-scm"},
+	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
 };
 
 /* Build up the firmware features bitmask using the contents of
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2db8469e475f..9e5e098665f7 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -745,6 +745,11 @@ static void __init pSeries_setup_arch(void)
 	smp_init_pseries();
 
 
+	if (radix_enabled() && !mmu_has_feature(MMU_FTR_GTSE))
+		if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
+			panic("BUG: Radix support requires either GTSE or RPT_INVALIDATE\n");
+
+
 	/* openpic global configuration register (64-bit format). */
 	/* openpic Interrupt Source Unit pointer (64-bit format). */
 	/* python0 facility area (mmio) (64-bit format) REAL address. */
-- 
2.26.2

