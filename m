Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA17FE77E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 04:01:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V53Vh6eN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SggvZ2gPjz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 14:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V53Vh6eN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggmL05CSz3cSV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:55:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU2HTK4001670;
	Thu, 30 Nov 2023 02:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dJADjhtcsRn00ozfZ+66nH7xzBfSCdbnp7C8g6Om8UI=;
 b=V53Vh6eNNCq7GZxJQnsaj2zWd3YWql0z1CBgWrCLNjvudanvWGUfEZSOh8HFG+5dH7EP
 JGI3HBDGuZLGlo3KcnfUuZhZhAN4GA4oXq7Zfc11e1L53WwHDe6g2fNAmxERecG+bKJ0
 7aUX4uES1mWlj6xHLk5bVMxTtm0c3n4fNd99EgBcWoaR3c/W/qyj23c00aXFFdpOmsXo
 knhu4nUhe/VHoNjCqk0UL7lV0dm05PnCK8VGoA8JqBaUwdWmp+m5+a2mdnjKARxm+HmG
 DzHNNmVyaJ3Gqxn6dvOkHIlXTmv2ozzI5IA4eqvrkumXF/dPh/l6zSyjoF03EPrbAe0o jA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uphfqgqdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:21 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0Xw27030579;
	Thu, 30 Nov 2023 02:55:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrkudax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU2tIhP62390722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 02:55:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E35AA20043;
	Thu, 30 Nov 2023 02:55:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19BC520040;
	Thu, 30 Nov 2023 02:55:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 02:55:17 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AF66E60641;
	Thu, 30 Nov 2023 13:55:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 6/7] powerpc: mm: Use __set_pte_at() for early-boot / internal usages
Date: Thu, 30 Nov 2023 13:53:59 +1100
Message-ID: <20231130025404.37179-9-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130025404.37179-2-rmclure@linux.ibm.com>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sO-c4G5hiJwzX1hVhYsSAJjyUcjY86GY
X-Proofpoint-GUID: sO-c4G5hiJwzX1hVhYsSAJjyUcjY86GY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=860 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300020
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the new set_ptes() API, set_pte_at() (a special case of set_ptes())
is intended to be instrumented by the page table check facility. There
are however several other routines that constitute the API for setting
page table entries, including set_pmd_at() among others. Such routines
are themselves implemented in terms of set_ptes_at().

A future patch providing support for page table checking on powerpc
must take care to avoid duplicate calls to
page_table_check_p{te,md,ud}_set().

Cause API-facing routines that call set_pte_at() to instead call
__set_pte_at(), which will remain uninstrumented by page table check.
set_ptes() is itself implemented by calls to __set_pte_at(), so this
eliminates redundant code.

Also prefer __set_pte_at() in early-boot usages which should not be
instrumented.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v9: New patch
---
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c       |  4 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c | 10 +++++-----
 arch/powerpc/mm/nohash/book3e_pgtable.c  |  2 +-
 arch/powerpc/mm/pgtable_32.c             |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 988948d69bc1..ae52c8db45b7 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -165,7 +165,7 @@ int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
 		ptep = pte_alloc_kernel(pmdp, ea);
 		if (!ptep)
 			return -ENOMEM;
-		set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT, prot));
+		__set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT, prot), 0);
 	} else {
 		/*
 		 * If the mm subsystem is not fully up, we cannot create a
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index be229290a6a7..9a0a2accb261 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -116,7 +116,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pmd_large(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
-	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
+	return __set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd), 0);
 }
 
 void set_pud_at(struct mm_struct *mm, unsigned long addr,
@@ -539,7 +539,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
 	if (radix_enabled())
 		return radix__ptep_modify_prot_commit(vma, addr,
 						      ptep, old_pte, pte);
-	set_pte_at(vma->vm_mm, addr, ptep, pte);
+	__set_pte_at(vma->vm_mm, addr, ptep, pte, 0);
 }
 
 /*
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 1f8db10693e3..ae4a5f66ccd2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -109,7 +109,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 	ptep = pte_offset_kernel(pmdp, ea);
 
 set_the_pte:
-	set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
+	__set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags), 0);
 	asm volatile("ptesync": : :"memory");
 	return 0;
 }
@@ -169,7 +169,7 @@ static int __map_kernel_page(unsigned long ea, unsigned long pa,
 		return -ENOMEM;
 
 set_the_pte:
-	set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
+	__set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags), 0);
 	asm volatile("ptesync": : :"memory");
 	return 0;
 }
@@ -1536,7 +1536,7 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	    (atomic_read(&mm->context.copros) > 0))
 		radix__flush_tlb_page(vma, addr);
 
-	set_pte_at(mm, addr, ptep, pte);
+	__set_pte_at(mm, addr, ptep, pte, 0);
 }
 
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
@@ -1547,7 +1547,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 	if (!radix_enabled())
 		return 0;
 
-	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud);
+	__set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud, 0);
 
 	return 1;
 }
@@ -1594,7 +1594,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	if (!radix_enabled())
 		return 0;
 
-	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd);
+	__set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd, 0);
 
 	return 1;
 }
diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c b/arch/powerpc/mm/nohash/book3e_pgtable.c
index 1c5e4ecbebeb..4de91b54fd89 100644
--- a/arch/powerpc/mm/nohash/book3e_pgtable.c
+++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
@@ -111,7 +111,7 @@ int __ref map_kernel_page(unsigned long ea, phys_addr_t pa, pgprot_t prot)
 		}
 		ptep = pte_offset_kernel(pmdp, ea);
 	}
-	set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT, prot));
+	__set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT, prot), 0);
 
 	smp_wmb();
 	return 0;
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5c02fd08d61e..4bf3ca6af7cd 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -89,7 +89,7 @@ int __ref map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot)
 		 * hash table
 		 */
 		BUG_ON((pte_present(*pg) | pte_hashpte(*pg)) && pgprot_val(prot));
-		set_pte_at(&init_mm, va, pg, pfn_pte(pa >> PAGE_SHIFT, prot));
+		__set_pte_at(&init_mm, va, pg, pfn_pte(pa >> PAGE_SHIFT, prot), 0);
 	}
 	smp_wmb();
 	return err;
-- 
2.43.0

