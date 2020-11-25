Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA502C38E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:57:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqsX5b54zDqxf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cZAdCmzg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgq0K0RGczDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:52 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52o6k017836; Wed, 25 Nov 2020 00:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FKd7rYnHDGzvvT/hr3OJKSz2xRkWxmm5Otmajt2RN0o=;
 b=cZAdCmzgCn2Xz8JsYKRXW63YqzfII8O/5UoNO0VcFw3Yumjv/rsZ7ZpgVZmHXk9LydOQ
 Azt3OSgjac0LrnchcNl6RRViAUbwGcNdvSw5jbdm3SLxbALU3Xtb3HfAvieFqxKYebpv
 /lWs2qh/HKjKe67QCPee7+/TiQBF2EH1TH+rI3fFXwEs6V9asYdUZciqTqy8lRAZo3fq
 gz+3SLTGrSnqAPQJ573S7xskEkw2ysl+35bTqXPrkxn3txb0YWTO4owC74+HXSbtrEEk
 /WYTPN7e2S7Nchu9xTvSwmvEm7fD0cZD1LlNxVlhNTj8beru/8aSF+QM6QKrLDmfacrg 2A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350uq3kkxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:47 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5D7U4019135;
 Wed, 25 Nov 2020 05:17:47 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 34xtha42md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HkZJ8716844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CC00124052;
 Wed, 25 Nov 2020 05:17:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 910A312405C;
 Wed, 25 Nov 2020 05:17:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 21/22] powerpc/book3s64/hash/kup: Don't hardcode kup key
Date: Wed, 25 Nov 2020 10:46:33 +0530
Message-Id: <20201125051634.509286-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_02:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250030
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make KUAP/KUEP key a variable and also check whether the platform
limit the max key such that we can't use the key for KUAP/KEUP.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../powerpc/include/asm/book3s/64/hash-pkey.h | 22 +-------
 arch/powerpc/include/asm/book3s/64/pkeys.h    |  1 +
 arch/powerpc/mm/book3s64/pkeys.c              | 53 ++++++++++++++++---
 3 files changed, 49 insertions(+), 27 deletions(-)

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
diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index 3b8640498f5b..a2b6c4a7275f 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -8,6 +8,7 @@
 extern u64 __ro_after_init default_uamor;
 extern u64 __ro_after_init default_amr;
 extern u64 __ro_after_init default_iamr;
+extern int kup_key;
 
 static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index f029e7bf5ca2..204e4598b45c 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -37,7 +37,10 @@ u64 default_uamor __ro_after_init;
  */
 static int execute_only_key = 2;
 static bool pkey_execute_disable_supported;
-
+/*
+ * key used to implement KUAP/KUEP with hash translation.
+ */
+int kup_key = 3;
 
 #define AMR_BITS_PER_PKEY 2
 #define AMR_RD_BIT 0x1UL
@@ -185,6 +188,25 @@ void __init pkey_early_init_devtree(void)
 		default_uamor &= ~(0x3ul << pkeyshift(execute_only_key));
 	}
 
+	if (unlikely(num_pkey <= kup_key)) {
+		/*
+		 * Insufficient number of keys to support
+		 * KUAP/KUEP feature.
+		 */
+		kup_key = -1;
+	} else {
+		/*  handle key which is used by kernel for KAUP */
+		reserved_allocation_mask |= (0x1 << kup_key);
+		/*
+		 * Mark access for kup_key in default amr so that
+		 * we continue to operate with that AMR in
+		 * copy_to/from_user().
+		 */
+		default_amr   &= ~(0x3ul << pkeyshift(kup_key));
+		default_iamr  &= ~(0x1ul << pkeyshift(kup_key));
+		default_uamor &= ~(0x3ul << pkeyshift(kup_key));
+	}
+
 	/*
 	 * Allow access for only key 0. And prevent any other modification.
 	 */
@@ -205,9 +227,6 @@ void __init pkey_early_init_devtree(void)
 	reserved_allocation_mask |= (0x1 << 1);
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
-	/*  handle key 3 which is used by kernel for KAUP */
-	reserved_allocation_mask |= (0x1 << 3);
-	default_uamor &= ~(0x3ul << pkeyshift(3));
 
 	/*
 	 * Prevent the usage of OS reserved keys. Update UAMOR
@@ -236,7 +255,7 @@ void __init pkey_early_init_devtree(void)
 #ifdef CONFIG_PPC_KUEP
 void __init setup_kuep(bool disabled)
 {
-	if (disabled)
+	if (disabled || kup_key == -1)
 		return;
 	/*
 	 * On hash if PKEY feature is not enabled, disable KUAP too.
@@ -262,7 +281,7 @@ void __init setup_kuep(bool disabled)
 #ifdef CONFIG_PPC_KUAP
 void __init setup_kuap(bool disabled)
 {
-	if (disabled)
+	if (disabled || kup_key == -1)
 		return;
 	/*
 	 * On hash if PKEY feature is not enabled, disable KUAP too.
@@ -458,4 +477,26 @@ void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
 	mm->context.execute_only_pkey = oldmm->context.execute_only_pkey;
 }
 
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
 #endif /* CONFIG_PPC_MEM_KEYS */
-- 
2.28.0

