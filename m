Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA72196E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:53:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Mjc4dmxzF0PV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBc0kRjzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:31 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06931VZ9189437; Wed, 8 Jul 2020 23:30:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325kgtuf54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693FV71025949;
 Thu, 9 Jul 2020 03:30:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 325k1nky2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:25 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693UO8446268730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9144AB205F;
 Thu,  9 Jul 2020 03:30:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B706EB2064;
 Thu,  9 Jul 2020 03:30:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 13/23] powerpc/book3s64/pkeys: Add MMU_FTR_PKEY
Date: Thu,  9 Jul 2020 08:59:36 +0530
Message-Id: <20200709032946.881753-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090019
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
 arch/powerpc/include/asm/mmu.h           |  9 ++++
 arch/powerpc/kernel/prom.c               |  5 +++
 arch/powerpc/mm/book3s64/pkeys.c         | 52 ++++++++++++++----------
 4 files changed, 50 insertions(+), 22 deletions(-)

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
index f4ac25d4df05..88aed01fad81 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -28,6 +28,10 @@
  * Individual features below.
  */
 
+/*
+ * Support for memory protection keys.
+ */
+#define MMU_FTR_PKEY			ASM_CONST(0x00001000)
 /*
  * Support for 68 bit VA space. We added that from ISA 2.05
  */
@@ -177,6 +181,9 @@ enum {
 		MMU_FTR_RADIX_KUAP |
 #endif /* CONFIG_PPC_KUAP */
 #endif /* CONFIG_PPC_RADIX_MMU */
+#ifdef CONFIG_PPC_MEM_KEYS
+	MMU_FTR_PKEY |
+#endif
 		0,
 };
 
@@ -356,6 +363,8 @@ extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				       phys_addr_t first_memblock_size);
 static inline void mmu_early_init_devtree(void) { }
 
+static inline void pkey_early_init_devtree(void) {}
+
 extern void *abatron_pteptrs[2];
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9cc49f265c86..4cb65fd5f532 100644
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
index ac272166e5b4..c795a28c1964 100644
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
 int  num_pkey;		/* Max number of pkeys supported */
@@ -46,31 +47,38 @@ static int execute_only_key = 2;
 #define PKEY_REG_BITS (sizeof(u64) * 8)
 #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
 
+static int __init dt_scan_storage_keys(unsigned long node,
+				       const char *uname, int depth,
+				       void *data)
+{
+	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+	const __be32 *prop;
+	int *pkeys_total = (int *) data;
+
+	/* We are scanning "cpu" nodes only */
+	if (type == NULL || strcmp(type, "cpu") != 0)
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "ibm,processor-storage-keys", NULL);
+	if (!prop)
+		return 0;
+	*pkeys_total = be32_to_cpu(prop[0]);
+	return 1;
+}
+
 static int scan_pkey_feature(void)
 {
-	u32 vals[2];
+	int ret;
 	int pkeys_total = 0;
-	struct device_node *cpu;
 
 	/*
 	 * Pkey is not supported with Radix translation.
 	 */
-	if (radix_enabled())
-		return 0;
-
-	cpu = of_find_node_by_type(NULL, "cpu");
-	if (!cpu)
+	if (early_radix_enabled())
 		return 0;
 
-	if (of_property_read_u32_array(cpu,
-				       "ibm,processor-storage-keys", vals, 2) == 0) {
-		/*
-		 * Since any pkey can be used for data or execute, we will
-		 * just treat all keys as equal and track them as one entity.
-		 */
-		pkeys_total = vals[0];
-	} else {
-
+	ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
+	if (ret == 0) {
 		/*
 		 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by device
 		 * tree. We make this exception since some version of skiboot forgot to
@@ -94,7 +102,7 @@ static int scan_pkey_feature(void)
 	return pkeys_total;
 }
 
-static int pkey_initialize(void)
+void __init pkey_early_init_devtree(void)
 {
 	int pkeys_total, i;
 
@@ -119,9 +127,11 @@ static int pkey_initialize(void)
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
@@ -201,11 +211,9 @@ static int pkey_initialize(void)
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

