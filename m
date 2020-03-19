Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71218AB87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:02:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jYCK3hKvzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:02:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jY4H235JzDr6K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 14:56:31 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J3XeMP055590; Wed, 18 Mar 2020 23:56:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8bsau92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:23 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J3sI5I145238;
 Wed, 18 Mar 2020 23:56:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8bsau8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J3pme8021055;
 Thu, 19 Mar 2020 03:56:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 2yrpw6npkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 03:56:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J3uLBY46662142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 03:56:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B39E112067;
 Thu, 19 Mar 2020 03:56:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8387C112062;
 Thu, 19 Mar 2020 03:56:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.213])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 03:56:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v2 01/22] powerpc/pkeys: Avoid using lockless page table walk
Date: Thu, 19 Mar 2020 09:25:48 +0530
Message-Id: <20200319035609.158654-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
References: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=971 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190013
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
Cc: Ram Pai <linuxram@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kirill@shutemov.name, leonardo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fetch pkey from vma instead of linux page table. Also document the fact that in
some cases the pkey returned in siginfo won't be the same as the one we took
keyfault on. Even with linux page table walk, we can end up in a similar scenario.

Cc: Ram Pai <linuxram@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/mmu.h        |  9 ---
 arch/powerpc/mm/book3s64/hash_utils.c | 24 --------
 arch/powerpc/mm/fault.c               | 83 +++++++++++++++++++--------
 3 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 0699cfeeb8c9..cf2a08bfd5cd 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -291,15 +291,6 @@ static inline bool early_radix_enabled(void)
 }
 #endif
 
-#ifdef CONFIG_PPC_MEM_KEYS
-extern u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address);
-#else
-static inline u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address)
-{
-	return 0;
-}
-#endif /* CONFIG_PPC_MEM_KEYS */
-
 #ifdef CONFIG_STRICT_KERNEL_RWX
 static inline bool strict_kernel_rwx_enabled(void)
 {
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 523d4d39d11e..8530ddbba56f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1670,30 +1670,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	hash_preload(vma->vm_mm, address, is_exec, trap);
 }
 
-#ifdef CONFIG_PPC_MEM_KEYS
-/*
- * Return the protection key associated with the given address and the
- * mm_struct.
- */
-u16 get_mm_addr_key(struct mm_struct *mm, unsigned long address)
-{
-	pte_t *ptep;
-	u16 pkey = 0;
-	unsigned long flags;
-
-	if (!mm || !mm->pgd)
-		return 0;
-
-	local_irq_save(flags);
-	ptep = find_linux_pte(mm->pgd, address, NULL, NULL);
-	if (ptep)
-		pkey = pte_to_pkey_bits(pte_val(READ_ONCE(*ptep)));
-	local_irq_restore(flags);
-
-	return pkey;
-}
-#endif /* CONFIG_PPC_MEM_KEYS */
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 static inline void tm_flush_hash_page(int local)
 {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8db0507619e2..ab99ffa7d946 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -118,9 +118,34 @@ static noinline int bad_area(struct pt_regs *regs, unsigned long address)
 	return __bad_area(regs, address, SEGV_MAPERR);
 }
 
-static int bad_key_fault_exception(struct pt_regs *regs, unsigned long address,
-				    int pkey)
+#ifdef CONFIG_PPC_MEM_KEYS
+static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
+				    struct vm_area_struct *vma)
 {
+	struct mm_struct *mm = current->mm;
+	int pkey;
+
+	/*
+	 * We don't try to fetch the pkey from page table because reading
+	 * page table without locking doesn't guarantee stable pte value.
+	 * Hence the pkey value that we return to userspace can be different
+	 * from the pkey that actually caused access error.
+	 *
+	 * It does *not* guarantee that the VMA we find here
+	 * was the one that we faulted on.
+	 *
+	 * 1. T1   : mprotect_key(foo, PAGE_SIZE, pkey=4);
+	 * 2. T1   : set AMR to deny access to pkey=4, touches, page
+	 * 3. T1   : faults...
+	 * 4.    T2: mprotect_key(foo, PAGE_SIZE, pkey=5);
+	 * 5. T1   : enters fault handler, takes mmap_sem, etc...
+	 * 6. T1   : reaches here, sees vma_pkey(vma)=5, when we really
+	 *	     faulted on a pte with its pkey=4.
+	 */
+	pkey = vma_pkey(vma);
+
+	up_read(&mm->mmap_sem);
+
 	/*
 	 * If we are in kernel mode, bail out with a SEGV, this will
 	 * be caught by the assembly which will restore the non-volatile
@@ -133,6 +158,7 @@ static int bad_key_fault_exception(struct pt_regs *regs, unsigned long address,
 
 	return 0;
 }
+#endif
 
 static noinline int bad_access(struct pt_regs *regs, unsigned long address)
 {
@@ -289,8 +315,31 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 	return false;
 }
 
-static bool access_error(bool is_write, bool is_exec,
-			 struct vm_area_struct *vma)
+#ifdef CONFIG_PPC_MEM_KEYS
+static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
+			      struct vm_area_struct *vma)
+{
+	/*
+	 * Read or write was blocked by protection keys.  This is
+	 * always an unconditional error and can never result in
+	 * a follow-up action to resolve the fault, like a COW.
+	 */
+	if (is_pkey)
+		return true;
+
+	/*
+	 * Make sure to check the VMA so that we do not perform
+	 * faults just to hit a pkey fault as soon as we fill in a
+	 * page. Only called for current mm, hence foreign == 0
+	 */
+	if (!arch_vma_access_permitted(vma, is_write, is_exec, 0))
+		return true;
+
+	return false;
+}
+#endif
+
+static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma)
 {
 	/*
 	 * Allow execution from readable areas if the MMU does not
@@ -483,10 +532,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
-	if (error_code & DSISR_KEYFAULT)
-		return bad_key_fault_exception(regs, address,
-					       get_mm_addr_key(mm, address));
-
 	/*
 	 * We want to do this outside mmap_sem, because reading code around nip
 	 * can result in fault, which will cause a deadlock when called with
@@ -555,6 +600,13 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return bad_area(regs, address);
 
 good_area:
+
+#ifdef CONFIG_PPC_MEM_KEYS
+	if (unlikely(access_pkey_error(is_write, is_exec,
+				       (error_code & DSISR_KEYFAULT), vma)))
+		return bad_access_pkey(regs, address, vma);
+#endif /* CONFIG_PPC_MEM_KEYS */
+
 	if (unlikely(access_error(is_write, is_exec, vma)))
 		return bad_access(regs, address);
 
@@ -565,21 +617,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	 */
 	fault = handle_mm_fault(vma, address, flags);
 
-#ifdef CONFIG_PPC_MEM_KEYS
-	/*
-	 * we skipped checking for access error due to key earlier.
-	 * Check that using handle_mm_fault error return.
-	 */
-	if (unlikely(fault & VM_FAULT_SIGSEGV) &&
-		!arch_vma_access_permitted(vma, is_write, is_exec, 0)) {
-
-		int pkey = vma_pkey(vma);
-
-		up_read(&mm->mmap_sem);
-		return bad_key_fault_exception(regs, address, pkey);
-	}
-#endif /* CONFIG_PPC_MEM_KEYS */
-
 	major |= fault & VM_FAULT_MAJOR;
 
 	/*
-- 
2.24.1

