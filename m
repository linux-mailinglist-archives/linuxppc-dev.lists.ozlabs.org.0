Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B020B72880D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:18:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYs33MTrz3fdC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:18:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OjxQxSGd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OjxQxSGd;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYrC42Zbz3dxQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:17:31 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-565c3aa9e82so9256667b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251849; x=1688843849;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7UlqbgxG6/xaVRAtCCqUssmJjUq670TXTguXR1OYLA=;
        b=OjxQxSGdY41m5JGioPLRRMHlbu1bKK9U/XvtQSsWn2huryMGbscAYfOgTPbtYvU/cY
         9huVOVy1gs221HXHTdTxeIS9YVBJM8bmeWwNXcHAGGu+nicpq5iZ05fikYyLmvX7+Ico
         B0dGfyyHLd/L99UUQOPdqJWluT143yDr4HPWe/IeSwrOdmo8Ey9hr6IWcFOUOcdRjD89
         uj2YuuaPnH3mhSN3ywyQu3CK8kSeEgGczYiudwTD8Jm0Ztvk+Qzx/bR/vvgb6aHZfoxB
         UdhBn1Xz2Oa9JpVFDtQjB5jQNwvMAbW3dNrfQzUbl4VOBwdYKLYYm2tmZUitVw+SniVU
         1QQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251849; x=1688843849;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7UlqbgxG6/xaVRAtCCqUssmJjUq670TXTguXR1OYLA=;
        b=fD10wdXki1mzHIAgfa08t6ScwAGqI87PSgAez2ifqtqQ/Wvjbi3b7U0XZDOw4eujbk
         k2NUZWKMZrHIImKsir4dp9HLuP/3kl9WFpvLam5byIFEJGWvhsVbt4nGp1GBhfTjWcwx
         BXiWpxjJWTaedwlO5BKSt0fMqRfrYBzQ/8UVu3IH0JcLQVK6c7D2UTSTvIZmWjshYhI1
         30Oj8LyZbMaOtuowWkawLJDgZs1Zmnd5e6OvS4T7uNrzEkuTKTefhuWoMkj4HreEV9IC
         26i5g2A3/kxHdaaQ7KYkX874W+Dwa6luIgvuimQnjgre3F3Se6TGiVSDwTpO8OH6ibw2
         pm2w==
X-Gm-Message-State: AC+VfDyx1IBwBUPryWGV1+Uz1LRwfQhpl7r5ETyIVwW3HukM4uo1cua6
	ChcoewrV6ZH6mtantMWmQjG5zA==
X-Google-Smtp-Source: ACHHUZ4FKrGElLGHi5/eSiT2fDophUzi3i/RSv3jkZHU9DU5gGJq5nlHfaRL95gf++/3qBOcCkTajg==
X-Received: by 2002:a81:8403:0:b0:565:eae8:793b with SMTP id u3-20020a818403000000b00565eae8793bmr567910ywf.25.1686251849019;
        Thu, 08 Jun 2023 12:17:29 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d190-20020a814fc7000000b00568b941e5e3sm109329ywb.72.2023.06.08.12.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:17:28 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:17:24 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't make update_mmu_cache() a wrapper around __update_tlb(): call it
directly, and use the ptep (or pmdp) provided by the caller, instead of
re-calling pte_offset_map() - which would raise a question of whether a
pte_unmap() is needed to balance it.

Check whether the "ptep" provided by the caller is actually the pmdp,
instead of testing pmd_huge(): or test pmd_huge() too and warn if it
disagrees?  This is "hazardous" territory: needs review and testing.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/mips/include/asm/pgtable.h | 15 +++------------
 arch/mips/mm/tlb-r3k.c          |  5 +++--
 arch/mips/mm/tlb-r4k.c          |  9 +++------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 574fa14ac8b2..9175dfab08d5 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -565,15 +565,8 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 }
 #endif
 
-extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
-	pte_t pte);
-
-static inline void update_mmu_cache(struct vm_area_struct *vma,
-	unsigned long address, pte_t *ptep)
-{
-	pte_t pte = *ptep;
-	__update_tlb(vma, address, pte);
-}
+extern void update_mmu_cache(struct vm_area_struct *vma,
+	unsigned long address, pte_t *ptep);
 
 #define	__HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
@@ -581,9 +574,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
 {
-	pte_t pte = *(pte_t *)pmdp;
-
-	__update_tlb(vma, address, pte);
+	update_mmu_cache(vma, address, (pte_t *)pmdp);
 }
 
 /*
diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index 53dfa2b9316b..e5722cd8dd6d 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -176,7 +176,8 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 	}
 }
 
-void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
+void update_mmu_cache(struct vm_area_struct *vma,
+		      unsigned long address, pte_t *ptep)
 {
 	unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
 	unsigned long flags;
@@ -203,7 +204,7 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
 	BARRIER;
 	tlb_probe();
 	idx = read_c0_index();
-	write_c0_entrylo0(pte_val(pte));
+	write_c0_entrylo0(pte_val(*ptep));
 	write_c0_entryhi(address | pid);
 	if (idx < 0) {					/* BARRIER */
 		tlb_write_random();
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 1b939abbe4ca..c96725d17cab 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -290,14 +290,14 @@ void local_flush_tlb_one(unsigned long page)
  * updates the TLB with the new pte(s), and another which also checks
  * for the R4k "end of page" hardware bug and does the needy.
  */
-void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
+void update_mmu_cache(struct vm_area_struct *vma,
+		      unsigned long address, pte_t *ptep)
 {
 	unsigned long flags;
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
-	pte_t *ptep;
 	int idx, pid;
 
 	/*
@@ -326,10 +326,9 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	idx = read_c0_index();
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
-	if (pmd_huge(*pmdp)) {
+	if (ptep == (pte_t *)pmdp) {
 		unsigned long lo;
 		write_c0_pagemask(PM_HUGE_MASK);
-		ptep = (pte_t *)pmdp;
 		lo = pte_to_entrylo(pte_val(*ptep));
 		write_c0_entrylo0(lo);
 		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
@@ -344,8 +343,6 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	} else
 #endif
 	{
-		ptep = pte_offset_map(pmdp, address);
-
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 #ifdef CONFIG_XPA
 		write_c0_entrylo0(pte_to_entrylo(ptep->pte_high));
-- 
2.35.3

