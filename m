Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4C7287EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYpd0R9Pz3fdD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RcRjFaFt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RcRjFaFt;
	dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYnl3L9sz3fFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:15:23 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39aa8a055e0so43778b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251721; x=1688843721;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WK0F+BrKreVsJ5WKZMSSwYtM+YC+fc99jiRjqR8qAzI=;
        b=RcRjFaFt7MTsXYJ14yWo4U5eA6pVqkDXz8EgSw8rQFycQ7pMspld1gf0LfqrvmcfQ5
         wTF2Paqcgla4R0ay3/D+SBW87kCEr4gikKdylaKnD0ifdUg5uzvb81mHOycuMKL93pbu
         +4jYc+S9ZIa5rCOofCbRs+g+NjpuL2HFQoI0VVvcn9kL+J6N1marZJvlyS6H29Uy9XP9
         eG8fQcR/05AwiXrOcow804IstbsNP+1l3OZiN8NosONtubhmvXmzHlK/q5JRXElO9Al1
         ir/ohc+1TCFZSM0rluyKdy7OGTLktO3/SESE0MYOh7msrNKoSiowE8nv54l9tGtZ2JpY
         LUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251721; x=1688843721;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WK0F+BrKreVsJ5WKZMSSwYtM+YC+fc99jiRjqR8qAzI=;
        b=HpFokRA2EFhDKXI3k24cYxSYGb2xt2snhbNzD24xdzekJg83zlvOnaTRfdHdtAUiEp
         Nt3/4plb7HLonAjg8ANwHgmnJLco4M2DP6P7dIF53S31/QAiWtMD8+sMG1/ssVXnO26p
         hPWmTt/ZWsuKzgW7a20QWxdd0136ZgMe0OdYoUi0qBAa0f3tuMX7idH4XBR6CRk1YSF5
         ypEDvj9t8jG51rBwTJtq3tTqSjkqLoxNV3boE474WFpW7YtDbgf7cQiFz04k8XfS908x
         m2M/Dy8ApWfO5fn9rzv+wNQaCSoxxKG4Y13xm9/an+G7I4r7GsvlwgqijsUMSuM3hB5r
         Rwbg==
X-Gm-Message-State: AC+VfDzSwK55fV0lmz4lN303b8NQNrUH6loaIQiMIKFyrOQoGgL4Dj/T
	0JXvItT1zxRfH45jXisyeFc/0A==
X-Google-Smtp-Source: ACHHUZ4GiCiA0/Y6MKCFg7CaDp1TXejdH2N2rUDPBFAR/nPzuleTjqZzDRxE6rsfXkK23/Kmg+ycrg==
X-Received: by 2002:a54:4893:0:b0:39a:b35b:a06c with SMTP id r19-20020a544893000000b0039ab35ba06cmr9888918oic.30.1686251720727;
        Thu, 08 Jun 2023 12:15:20 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a17-20020a81bb51000000b00545a08184fdsm89974ywl.141.2023.06.08.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:15:20 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:15:16 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 05/23] m68k: allow pte_offset_map[_lock]() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <795f6a7-bcca-cdf-ad2a-fbdaa232998c@google.com>
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
at label out, followed by one local_irq_restore() for all.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/m68k/include/asm/mmu_context.h |  6 ++--
 arch/m68k/kernel/sys_m68k.c         |  2 ++
 arch/m68k/mm/mcfmmu.c               | 52 ++++++++++++-----------------
 3 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 8ed6ac14d99f..141bbdfad960 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
-	pte_t *pte;
+	pte_t *pte = NULL;
 	unsigned long mmuar;
 
 	local_irq_save(flags);
@@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
 
 	pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
 				     : pte_offset_map(pmd, mmuar);
-	if (pte_none(*pte) || !pte_present(*pte))
+	if (!pte || pte_none(*pte) || !pte_present(*pte))
 		goto bug;
 
 	set_pte(pte, pte_mkyoung(*pte));
@@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struct *task)
 bug:
 	pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
 end:
+	if (pte && mmuar < PAGE_OFFSET)
+		pte_unmap(pte);
 	local_irq_restore(flags);
 }
 
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index bd0274c7592e..c586034d2a7a 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -488,6 +488,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 		if (!pmd_present(*pmd))
 			goto bad_access;
 		pte = pte_offset_map_lock(mm, pmd, (unsigned long)mem, &ptl);
+		if (!pte)
+			goto bad_access;
 		if (!pte_present(*pte) || !pte_dirty(*pte)
 		    || !pte_write(*pte)) {
 			pte_unmap_unlock(pte, ptl);
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 70aa0979e027..42f45abea37a 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -91,7 +91,8 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
-	pte_t *pte;
+	pte_t *pte = NULL;
+	int ret = -1;
 	int asid;
 
 	local_irq_save(flags);
@@ -100,47 +101,33 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 		regs->pc + (extension_word * sizeof(long));
 
 	mm = (!user_mode(regs) && KMAPAREA(mmuar)) ? &init_mm : current->mm;
-	if (!mm) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (!mm)
+		goto out;
 
 	pgd = pgd_offset(mm, mmuar);
-	if (pgd_none(*pgd))  {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pgd_none(*pgd))
+		goto out;
 
 	p4d = p4d_offset(pgd, mmuar);
-	if (p4d_none(*p4d)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (p4d_none(*p4d))
+		goto out;
 
 	pud = pud_offset(p4d, mmuar);
-	if (pud_none(*pud)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pud_none(*pud))
+		goto out;
 
 	pmd = pmd_offset(pud, mmuar);
-	if (pmd_none(*pmd)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pmd_none(*pmd))
+		goto out;
 
 	pte = (KMAPAREA(mmuar)) ? pte_offset_kernel(pmd, mmuar)
 				: pte_offset_map(pmd, mmuar);
-	if (pte_none(*pte) || !pte_present(*pte)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (!pte || pte_none(*pte) || !pte_present(*pte))
+		goto out;
 
 	if (write) {
-		if (!pte_write(*pte)) {
-			local_irq_restore(flags);
-			return -1;
-		}
+		if (!pte_write(*pte))
+			goto out;
 		set_pte(pte, pte_mkdirty(*pte));
 	}
 
@@ -161,9 +148,12 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
 	else
 		mmu_write(MMUOR, MMUOR_ITLB | MMUOR_ACC | MMUOR_UAA);
-
+	ret = 0;
+out:
+	if (pte && !KMAPAREA(mmuar))
+		pte_unmap(pte);
 	local_irq_restore(flags);
-	return 0;
+	return ret;
 }
 
 void __init cf_bootmem_alloc(void)
-- 
2.35.3

