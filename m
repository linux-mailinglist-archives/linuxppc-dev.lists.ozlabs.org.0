Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783552196C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2MRs2y62zDqYW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:42:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBF4LyvzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:13 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069326Bs113538; Wed, 8 Jul 2020 23:30:09 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kh3k9fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693GAnW013854;
 Thu, 9 Jul 2020 03:30:07 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 325k1y3y6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:07 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693U79q53281144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B2FB205F;
 Thu,  9 Jul 2020 03:30:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5320FB2071;
 Thu,  9 Jul 2020 03:30:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 06/23] powerpc/book3s64/pkeys: Simplify the key
 initialization
Date: Thu,  9 Jul 2020 08:59:29 +0530
Message-Id: <20200709032946.881753-7-aneesh.kumar@linux.ibm.com>
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
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 suspectscore=2 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090019
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

Add documentation explaining the execute_only_key. The reservation and initialization mask
details are also explained in this patch.

No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 199 ++++++++++++++++++-------------
 1 file changed, 116 insertions(+), 83 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 6ff9fe4112ef..54d4868a9e68 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -15,48 +15,80 @@
 DEFINE_STATIC_KEY_TRUE(pkey_disabled);
 int  pkeys_total;		/* Total pkeys as per device tree */
 u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
-u32  reserved_allocation_mask;  /* Bits set for reserved keys */
+/*
+ *  Keys marked in the reservation list cannot be allocated by  userspace
+ */
+u32  reserved_allocation_mask;
 static bool pkey_execute_disable_supported;
-static bool pkeys_devtree_defined;	/* property exported by device tree */
-static u64 pkey_amr_mask;		/* Bits in AMR not to be touched */
-static u64 pkey_iamr_mask;		/* Bits in AMR not to be touched */
-static u64 pkey_uamor_mask;		/* Bits in UMOR not to be touched */
+/*
+ * Even if we allocate keys with sys_pkey_alloc(), we need to make sure
+ * other thread still find the access denied using the same keys.
+ */
+static u64 default_amr = ~0x0UL;
+static u64 default_iamr = 0x5555555555555555UL;
+
+/* Allow all keys to be modified by default */
+static u64 default_uamor = ~0x0UL;
+/*
+ * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
+ * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
+ */
 static int execute_only_key = 2;
 
+
 #define AMR_BITS_PER_PKEY 2
 #define AMR_RD_BIT 0x1UL
 #define AMR_WR_BIT 0x2UL
 #define IAMR_EX_BIT 0x1UL
-#define PKEY_REG_BITS (sizeof(u64)*8)
+#define PKEY_REG_BITS (sizeof(u64) * 8)
 #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
 
-static void scan_pkey_feature(void)
+static int scan_pkey_feature(void)
 {
 	u32 vals[2];
+	int pkeys_total = 0;
 	struct device_node *cpu;
 
+	/*
+	 * Pkey is not supported with Radix translation.
+	 */
+	if (radix_enabled())
+		return 0;
+
 	cpu = of_find_node_by_type(NULL, "cpu");
 	if (!cpu)
-		return;
+		return 0;
 
 	if (of_property_read_u32_array(cpu,
-			"ibm,processor-storage-keys", vals, 2))
-		return;
+				       "ibm,processor-storage-keys", vals, 2) == 0) {
+		/*
+		 * Since any pkey can be used for data or execute, we will
+		 * just treat all keys as equal and track them as one entity.
+		 */
+		pkeys_total = vals[0];
+	} else {
+
+		/*
+		 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by device
+		 * tree. We make this exception since some version of skiboot forgot to
+		 * expose this property on power8/9.
+		 */
+		if (!firmware_has_feature(FW_FEATURE_LPAR)) {
+			unsigned long pvr = mfspr(SPRN_PVR);
+
+			if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
+			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9)
+				pkeys_total = 32;
+		}
+	}
 
 	/*
-	 * Since any pkey can be used for data or execute, we will just treat
-	 * all keys as equal and track them as one entity.
+	 * Adjust the upper limit, based on the number of bits supported by
+	 * arch-neutral code.
 	 */
-	pkeys_total = vals[0];
-	pkeys_devtree_defined = true;
-}
-
-static inline bool pkey_mmu_enabled(void)
-{
-	if (firmware_has_feature(FW_FEATURE_LPAR))
-		return pkeys_total;
-	else
-		return cpu_has_feature(CPU_FTR_PKEY);
+	pkeys_total = min_t(int, pkeys_total,
+			    ((ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) + 1));
+	return pkeys_total;
 }
 
 static int pkey_initialize(void)
@@ -80,35 +112,13 @@ static int pkey_initialize(void)
 				!= (sizeof(u64) * BITS_PER_BYTE));
 
 	/* scan the device tree for pkey feature */
-	scan_pkey_feature();
-
-	/*
-	 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by device
-	 * tree. We make this exception since some version of skiboot forgot to
-	 * expose this property on power8/9.
-	 */
-	if (!pkeys_devtree_defined && !firmware_has_feature(FW_FEATURE_LPAR)) {
-		unsigned long pvr = mfspr(SPRN_PVR);
-
-		if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
-		    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9)
-			pkeys_total = 32;
-	}
-
-	/*
-	 * Adjust the upper limit, based on the number of bits supported by
-	 * arch-neutral code.
-	 */
-	pkeys_total = min_t(int, pkeys_total,
-			((ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)+1));
-
-	if (!pkey_mmu_enabled() || radix_enabled() || !pkeys_total)
-		static_branch_enable(&pkey_disabled);
-	else
+	pkeys_total = scan_pkey_feature();
+	if (pkeys_total)
 		static_branch_disable(&pkey_disabled);
-
-	if (static_branch_likely(&pkey_disabled))
+	else {
+		static_branch_enable(&pkey_disabled);
 		return 0;
+	}
 
 	/*
 	 * The device tree cannot be relied to indicate support for
@@ -122,48 +132,71 @@ static int pkey_initialize(void)
 #ifdef CONFIG_PPC_4K_PAGES
 	/*
 	 * The OS can manage only 8 pkeys due to its inability to represent them
-	 * in the Linux 4K PTE.
+	 * in the Linux 4K PTE. Mark all other keys reserved.
 	 */
 	os_reserved = pkeys_total - 8;
 #else
 	os_reserved = 0;
 #endif
-	/*
-	 * key 1 is recommended not to be used. PowerISA(3.0) page 1015,
-	 * programming note.
-	 */
-	reserved_allocation_mask = (0x1 << 1) | (0x1 << execute_only_key);
-
-	/* register mask is in BE format */
-	pkey_amr_mask = ~0x0ul;
-	pkey_amr_mask &= ~(0x3ul << pkeyshift(0));
-
-	pkey_iamr_mask = ~0x0ul;
-	pkey_iamr_mask &= ~(0x3ul << pkeyshift(0));
-	pkey_iamr_mask &= ~(0x3ul << pkeyshift(execute_only_key));
-
-	pkey_uamor_mask = ~0x0ul;
-	pkey_uamor_mask &= ~(0x3ul << pkeyshift(0));
-	pkey_uamor_mask &= ~(0x3ul << pkeyshift(execute_only_key));
-
-	/* mark the rest of the keys as reserved and hence unavailable */
-	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
-		reserved_allocation_mask |= (0x1 << i);
-		pkey_uamor_mask &= ~(0x3ul << pkeyshift(i));
-	}
-	initial_allocation_mask = reserved_allocation_mask | (0x1 << 0);
 
 	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
 		/*
 		 * Insufficient number of keys to support
 		 * execute only key. Mark it unavailable.
-		 * Any AMR, UAMOR, IAMR bit set for
-		 * this key is irrelevant since this key
-		 * can never be allocated.
 		 */
 		execute_only_key = -1;
+	} else {
+		/*
+		 * Mark the execute_only_pkey as not available for
+		 * user allocation via pkey_alloc.
+		 */
+		reserved_allocation_mask |= (0x1 << execute_only_key);
+
+		/*
+		 * Deny READ/WRITE for execute_only_key.
+		 * Allow execute in IAMR.
+		 */
+		default_amr  |= (0x3ul << pkeyshift(execute_only_key));
+		default_iamr &= ~(0x1ul << pkeyshift(execute_only_key));
+
+		/*
+		 * Clear the uamor bits for this key.
+		 */
+		default_uamor &= ~(0x3ul << pkeyshift(execute_only_key));
 	}
 
+	/*
+	 * Allow access for only key 0. And prevent any other modification.
+	 */
+	default_amr   &= ~(0x3ul << pkeyshift(0));
+	default_iamr  &= ~(0x1ul << pkeyshift(0));
+	default_uamor &= ~(0x3ul << pkeyshift(0));
+	/*
+	 * key 0 is special in that we want to consider it an allocated
+	 * key which is preallocated. We don't allow changing AMR bits
+	 * w.r.t key 0. But one can pkey_free(key0)
+	 */
+	initial_allocation_mask |= (0x1 << 0);
+
+	/*
+	 * key 1 is recommended not to be used. PowerISA(3.0) page 1015,
+	 * programming note.
+	 */
+	reserved_allocation_mask |= (0x1 << 1);
+
+	/*
+	 * Prevent the usage of OS reserved the keys. Update UAMOR
+	 * for those keys.
+	 */
+	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
+		reserved_allocation_mask |= (0x1 << i);
+		default_uamor &= ~(0x3ul << pkeyshift(i));
+	}
+	/*
+	 * Prevent the allocation of reserved keys too.
+	 */
+	initial_allocation_mask |= reserved_allocation_mask;
+
 	return 0;
 }
 
@@ -305,13 +338,13 @@ void thread_pkey_regs_init(struct thread_struct *thread)
 	if (static_branch_likely(&pkey_disabled))
 		return;
 
-	thread->amr = pkey_amr_mask;
-	thread->iamr = pkey_iamr_mask;
-	thread->uamor = pkey_uamor_mask;
+	thread->amr   = default_amr;
+	thread->iamr  = default_iamr;
+	thread->uamor = default_uamor;
 
-	write_uamor(pkey_uamor_mask);
-	write_amr(pkey_amr_mask);
-	write_iamr(pkey_iamr_mask);
+	write_amr(default_amr);
+	write_iamr(default_iamr);
+	write_uamor(default_uamor);
 }
 
 int __execute_only_pkey(struct mm_struct *mm)
-- 
2.26.2

