Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 417261F52F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:17:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hkx508FlzDqjj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj4g3c1dzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:54:11 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9XVnu073275; Wed, 10 Jun 2020 05:54:04 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jjx112kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:54:04 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9j2bI011865;
 Wed, 10 Jun 2020 09:54:03 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 31hygych0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:54:03 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9s2xL54526460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:54:02 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6996112064;
 Wed, 10 Jun 2020 09:54:02 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8FB0112062;
 Wed, 10 Jun 2020 09:54:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:54:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 41/41] powerpc/book3s64/hash/kup: Don't hardcode kup key
Date: Wed, 10 Jun 2020 15:22:04 +0530
Message-Id: <20200610095204.608183-42-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_04:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 cotscore=-2147483648 suspectscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100070
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

Make KUAP/KUEP key a variable and also check whether the platform
limit the max key such that we can't use the key for KUAP/KEUP.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../powerpc/include/asm/book3s/64/hash-pkey.h | 22 +--------
 arch/powerpc/include/asm/book3s/64/kup.h      |  1 +
 arch/powerpc/mm/book3s64/pkeys.c              | 46 +++++++++++++++++--
 3 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-pkey.h b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
index 9f44e208f036..ff9907c72ee3 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-pkey.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
@@ -2,9 +2,7 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
 #define _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
 
-/*  We use key 3 for KERNEL */
-#define HASH_DEFAULT_KERNEL_KEY (HPTE_R_KEY_BIT0 | HPTE_R_KEY_BIT1)
-
+u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags);
 static inline u64 hash__vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
 	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
@@ -14,24 +12,6 @@ static inline u64 hash__vmflag_to_pte_pkey_bits(u64 vm_flags)
 		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT4 : 0x0UL));
 }
 
-static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
-{
-	unsigned long pte_pkey;
-
-	pte_pkey = (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
-		    ((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
-		    ((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
-		    ((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
-		    ((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
-
-	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_KUEP)) {
-		if ((pte_pkey == 0) && (flags & HPTE_USE_KERNEL_KEY))
-			return HASH_DEFAULT_KERNEL_KEY;
-	}
-
-	return pte_pkey;
-}
-
 static inline u16 hash__pte_to_pkey_bits(u64 pteflags)
 {
 	return (((pteflags & H_PTE_PKEY_BIT4) ? 0x10 : 0x0UL) |
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 44a80fa94079..56afb3bb9055 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -172,6 +172,7 @@
 extern u64 default_uamor;
 extern u64 default_amr;
 extern u64 default_iamr;
+extern int kup_key;
 
 /*
  * For kernel thread that doesn't have thread.regs return
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 5d320ac2ba04..8ab2c377f315 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -29,6 +29,10 @@ u64 default_uamor = ~0x0UL;
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
  */
 static int execute_only_key = 2;
+/*
+ * key used to implement KUAP/KUEP with hash translation.
+ */
+int kup_key = 3;
 
 
 #define AMR_BITS_PER_PKEY 2
@@ -169,6 +173,18 @@ void __init pkey_early_init_devtree(void)
 		default_uamor &= ~(0x3ul << pkeyshift(execute_only_key));
 	}
 
+	if (unlikely(max_pkey <= kup_key)) {
+		/*
+		 * Insufficient number of keys to support
+		 * KUAP/KUEP feature.
+		 */
+		kup_key = -1;
+	} else {
+		/*  handle key which is used by kernel for KAUP */
+		reserved_allocation_mask |= (0x1 << kup_key);
+		default_uamor &= ~(0x3ul << pkeyshift(kup_key));
+	}
+
 	/*
 	 * Allow access for only key 0. And prevent any other modification.
 	 */
@@ -189,9 +205,6 @@ void __init pkey_early_init_devtree(void)
 	reserved_allocation_mask |= (0x1 << 1);
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
-	/*  handle key 3 which is used by kernel for KAUP */
-	reserved_allocation_mask |= (0x1 << 3);
-	default_uamor &= ~(0x3ul << pkeyshift(3));
 
 	/*
 	 * Prevent the usage of OS reserved keys. Update UAMOR
@@ -220,7 +233,7 @@ void __init pkey_early_init_devtree(void)
 #ifdef CONFIG_PPC_KUEP
 void __init setup_kuep(bool disabled)
 {
-	if (disabled)
+	if (disabled || kup_key == -1)
 		return;
 	/*
 	 * On hash if PKEY feature is not enabled, disable KUAP too.
@@ -246,7 +259,7 @@ void __init setup_kuep(bool disabled)
 #ifdef CONFIG_PPC_KUAP
 void __init setup_kuap(bool disabled)
 {
-	if (disabled)
+	if (disabled || kup_key == -1)
 		return;
 	/*
 	 * On hash if PKEY feature is not enabled, disable KUAP too.
@@ -449,3 +462,26 @@ void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
 	mm_pkey_allocation_map(mm) = mm_pkey_allocation_map(oldmm);
 	mm->context.execute_only_pkey = oldmm->context.execute_only_pkey;
 }
+
+u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
+{
+	unsigned long pte_pkey;
+
+	pte_pkey = (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
+
+	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_KUEP)) {
+		if ((pte_pkey == 0) &&
+		    (flags & HPTE_USE_KERNEL_KEY) && (kup_key != -1)) {
+			u64 vm_flag = pkey_to_vmflag_bits(kup_key);
+			u64 pte_flag = hash__vmflag_to_pte_pkey_bits(vm_flag);
+			return pte_to_hpte_pkey_bits(pte_flag, 0);
+		}
+	}
+
+	return pte_pkey;
+}
+
-- 
2.26.2

