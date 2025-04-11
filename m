Return-Path: <linuxppc-dev+bounces-7579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D264A85357
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 07:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYlxL6CDNz3bqp;
	Fri, 11 Apr 2025 15:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744350262;
	cv=none; b=WwKP7ps06q4rxYhzih1Q0qK9LqzWUgxBdNCfV9aUl2ABrc/aHqXlvDDzWCq12jokR3wP19zuKN8+uGJdpMQRg2KmYksJoeNkRM1dKxdrt68J6cw9zPfGd7iEpbn1kzd4E3Ikgolaq7deM54PAFthqWv14W81MNcKx5l7ISaAfylpRlesZlqth6h5eXcPZbZVEnzMzfR79u90LJ+COfRJYwMO2t6mik+NybfERZHEbHf6LzKQgzC+J17kgiLnC5hVJOZrbynzcCAclROWbq/t2CMJJcBYBkyhzG81/Db0P848mIAe+VqzrBu0lQ0nhJV8kP7LahPRe5Tl1UF+ZPrz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744350262; c=relaxed/relaxed;
	bh=3Ot6DZ7cfsewEQGaP3LboejgpTNzdRO8mpL1eSokIY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6+gZnVx1UPJJBfIAjyhJhtGgrlfMMk53jhuecItTi63I5Yr/3ylOBu3xlAheksUs/noHQd4X7ggHcy0A7sJUNYw1e+awD9IxQfjhX3TdDJnDxWgQUDMVKnxi3P0EmImHtCZ0Nenp60P5vkQ04deCO5nhwbHIn1ATa2vQePajfhzare0wtdA+pGaSsimVRKvNmvTa6T2F94XACf/JeXvlPdBYH/L4AdERKwBAMbukOvGb7P0trDt6N/adfr1rGXdNR9nigzAebSh0eHbcoiWWvtVDUd+5bU8igi2kFvIJ9wXXX5Kp5/eq2+2doUKT+u6sax4hL/trqhm848RB2T7aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBth/vfq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBth/vfq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYlxH2ksDz3bqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 15:44:18 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AKMBvc003789;
	Fri, 11 Apr 2025 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3Ot6DZ7cfsewEQGaP
	3LboejgpTNzdRO8mpL1eSokIY4=; b=IBth/vfq7jX28WiVCCb51cYyENBIV8bjR
	c+U8cDZv2RGnTX4gOMYdegARN9YclcHkm/0+u5WAq0QNbCbQ+ta46KqWuNOW+4+A
	mp9kLcR3G0BxQ3DKfEuhjnZwtee6UV5OR6lQ24QGm0m4zLv/SGcmb9L4kKg2+qNV
	GA/k3tkC6xTYty0sOtfvs2XJ4r9O1+JDjBZNRUA1IFmTcnjgdvWiw4d0ANkR26Fp
	tDNFsty2HZGPvJzH9QcDb+XJl06+uz12btfhLoxdFc+2XsjoVncqgV4i4qCWl1yC
	l02NlXOII6N7wxFloChCO1szdGjXENq651yPPerNOZzcHnrl0cJ2A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xe13vft9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1Ss7v017457;
	Fri, 11 Apr 2025 05:44:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2m1cvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i4Ys32244446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2606D20043;
	Fri, 11 Apr 2025 05:44:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442BD2004B;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9620960AC5;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 11/11] powerpc: mm: Support page table check
Date: Fri, 11 Apr 2025 15:43:54 +1000
Message-ID: <20250411054354.511145-12-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y867Sb2dWhOoD2JVJblNz_gpFviXOoTU
X-Proofpoint-GUID: y867Sb2dWhOoD2JVJblNz_gpFviXOoTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=781 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

On creation and clearing of a page table mapping, instrument such calls
by invoking page_table_check_pte_set and page_table_check_pte_clear
respectively. These calls serve as a sanity check against illegal
mappings.

Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all platforms.

See also:

riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
arm64 in commit 42b2547137f5 ("arm64/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
check")

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[ajd: rebase]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  7 ++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 45 +++++++++++++++-----
 arch/powerpc/include/asm/nohash/pgtable.h    |  8 +++-
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 11 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  3 ++
 arch/powerpc/mm/pgtable.c                    |  4 ++
 8 files changed, 68 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..1f9ab11fa1a6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -173,6 +173,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index a2305d850fc9..ad7febf75471 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -202,6 +202,7 @@ void unmap_kernel_page(unsigned long va);
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
 #include <linux/threads.h>
+#include <linux/page_table_check.h>
 
 /* Bits to mask out from a PGD to get to the PUD page */
 #define PGD_MASKED_BITS		0
@@ -315,7 +316,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 754d4d525f0e..da07d604c275 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -145,6 +145,8 @@
 #define PAGE_KERNEL_ROX	__pgprot(_PAGE_BASE | _PAGE_KERNEL_ROX)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
+
 /*
  * page table defines
  */
@@ -417,8 +419,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
 {
-	unsigned long old = pte_update(mm, addr, ptep, ~0UL, 0, 0);
-	return __pte(old);
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
@@ -427,11 +432,16 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 					    pte_t *ptep, int full)
 {
 	if (full && radix_enabled()) {
+		pte_t old_pte;
+
 		/*
 		 * We know that this is a full mm pte clear and
 		 * hence can be sure there is no parallel set_pte.
 		 */
-		return radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		old_pte = radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		page_table_check_pte_clear(mm, addr, old_pte);
+
+		return old_pte;
 	}
 	return ptep_get_and_clear(mm, addr, ptep);
 }
@@ -1309,19 +1319,34 @@ extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pmd_t *pmdp)
 {
-	if (radix_enabled())
-		return radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
-	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	pmd_t old_pmd;
+
+	if (radix_enabled()) {
+		old_pmd = radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	} else {
+		old_pmd = hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	}
+
+	page_table_check_pmd_clear(mm, addr, old_pmd);
+
+	return old_pmd;
 }
 
 #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
 static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pud_t *pudp)
 {
-	if (radix_enabled())
-		return radix__pudp_huge_get_and_clear(mm, addr, pudp);
-	BUG();
-	return *pudp;
+	pud_t old_pud;
+
+	if (radix_enabled()) {
+		old_pud = radix__pudp_huge_get_and_clear(mm, addr, pudp);
+	} else {
+		BUG();
+	}
+
+	page_table_check_pud_clear(mm, addr, old_pud);
+
+	return old_pud;
 }
 
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 1c3dfe2d6cc1..36c79f39f47d 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -29,6 +29,8 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 #ifndef __ASSEMBLY__
 
+#include <linux/page_table_check.h>
+
 extern int icache_44x_need_flush;
 
 #ifndef pte_huge_size
@@ -122,7 +124,11 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 988948d69bc1..c1c25d46dd16 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/mm_types.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/stop_machine.h>
 
 #include <asm/sections.h>
@@ -231,6 +232,9 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
+
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	/*
 	 * Wait for all pending hash_page to finish. This is needed
 	 * in case of subpage collapse. When we collapse normal pages
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2b23283f0e8e..085e99390726 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/pkeys.h>
 #include <linux/debugfs.h>
 #include <linux/proc_fs.h>
+#include <linux/page_table_check.h>
 
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
@@ -128,6 +129,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pmd_leaf(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return set_pte_at_unchecked(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
@@ -145,6 +147,7 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pud_leaf(pud)));
 #endif
 	trace_hugepage_set_pud(addr, pud_val(pud));
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp), pud_pte(pud));
 }
 
@@ -180,12 +183,14 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
 pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		     pmd_t *pmdp)
 {
-	unsigned long old_pmd;
+	pmd_t old_pmd;
 
 	VM_WARN_ON_ONCE(!pmd_present(*pmdp));
-	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
+	old_pmd = __pmd(pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID));
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
-	return __pmd(old_pmd);
+	page_table_check_pmd_clear(vma->vm_mm, address, old_pmd);
+
+	return old_pmd;
 }
 
 pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 1704381f5c3c..cc0dda11a640 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
@@ -1454,6 +1455,8 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
 
 	return pmd;
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 4cc9af7961ca..ed46151ae1d9 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/percpu.h>
 #include <linux/hardirq.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
@@ -206,6 +207,9 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 * and not hw_valid ptes. Hence there is no translation cache flush
 	 * involved that need to be batched.
 	 */
+
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
+
 	for (;;) {
 
 		/*
-- 
2.49.0


