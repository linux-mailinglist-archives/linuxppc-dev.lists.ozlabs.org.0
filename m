Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60F940F39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXb4byD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBJ46m0dz3cyd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXb4byD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5K058G7z3cT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:43:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8E46CE0EA6;
	Tue, 30 Jul 2024 06:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469FBC32782;
	Tue, 30 Jul 2024 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321793;
	bh=9NZb0rrKQqKYXT4j44hct+A4v/K9XblH1QcI1NJ86wY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXb4byD4QEB/pykGQSUxfRgInQG2nhMHKXm5xZNegBtn3rrGWMaLewVYiqUNRYDtJ
	 aQ+opzP1rC4aJUxCXkL2wAnqAIW3nIQYdRxHYnksJ0PJsaNlzE/MV3jYxsY7CWC6i6
	 A55O5dfE29WFwTXyQHh6asj1EX4qez2hBgWChYq1nW9wZhzPJt7adzM3dujj4fTqjW
	 GPMlZQsWyciJ/EykTgqqAmIjcZelbGlK8I8ok7QSAhrcTaitTlPHXoD4wXFz71j46R
	 BpZv8MZ6nqA/BUfQ66+uiCN6lG0xAGpqKsFp7FzaM7qSm50/Hdt7uFpAhZjkPrnNQ4
	 JZOzjdQ+jlf0A==
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
Subject: [RFC PATCH 02/18] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
Date: Tue, 30 Jul 2024 14:46:56 +0800
Message-ID: <20240730064712.3714387-3-alexs@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Alex Shi <alexs@kernel.org>, Anup Patel <anup@brainfault.org>, Andreas Larsson <andreas@gaisler.com>, Hugh Dickins <hughd@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Zi Yan <ziy@nvidia.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Oscar Salvador <osalvador@suse.de>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alex Shi <alexs@kernel.org>

folio/page.pmd_huge_pte is a pointer to pagetable descriptor: pgtable_t.
In most arch, it is a typedef of 'struct page *'. But we have ptdesc now,
tt's better to convert it to right one: struct ptdesc pointer.

Different from others, s390/sparc use typedef 'pte_t *' as pgtable_t, so
they need different cost in their arch.

Thanks for lkp found the build issue for s390/sparc, it fixed now.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: Mike Rapoport  <rppt@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
---
 arch/s390/mm/pgtable.c   |  6 +++---
 arch/sparc/mm/tlb.c      |  6 +++---
 include/linux/mm_types.h |  4 ++--
 mm/pgtable-generic.c     | 16 ++++++++--------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 2c944bafb030..201d350abd1e 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -574,7 +574,7 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 		INIT_LIST_HEAD(lh);
 	else
 		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
+	pmd_huge_pte(mm, pmdp) = (struct ptdesc *)pgtable;
 }
 
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
@@ -586,12 +586,12 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
+	pgtable = (pte_t *)pmd_huge_pte(mm, pmdp);
 	lh = (struct list_head *) pgtable;
 	if (list_empty(lh))
 		pmd_huge_pte(mm, pmdp) = NULL;
 	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
+		pmd_huge_pte(mm, pmdp) = (struct ptdesc *) lh->next;
 		list_del(lh);
 	}
 	ptep = (pte_t *) pgtable;
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 8648a50afe88..903825b4c997 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -278,7 +278,7 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 		INIT_LIST_HEAD(lh);
 	else
 		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
+	pmd_huge_pte(mm, pmdp) = (struct ptdesc *)pgtable;
 }
 
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
@@ -289,12 +289,12 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 	assert_spin_locked(&mm->page_table_lock);
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
+	pgtable = (pte_t *)pmd_huge_pte(mm, pmdp);
 	lh = (struct list_head *) pgtable;
 	if (list_empty(lh))
 		pmd_huge_pte(mm, pmdp) = NULL;
 	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
+		pmd_huge_pte(mm, pmdp) = (struct ptdesc *) lh->next;
 		list_del(lh);
 	}
 	pte_val(pgtable[0]) = 0;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 485424979254..2e3eddf6edc9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -462,7 +462,7 @@ struct ptdesc {
 		struct list_head pt_list;
 		struct {
 			unsigned long _pt_pad_1;
-			pgtable_t pmd_huge_pte;
+			struct ptdesc *pmd_huge_pte;
 		};
 	};
 	unsigned long __page_mapping;
@@ -948,7 +948,7 @@ struct mm_struct {
 		struct mmu_notifier_subscriptions *notifier_subscriptions;
 #endif
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
-		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
+		struct ptdesc *pmd_huge_pte; /* protected by page_table_lock */
 #endif
 #ifdef CONFIG_NUMA_BALANCING
 		/*
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 2ce714f1dd15..f34a8d115f5b 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -171,8 +171,8 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 	if (!pmd_huge_pte(mm, pmdp))
 		INIT_LIST_HEAD(&pgtable->lru);
 	else
-		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->lru);
-	pmd_huge_pte(mm, pmdp) = pgtable;
+		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->pt_list);
+	pmd_huge_pte(mm, pmdp) = page_ptdesc(pgtable);
 }
 #endif
 
@@ -180,17 +180,17 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 /* no "address" argument so destroys page coloring of some arch */
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 {
-	pgtable_t pgtable;
+	struct ptdesc *ptdesc;
 
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
-	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&pgtable->lru,
-							  struct page, lru);
+	ptdesc = pmd_huge_pte(mm, pmdp);
+	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&ptdesc->pt_list,
+							  struct ptdesc, pt_list);
 	if (pmd_huge_pte(mm, pmdp))
-		list_del(&pgtable->lru);
-	return pgtable;
+		list_del(&ptdesc->pt_list);
+	return ptdesc_page(ptdesc);
 }
 #endif
 
-- 
2.43.0

