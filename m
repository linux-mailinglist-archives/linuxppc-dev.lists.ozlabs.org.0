Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A61F8E03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 08:44:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lhds5cg4zDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:44:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lh073t4czDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:15:35 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F63STt056951; Mon, 15 Jun 2020 02:15:30 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31nacs3gmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:15:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6ElRb022974;
 Mon, 15 Jun 2020 06:15:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 31mpe8rym4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:15:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6FQkD11731218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:15:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D49C6057;
 Mon, 15 Jun 2020 06:15:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C25D2C6055;
 Mon, 15 Jun 2020 06:15:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:15:25 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 16/41] powerpc/book3s64/pkeys: Use MMU_FTR_PKEY instead of
 pkey_disabled static key
Date: Mon, 15 Jun 2020 11:44:05 +0530
Message-Id: <20200615061430.770174-17-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-12,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 cotscore=-2147483648 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=2 mlxlogscore=999 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
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

Instead of pkey_disabled static key use mmu feature MMU_FTR_PKEY.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pkeys.h |  2 +-
 arch/powerpc/include/asm/pkeys.h           | 14 ++++++--------
 arch/powerpc/mm/book3s64/pkeys.c           | 16 +++++++---------
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index 8174662a9173..5b178139f3c0 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -7,7 +7,7 @@
 
 static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return 0x0UL;
 
 	if (radix_enabled())
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 09fbaa409ac4..b1d448c53209 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -11,7 +11,6 @@
 #include <linux/jump_label.h>
 #include <asm/firmware.h>
 
-DECLARE_STATIC_KEY_FALSE(pkey_disabled);
 extern int max_pkey;
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 
@@ -38,7 +37,7 @@ static inline u64 pkey_to_vmflag_bits(u16 pkey)
 
 static inline int vma_pkey(struct vm_area_struct *vma)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return 0;
 	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
 }
@@ -93,9 +92,8 @@ static inline int mm_pkey_alloc(struct mm_struct *mm)
 	u32 all_pkeys_mask = (u32)(~(0x0));
 	int ret;
 
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return -1;
-
 	/*
 	 * Are we out of pkeys? We must handle this specially because ffz()
 	 * behavior is undefined if there are no zeros.
@@ -111,7 +109,7 @@ static inline int mm_pkey_alloc(struct mm_struct *mm)
 
 static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return -1;
 
 	if (!mm_pkey_is_allocated(mm, pkey))
@@ -132,7 +130,7 @@ extern int __arch_override_mprotect_pkey(struct vm_area_struct *vma,
 static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 					      int prot, int pkey)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return 0;
 
 	/*
@@ -150,7 +148,7 @@ extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 					    unsigned long init_val)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return -EINVAL;
 
 	/*
@@ -167,7 +165,7 @@ static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 
 static inline bool arch_pkeys_enabled(void)
 {
-	return !static_branch_likely(&pkey_disabled);
+	return mmu_has_feature(MMU_FTR_PKEY);
 }
 
 extern void pkey_mm_init(struct mm_struct *mm);
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index fed4f159011b..810118123e70 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -13,7 +13,6 @@
 #include <linux/of_fdt.h>
 
 
-DEFINE_STATIC_KEY_FALSE(pkey_disabled);
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
 int  max_pkey;			/* Maximum key value supported */
 /*
@@ -114,7 +113,6 @@ void __init pkey_early_init_devtree(void)
 	pkeys_total = scan_pkey_feature();
 	if (!pkeys_total) {
 		/* No support for pkey. Mark it disabled */
-		static_branch_enable(&pkey_disabled);
 		return;
 	}
 
@@ -202,7 +200,7 @@ void __init pkey_early_init_devtree(void)
 
 void pkey_mm_init(struct mm_struct *mm)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 	mm_pkey_allocation_map(mm) = initial_allocation_mask;
 	mm->context.execute_only_pkey = execute_only_key;
@@ -306,7 +304,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 
 void thread_pkey_regs_save(struct thread_struct *thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	/*
@@ -320,7 +318,7 @@ void thread_pkey_regs_save(struct thread_struct *thread)
 void thread_pkey_regs_restore(struct thread_struct *new_thread,
 			      struct thread_struct *old_thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	if (old_thread->amr != new_thread->amr)
@@ -333,7 +331,7 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
 
 void thread_pkey_regs_init(struct thread_struct *thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	thread->amr   = default_amr;
@@ -408,7 +406,7 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 
 bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return true;
 
 	return pkey_access_permitted(pte_to_pkey_bits(pte), write, execute);
@@ -425,7 +423,7 @@ bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 			       bool execute, bool foreign)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return true;
 	/*
 	 * Do not enforce our key-permissions on a foreign vma.
@@ -438,7 +436,7 @@ bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 
 void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	/* Duplicate the oldmm pkey state in mm: */
-- 
2.26.2

