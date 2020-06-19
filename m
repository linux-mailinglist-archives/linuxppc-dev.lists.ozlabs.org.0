Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEA200E44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 17:08:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pMcg4ZGRzDr7h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 01:08:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL5x5SLpzDrMS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:49 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcIgO110585; Fri, 19 Jun 2020 09:59:43 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rs7kjj6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDsqIk008995;
 Fri, 19 Jun 2020 13:59:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 31rd95fve5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:42 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDxdTV14287108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D642BBE04F;
 Fri, 19 Jun 2020 13:59:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98FF1BE051;
 Fri, 19 Jun 2020 13:59:38 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 13/26] powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
Date: Fri, 19 Jun 2020 19:28:37 +0530
Message-Id: <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_14:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 cotscore=-2147483648 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190100
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Parse storage keys related device tree entry in early_init_devtree
and enable MMU feature MMU_FTR_PKEY if pkeys are supported.

MMU feature is used instead of CPU feature because this enables us
to group MMU_FTR_KUAP and MMU_FTR_PKEY in asm feature fixup code.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  6 +++
 arch/powerpc/include/asm/mmu.h           |  6 +++
 arch/powerpc/kernel/prom.c               |  5 +++
 arch/powerpc/mm/book3s64/pkeys.c         | 54 ++++++++++++++----------
 4 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 5393a535240c..3371ea05b7d3 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -209,6 +209,12 @@ extern int mmu_io_psize;
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
+#ifdef CONFIG_PPC_MEM_KEYS
+void pkey_early_init_devtree(void);
+#else
+static inline void pkey_early_init_devtree(void) {}
+#endif
+
 extern void hash__early_init_mmu(void);
 extern void radix__early_init_mmu(void);
 static inline void __init early_init_mmu(void)
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index f4ac25d4df05..72966d3d8f64 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -23,6 +23,7 @@
 
 /* Radix page table supported and enabled */
 #define MMU_FTR_TYPE_RADIX		ASM_CONST(0x00000040)
+#define MMU_FTR_PKEY			ASM_CONST(0x00000080)
 
 /*
  * Individual features below.
@@ -177,6 +178,9 @@ enum {
 		MMU_FTR_RADIX_KUAP |
 #endif /* CONFIG_PPC_KUAP */
 #endif /* CONFIG_PPC_RADIX_MMU */
+#ifdef CONFIG_PPC_MEM_KEYS
+	MMU_FTR_PKEY |
+#endif
 		0,
 };
 
@@ -356,6 +360,8 @@ extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				       phys_addr_t first_memblock_size);
 static inline void mmu_early_init_devtree(void) { }
 
+static inline void pkey_early_init_devtree(void) {}
+
 extern void *abatron_pteptrs[2];
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6a3bac357e24..6d70797352d8 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -815,6 +815,11 @@ void __init early_init_devtree(void *params)
 	/* Now try to figure out if we are running on LPAR and so on */
 	pseries_probe_fw_features();
 
+	/*
+	 * Initialize pkey features and default AMR/IAMR values
+	 */
+	pkey_early_init_devtree();
+
 #ifdef CONFIG_PPC_PS3
 	/* Identify PS3 firmware */
 	if (of_flat_dt_is_compatible(of_get_flat_dt_root(), "sony,ps3"))
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 0ff59acdbb84..bbba9c601e14 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -10,7 +10,8 @@
 #include <asm/mmu.h>
 #include <asm/setup.h>
 #include <linux/pkeys.h>
-#include <linux/of_device.h>
+#include <linux/of_fdt.h>
+
 
 DEFINE_STATIC_KEY_FALSE(pkey_disabled);
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
@@ -38,38 +39,45 @@ static int execute_only_key = 2;
 #define PKEY_REG_BITS (sizeof(u64) * 8)
 #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
 
+static int __init dt_scan_storage_keys(unsigned long node,
+				       const char *uname, int depth,
+				       void *data)
+{
+	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+	const __be32 *prop;
+	int pkeys_total;
+
+	/* We are scanning "cpu" nodes only */
+	if (type == NULL || strcmp(type, "cpu") != 0)
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "ibm,processor-storage-keys", NULL);
+	if (!prop)
+		return 0;
+	pkeys_total = be32_to_cpu(prop[0]);
+	return pkeys_total;
+}
+
 static int scan_pkey_feature(void)
 {
-	u32 vals[2];
-	int pkeys_total = 0;
-	struct device_node *cpu;
+	int pkeys_total;
 
 	/*
 	 * Pkey is not supported with Radix translation.
 	 */
-	if (radix_enabled())
+	if (early_radix_enabled())
 		return 0;
 
-	cpu = of_find_node_by_type(NULL, "cpu");
-	if (!cpu)
-		return 0;
+	pkeys_total = of_scan_flat_dt(dt_scan_storage_keys, NULL);
+	if (pkeys_total == 0) {
 
-	if (of_property_read_u32_array(cpu,
-				       "ibm,processor-storage-keys", vals, 2) == 0) {
-		/*
-		 * Since any pkey can be used for data or execute, we will
-		 * just treat all keys as equal and track them as one entity.
-		 */
-		pkeys_total = vals[0];
-		/*  Should we check for IAMR support FIXME!! */
-	} else {
 		/*
 		 * Let's assume 32 pkeys on P8 bare metal, if its not defined by device
 		 * tree. We make this exception since skiboot forgot to expose this
 		 * property on power8.
 		 */
 		if (!firmware_has_feature(FW_FEATURE_LPAR) &&
-		    cpu_has_feature(CPU_FTRS_POWER8))
+		    early_cpu_has_feature(CPU_FTRS_POWER8))
 			pkeys_total = 32;
 	}
 
@@ -82,7 +90,7 @@ static int scan_pkey_feature(void)
 	return pkeys_total;
 }
 
-static int pkey_initialize(void)
+void __init pkey_early_init_devtree(void)
 {
 	int pkeys_total, i;
 
@@ -107,9 +115,11 @@ static int pkey_initialize(void)
 	if (!pkeys_total) {
 		/* No support for pkey. Mark it disabled */
 		static_branch_enable(&pkey_disabled);
-		return 0;
+		return;
 	}
 
+	cur_cpu_spec->mmu_features |= MMU_FTR_PKEY;
+
 	/*
 	 * The device tree cannot be relied to indicate support for
 	 * execute_disable support. Instead we use a PVR check.
@@ -187,11 +197,9 @@ static int pkey_initialize(void)
 	 */
 	initial_allocation_mask |= reserved_allocation_mask;
 
-	return 0;
+	return;
 }
 
-arch_initcall(pkey_initialize);
-
 void pkey_mm_init(struct mm_struct *mm)
 {
 	if (static_branch_likely(&pkey_disabled))
-- 
2.26.2

