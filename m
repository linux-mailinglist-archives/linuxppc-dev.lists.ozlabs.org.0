Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50196940F54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:30:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEtbsRJn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBMC1Rgrz30VR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEtbsRJn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5L3275zz3cZ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:44:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83232CE0E51;
	Tue, 30 Jul 2024 06:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1846C4AF11;
	Tue, 30 Jul 2024 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321848;
	bh=PV8eOJ4vyzS4FxAkaZ5NDLLSz9ktugALPQl2HkO57GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZEtbsRJnMf7Ux0oUP43wBe2ysz4FoXhhZTuwRiPtnQvwBzcF04hW3I71Xi5W3eYCz
	 vb88N88O7flGQsN6anDDUISBm6/xyE43fRkDhAbxLnCjDlVv82fGw6FotjAYvt6GYX
	 QFHcPrRinsx/+c7KPzDEsLxpolwpWompiMzb0pXGb0blFP07SEq1UyKFHAQv8XC/pa
	 pwgu/eKYgUvwjUgeNQmkj2V0n+sfCR/zx78ePeUsj8CmLWrWcX3OzbvvjpOQap3f7i
	 4IH69bYV6ej5Ph0nh99eBqc8supUb+vBuZOERYMAwubQqITEfEu+UKFYgdgEO9AhVB
	 gqDximJu4aCiQ==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Subject: [RFC PATCH 06/18] mm/thp: convert insert_pfn_pmd and its caller to use ptdesc
Date: Tue, 30 Jul 2024 14:47:00 +0800
Message-ID: <20240730064712.3714387-7-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jul 2024 20:25:54 +1000
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Alex Shi <alexs@kernel.org>, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alex Shi <alexs@kernel.org>

Since we have ptdesc struct now, better to use replace pgtable_t, aka
'struct page *'. It's alaos a preparation for return ptdesc pointer
in pte_alloc_one series function.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/huge_memory.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d86108d81a99..a331d4504d52 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1136,7 +1136,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
-		pgtable_t pgtable)
+		struct ptdesc *ptdesc)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
@@ -1166,10 +1166,10 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		entry = maybe_pmd_mkwrite(entry, vma);
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	if (ptdesc) {
+		pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
 		mm_inc_nr_ptes(mm);
-		pgtable = NULL;
+		ptdesc = NULL;
 	}
 
 	set_pmd_at(mm, addr, pmd, entry);
@@ -1177,8 +1177,8 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 out_unlock:
 	spin_unlock(ptl);
-	if (pgtable)
-		pte_free(mm, pgtable);
+	if (ptdesc)
+		pte_free(mm, ptdesc_page(ptdesc));
 }
 
 /**
@@ -1196,7 +1196,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
-	pgtable_t pgtable = NULL;
+	struct ptdesc *ptdesc = NULL;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1213,14 +1213,14 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 		return VM_FAULT_SIGBUS;
 
 	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
+		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		if (!ptdesc)
 			return VM_FAULT_OOM;
 	}
 
 	track_pfn_insert(vma, &pgprot, pfn);
 
-	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, ptdesc);
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
-- 
2.43.0

