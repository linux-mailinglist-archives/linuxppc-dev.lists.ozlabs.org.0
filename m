Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E32C5F62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:00:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2Wf5xPtzDrPJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:00:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k9hlPcJt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29Z11RyzDrQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:45:05 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4WP5l140653; Thu, 26 Nov 2020 23:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PGGAoqzBXp+9H4B/FLzCDJ/K0Q/Nux52hAsSnnk1ugE=;
 b=k9hlPcJtpU5gvGurmTTLbNfwW1xYiYGh9K66yPaKXjrrcPTJzlva6phKfLRiXak3BAUw
 ClnkvD8rIDNQCUAKa6s2o461WSRzHb2g0dvjwidI7VXNODjLCVroJJ85eDWxsYvaFwS/
 lWDqtTb78ZF5tFab0C2RupIlAidDVWlaGFdY1Od9/xVR/9ACRnc68tuACU/4Nax4bqDb
 LHKEM5/hXJOmdtifQYu/79B5f0kwhXB0zEv14nvjbr00fJMQQaialoENKVo72W5olzlq
 5y10FZ3cp5RNu3ocs8FRVZRwJmwvX5RQUsDYYwmQYqhimWZfW8Ja/0eOsDwRMWwveDBk OA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352swmgx12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:44:56 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4hGHk017190;
 Fri, 27 Nov 2020 04:44:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 34xthapvmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:44:55 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4ilqT11338390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:47 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B88326E04C;
 Fri, 27 Nov 2020 04:44:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76F256E052;
 Fri, 27 Nov 2020 04:44:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:51 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 08/22] powerpc/book3s64/kuap: Use Key 3 for kernel mapping
 with hash translation
Date: Fri, 27 Nov 2020 10:14:10 +0530
Message-Id: <20201127044424.40686-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch updates kernel hash page table entries to use storage key 3
for its mapping. This implies all kernel access will now use key 3 to
control READ/WRITE. The patch also prevents the allocation of key 3 from
userspace and UAMOR value is updated such that userspace cannot modify key 3.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../powerpc/include/asm/book3s/64/hash-pkey.h | 25 ++++++++++++++-----
 arch/powerpc/include/asm/book3s/64/hash.h     |  2 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 +
 arch/powerpc/include/asm/mmu_context.h        |  2 +-
 arch/powerpc/mm/book3s64/hash_4k.c            |  2 +-
 arch/powerpc/mm/book3s64/hash_64k.c           |  4 +--
 arch/powerpc/mm/book3s64/hash_hugepage.c      |  2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         | 10 +++++---
 arch/powerpc/mm/book3s64/pkeys.c              | 12 +++++++++
 11 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-pkey.h b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
index 795010897e5d..f1e60d579f6c 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-pkey.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
@@ -2,6 +2,9 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
 #define _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
 
+/*  We use key 3 for KERNEL */
+#define HASH_DEFAULT_KERNEL_KEY (HPTE_R_KEY_BIT0 | HPTE_R_KEY_BIT1)
+
 static inline u64 hash__vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
 	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
@@ -11,13 +14,23 @@ static inline u64 hash__vmflag_to_pte_pkey_bits(u64 vm_flags)
 		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT4 : 0x0UL));
 }
 
-static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
+static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
 {
-	return (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
+	unsigned long pte_pkey;
+
+	pte_pkey = (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
+		    ((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
+
+	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP) ||
+	    mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
+		if ((pte_pkey == 0) && (flags & HPTE_USE_KERNEL_KEY))
+			return HASH_DEFAULT_KERNEL_KEY;
+	}
+
+	return pte_pkey;
 }
 
 static inline u16 hash__pte_to_pkey_bits(u64 pteflags)
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 73ad038ed10b..d959b0195ad9 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -145,7 +145,7 @@ extern void hash__mark_initmem_nx(void);
 
 extern void hpte_need_flush(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, unsigned long pte, int huge);
-extern unsigned long htab_convert_pte_flags(unsigned long pteflags);
+unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags);
 /* Atomic PTE updates */
 static inline unsigned long hash__pte_update(struct mm_struct *mm,
 					 unsigned long addr,
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 683a9c7d1b03..9192cb05a6ab 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -452,6 +452,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
 
 #define HPTE_LOCAL_UPDATE	0x1
 #define HPTE_NOHPTE_UPDATE	0x2
+#define HPTE_USE_KERNEL_KEY	0x4
 
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index e02aa793420b..4b5e1cb49dce 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -284,7 +284,7 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 #define thread_pkey_regs_init(thread)
 #define arch_dup_pkeys(oldmm, mm)
 
-static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
+static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
 {
 	return 0x0UL;
 }
diff --git a/arch/powerpc/mm/book3s64/hash_4k.c b/arch/powerpc/mm/book3s64/hash_4k.c
index 22e787123cdf..7de1a8a0c62a 100644
--- a/arch/powerpc/mm/book3s64/hash_4k.c
+++ b/arch/powerpc/mm/book3s64/hash_4k.c
@@ -54,7 +54,7 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 	 * PP bits. _PAGE_USER is already PP bit 0x2, so we only
 	 * need to add in 0x1 if it's a read-only user page
 	 */
-	rflags = htab_convert_pte_flags(new_pte);
+	rflags = htab_convert_pte_flags(new_pte, flags);
 	rpte = __real_pte(__pte(old_pte), ptep, PTRS_PER_PTE);
 
 	if (cpu_has_feature(CPU_FTR_NOEXECUTE) &&
diff --git a/arch/powerpc/mm/book3s64/hash_64k.c b/arch/powerpc/mm/book3s64/hash_64k.c
index 7084ce2951e6..998c6817ed47 100644
--- a/arch/powerpc/mm/book3s64/hash_64k.c
+++ b/arch/powerpc/mm/book3s64/hash_64k.c
@@ -72,7 +72,7 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 	 * Handle the subpage protection bits
 	 */
 	subpg_pte = new_pte & ~subpg_prot;
-	rflags = htab_convert_pte_flags(subpg_pte);
+	rflags = htab_convert_pte_flags(subpg_pte, flags);
 
 	if (cpu_has_feature(CPU_FTR_NOEXECUTE) &&
 	    !cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
@@ -260,7 +260,7 @@ int __hash_page_64K(unsigned long ea, unsigned long access,
 			new_pte |= _PAGE_DIRTY;
 	} while (!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
 
-	rflags = htab_convert_pte_flags(new_pte);
+	rflags = htab_convert_pte_flags(new_pte, flags);
 	rpte = __real_pte(__pte(old_pte), ptep, PTRS_PER_PTE);
 
 	if (cpu_has_feature(CPU_FTR_NOEXECUTE) &&
diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
index 440823797de7..c0fabe6c5a12 100644
--- a/arch/powerpc/mm/book3s64/hash_hugepage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -57,7 +57,7 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
 	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
 		return 0;
 
-	rflags = htab_convert_pte_flags(new_pmd);
+	rflags = htab_convert_pte_flags(new_pmd, flags);
 
 #if 0
 	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
index 964467b3a776..b5e9fff8c217 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
@@ -70,7 +70,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
 		return 0;
 
-	rflags = htab_convert_pte_flags(new_pte);
+	rflags = htab_convert_pte_flags(new_pte, flags);
 	if (unlikely(mmu_psize == MMU_PAGE_16G))
 		offset = PTRS_PER_PUD;
 	else
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index fd9c7f91b092..567e0c6b3978 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -443,7 +443,7 @@ void hash__mark_initmem_nx(void)
 	start = (unsigned long)__init_begin;
 	end = (unsigned long)__init_end;
 
-	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL));
+	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
 
 	WARN_ON(!hash__change_memory_range(start, end, pp));
 }
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 24702c0a92e0..41ab053e17c9 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -186,7 +186,7 @@ static struct mmu_psize_def mmu_psize_defaults_gp[] = {
  *    - We make sure R is always set and never lost
  *    - C is _PAGE_DIRTY, and *should* always be set for a writeable mapping
  */
-unsigned long htab_convert_pte_flags(unsigned long pteflags)
+unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags)
 {
 	unsigned long rflags = 0;
 
@@ -240,7 +240,7 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags)
 		 */
 		rflags |= HPTE_R_M;
 
-	rflags |= pte_to_hpte_pkey_bits(pteflags);
+	rflags |= pte_to_hpte_pkey_bits(pteflags, flags);
 	return rflags;
 }
 
@@ -255,7 +255,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 	shift = mmu_psize_defs[psize].shift;
 	step = 1 << shift;
 
-	prot = htab_convert_pte_flags(prot);
+	prot = htab_convert_pte_flags(prot, HPTE_USE_KERNEL_KEY);
 
 	DBG("htab_bolt_mapping(%lx..%lx -> %lx (%lx,%d,%d)\n",
 	    vstart, vend, pstart, prot, psize, ssize);
@@ -1317,12 +1317,14 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		vsid = get_kernel_vsid(ea, mmu_kernel_ssize);
 		psize = mmu_vmalloc_psize;
 		ssize = mmu_kernel_ssize;
+		flags |= HPTE_USE_KERNEL_KEY;
 		break;
 
 	case IO_REGION_ID:
 		vsid = get_kernel_vsid(ea, mmu_kernel_ssize);
 		psize = mmu_io_psize;
 		ssize = mmu_kernel_ssize;
+		flags |= HPTE_USE_KERNEL_KEY;
 		break;
 	default:
 		/*
@@ -1901,7 +1903,7 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	unsigned long hash;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
 	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
-	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL));
+	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
 	long ret;
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index c5c61aa18a04..e434c0a2ee5d 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -205,6 +205,18 @@ void __init pkey_early_init_devtree(void)
 	reserved_allocation_mask |= (0x1 << 1);
 	default_uamor &= ~(0x3ul << pkeyshift(1));
 
+	/*  handle key which is used by kernel for KAUP */
+	reserved_allocation_mask |= (0x1 << 3);
+	/*
+	 * Mark access for KUAP key in default amr so that
+	 * we continue to operate with that AMR in
+	 * copy_to/from_user().
+	 */
+	default_amr   &= ~(0x3ul << pkeyshift(3));
+	default_iamr  &= ~(0x1ul << pkeyshift(3));
+	default_uamor &= ~(0x3ul << pkeyshift(3));
+
+
 	/*
 	 * Prevent the usage of OS reserved keys. Update UAMOR
 	 * for those keys. Also mark the rest of the bits in the
-- 
2.28.0

