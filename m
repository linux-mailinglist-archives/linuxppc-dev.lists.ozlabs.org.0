Return-Path: <linuxppc-dev+bounces-7580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC5AA85359
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 07:44:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYlxN0hg1z3bsL;
	Fri, 11 Apr 2025 15:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744350263;
	cv=none; b=Y/CVx0T5QWtt/jbYvIgrIXN6iAMG4ndV1U5DnTtsffakkYEBEHEg1V5sL4VDuG5vDBkmBQcBbTbzHd5g14FYe26IMH/bpegn53Q/+1IDE7nRdTLm3JXyvVpwFBpGPFY3z5Y4L5EBC1iXo0srbNyreZcEp3OqQC7h34njXrNFBTv8n0lDdtd7xDY5cdm3bZFZdE6HMoBoxKc2zbuZ5Rs747o3irVKsix/ZwJGZXKOeu+y5IjyNJOGgWWz6f9nNcOAvkludBDosWZOtqhvyh3zfec9pT+dRs9g5WLY93vvDX2lOKpjxX9Rx8hCki/bcr/cgi0kqIO+K6njEnamaxf8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744350263; c=relaxed/relaxed;
	bh=YkFBy5SVv+pmwLgsrOl6JOlYtrKvi/Xk5C3x6YU/tGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMhqtJ/qwEQw/4lRhBs5pt7mGxNYjnVbxyPzfebi3wyANycYaM8DETwW4TeAtdBDHp/EO7r+8u9YTVQK04aLaCpQxFhhAEWoYYCecCfZd/vnBg4zQ0KtW2D2VavLqDtfjklL+u7Rn6/7jl5pR8vLzc+rkMZJipqjfq5pQHojjsTMChWDtd5BrKy5Y721zVa2JDGlYbfdJzn9SR45khI2Ird0UJm0e93tvkIffwEA6fYJzaUgiBay8BQXL3QiU/QTyQyz47aJLgkv1uFz8oDYX6E80Gcs1j2PP+x8dE912COlkq8VMUP9JhBQ8qELTBV+auMvIYrpDb3IETnqEx7tbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQcGK/3C; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQcGK/3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYlxJ5CY8z3brM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 15:44:19 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B3kg9a028590;
	Fri, 11 Apr 2025 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YkFBy5SVv+pmwLgsr
	Ol6JOlYtrKvi/Xk5C3x6YU/tGs=; b=KQcGK/3CvvZZkSuwTgNmKjyvPHqNhPGk0
	sBbhDXzzdsYNydehnuvPIbw0PwoLxND3BO1PASItBeOxdp6l6c+MB+g7Z2KNzTd/
	LGaccB3GaxcGBlqCLOtAfHTaZjuhKQAe9SI3FxIDlS08MAdbjglWA0n7NVEZWn+u
	qkwMlffm5AQpLgGPyNy1Lr1e5nqkSso4VGkQCmFBCzLm1PpCXLTiGoSLW2ilBUsF
	92rHg0eHFbHRaDVjUtuuVfWCMMdf6izJtsUNVLaP9BbrKqmMc7+8redQaGnCmFKY
	kpTy+zamI7YwdioDnopjiSBjTPzRqX09fJORowfeaMsirp80Ed/yg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xufa8ea6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B3IZ2h029541;
	Fri, 11 Apr 2025 05:44:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45x1k77e0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i3Dh52560216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9FBC2004B;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19F0E20040;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 90F9D60AC8;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 10/11] powerpc: mm: Use set_pte_at_unchecked() for internal usages
Date: Fri, 11 Apr 2025 15:43:53 +1000
Message-ID: <20250411054354.511145-11-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: CWMtIF9iW1VzL4CYg1XcMH2ZEdkiDwMs
X-Proofpoint-ORIG-GUID: CWMtIF9iW1VzL4CYg1XcMH2ZEdkiDwMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=689
 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

In the new set_ptes() API, set_pte_at() (a special case of set_ptes())
is intended to be instrumented by the page table check facility. There
are however several other routines that constitute the API for setting
page table entries, including set_pmd_at() among others. Such routines
are themselves implemented in terms of set_ptes_at().

A future patch providing support for page table checking on powerpc
must take care to avoid duplicate calls to
page_table_check_p{te,md,ud}_set(). Allow for assignment of pte entries
without instrumentation through the set_pte_at_unchecked() routine
introduced in this patch.

Cause API-facing routines that call set_pte_at() to instead call
set_pte_at_unchecked(), which will remain uninstrumented by page
table check. set_ptes() is itself implemented by calls to
__set_pte_at(), so this eliminates redundant code.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
[ajd: don't change to unchecked for early boot/kernel mappings]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: don't use the unchecked version for early-boot kernel mappings (Pasha)
---
 arch/powerpc/include/asm/pgtable.h       | 2 ++
 arch/powerpc/mm/book3s64/pgtable.c       | 6 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 6 +++---
 arch/powerpc/mm/pgtable.c                | 8 ++++++++
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 3cae32c74fed..221cae4873b9 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -46,6 +46,8 @@ struct mm_struct;
 void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr);
 #define set_ptes set_ptes
+void set_pte_at_unchecked(struct mm_struct *mm, unsigned long addr,
+			  pte_t *ptep, pte_t pte);
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 8f7d41ce2ca1..2b23283f0e8e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -128,7 +128,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pmd_leaf(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
-	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
+	return set_pte_at_unchecked(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
 void set_pud_at(struct mm_struct *mm, unsigned long addr,
@@ -145,7 +145,7 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pud_leaf(pud)));
 #endif
 	trace_hugepage_set_pud(addr, pud_val(pud));
-	return set_pte_at(mm, addr, pudp_ptep(pudp), pud_pte(pud));
+	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp), pud_pte(pud));
 }
 
 static void do_serialize(void *arg)
@@ -556,7 +556,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
 	if (radix_enabled())
 		return radix__ptep_modify_prot_commit(vma, addr,
 						      ptep, old_pte, pte);
-	set_pte_at(vma->vm_mm, addr, ptep, pte);
+	set_pte_at_unchecked(vma->vm_mm, addr, ptep, pte);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 311e2112d782..1704381f5c3c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1586,7 +1586,7 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	    (atomic_read(&mm->context.copros) > 0))
 		radix__flush_tlb_page(vma, addr);
 
-	set_pte_at(mm, addr, ptep, pte);
+	set_pte_at_unchecked(mm, addr, ptep, pte);
 }
 
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
@@ -1597,7 +1597,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 	if (!radix_enabled())
 		return 0;
 
-	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud);
+	set_pte_at_unchecked(&init_mm, 0 /* radix unused */, ptep, new_pud);
 
 	return 1;
 }
@@ -1644,7 +1644,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	if (!radix_enabled())
 		return 0;
 
-	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd);
+	set_pte_at_unchecked(&init_mm, 0 /* radix unused */, ptep, new_pmd);
 
 	return 1;
 }
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 61df5aed7989..4cc9af7961ca 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -224,6 +224,14 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	}
 }
 
+void set_pte_at_unchecked(struct mm_struct *mm, unsigned long addr,
+			  pte_t *ptep, pte_t pte)
+{
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+	pte = set_pte_filter(pte, addr);
+	__set_pte_at(mm, addr, ptep, pte, 0);
+}
+
 void unmap_kernel_page(unsigned long va)
 {
 	pmd_t *pmdp = pmd_off_k(va);
-- 
2.49.0


