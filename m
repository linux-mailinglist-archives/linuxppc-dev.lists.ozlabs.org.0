Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF11D253CF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:51:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVgD18yXzDqHY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:51:20 +1000 (AEST)
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
 header.s=pp1 header.b=P/hlimjn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTmV2HWLzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:50 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R41slk011280; Thu, 27 Aug 2020 00:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dKIdsTTb9QcMvTzEtAC97/M96iji9Y+sjaf7qOVOzsA=;
 b=P/hlimjnJlM67eU9fA7JnayHfOXLk07geOQeZUcIjYP1QEpBzc3Cj79TPvZfhJeJ6NtQ
 cMZmDsc/ngU8/wh3qHox264AXpZxJLOWg94jXkiv99cslNgazrlZrB6GGkjx2DLTq873
 f+Av85UAbvA5Z+nSMkbmtgX1J4O8JVzm59WDoruVuzx2FyamUMZ/STH6ZFtXhcq0zZPg
 2FQY2JMx+1per/+uk9m8fewFUIF68MtmOKGSZd6b23088eSwx7miosTbqQYqdYur5JjH
 LfXDWOiGRqB05ZEzv2blwMZ/tWj0ZKgIZzE3W5IvAdGgLnAtK3eu1Wut+Uiw+MotiNQz vg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33655hrjqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R478M3003507;
 Thu, 27 Aug 2020 04:10:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 332uwaq10a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AhHo7405832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D467928067;
 Thu, 27 Aug 2020 04:10:43 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83EB12805E;
 Thu, 27 Aug 2020 04:10:42 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 22/23] powerpc/book3s64/hash/kup: Don't hardcode kup key
Date: Thu, 27 Aug 2020 09:39:30 +0530
Message-Id: <20200827040931.297759-23-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
index b862d5cd78ff..cb1d7d39e801 100644
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
2.26.2

