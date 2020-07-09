Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD0219700
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:00:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Msd0Dz6zDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:00:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBl48ybzDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069326me113499; Wed, 8 Jul 2020 23:30:34 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kh3k9tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:33 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693EUkg027184;
 Thu, 9 Jul 2020 03:30:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 325k23u577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:32 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693UWNW53936502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:32 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43A35B2064;
 Thu,  9 Jul 2020 03:30:32 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374B5B205F;
 Thu,  9 Jul 2020 03:30:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 16/23] powerpc/book3s64/pkeys: Use MMU_FTR_PKEY instead of
 pkey_disabled static key
Date: Thu,  9 Jul 2020 08:59:39 +0530
Message-Id: <20200709032946.881753-17-aneesh.kumar@linux.ibm.com>
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

Instead of pkey_disabled static key use mmu feature MMU_FTR_PKEY.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pkeys.h |  2 +-
 arch/powerpc/include/asm/pkeys.h           | 14 ++++++--------
 arch/powerpc/mm/book3s64/pkeys.c           | 17 +++++++----------
 3 files changed, 14 insertions(+), 19 deletions(-)

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
index f44a14d64d47..a7951049e129 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -11,7 +11,6 @@
 #include <linux/jump_label.h>
 #include <asm/firmware.h>
 
-DECLARE_STATIC_KEY_FALSE(pkey_disabled);
 extern int num_pkey;
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
index db2d0d34f515..f388c8d5359a 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -12,8 +12,6 @@
 #include <linux/pkeys.h>
 #include <linux/of_fdt.h>
 
-
-DEFINE_STATIC_KEY_FALSE(pkey_disabled);
 int  num_pkey;		/* Max number of pkeys supported */
 /*
  *  Keys marked in the reservation list cannot be allocated by  userspace
@@ -126,7 +124,6 @@ void __init pkey_early_init_devtree(void)
 	pkeys_total = scan_pkey_feature();
 	if (!pkeys_total) {
 		/* No support for pkey. Mark it disabled */
-		static_branch_enable(&pkey_disabled);
 		return;
 	}
 
@@ -216,7 +213,7 @@ void __init pkey_early_init_devtree(void)
 
 void pkey_mm_init(struct mm_struct *mm)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 	mm_pkey_allocation_map(mm) = initial_allocation_mask;
 	mm->context.execute_only_pkey = execute_only_key;
@@ -320,7 +317,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 
 void thread_pkey_regs_save(struct thread_struct *thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	/*
@@ -334,7 +331,7 @@ void thread_pkey_regs_save(struct thread_struct *thread)
 void thread_pkey_regs_restore(struct thread_struct *new_thread,
 			      struct thread_struct *old_thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	if (old_thread->amr != new_thread->amr)
@@ -347,7 +344,7 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
 
 void thread_pkey_regs_init(struct thread_struct *thread)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	thread->amr   = default_amr;
@@ -416,7 +413,7 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 
 bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return true;
 
 	return pkey_access_permitted(pte_to_pkey_bits(pte), write, execute);
@@ -433,7 +430,7 @@ bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 			       bool execute, bool foreign)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return true;
 	/*
 	 * Do not enforce our key-permissions on a foreign vma.
@@ -446,7 +443,7 @@ bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 
 void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
 {
-	if (static_branch_likely(&pkey_disabled))
+	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
 	/* Duplicate the oldmm pkey state in mm: */
-- 
2.26.2

