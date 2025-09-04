Return-Path: <linuxppc-dev+bounces-11729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED21B43C42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 14:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgV5qQGz30QJ;
	Thu,  4 Sep 2025 22:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756990742;
	cv=none; b=J7yZ9dOPIT8ZDSAv/XnwS64TTLjbmxk6qcRhtakEDufXytzfKhpl8QOJmYGtUSAUPfv9Af+qWFZNgzIc0GAaOR4ujkBPyO0Iib+N3ledeEeGJ0xAjSyc1EgLtq8gsGXU03w+tGwOdR3GaVEcvEXl29hEBHgKVplW0bgiLumXUueeLsjIz2O0zMElvCjzXlr94W2swVSi+yyK6lxL/XNzJzFsWJK/MyzobUeyougUHPfi9mslbwN0b4/RqfrprPLFBcfIuuG3r2KJox3+7yXLS+ncAEBSFDAm82FwomP8ysRZvZ48ygfltUPCGujXGDlEWWCgsGgJYVzFfbNB1PyurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756990742; c=relaxed/relaxed;
	bh=iLyBpsFFnp2zstxSd/cnUeW2BSZCQyrhzKMETJi9WaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjGEFrMqKPtoEVOPAUWHxTspMvyO3Dbi79lPVOdhG+QB3z4TXobTke5MWmhgncWsvF5F5olgRCAzJYCQnCG5eaXaEJ23IVVSiVtdDNxxX0VF74fFz8GzLSYScpQkSjO9UmwqvLyoaQRuOGJ852mcZ6P14vuT6BKDXqgM/bmtdXTULih7hTC4CxMdyRAPk50+d4JmZPBvfCpEmROU2bKtar3s9JHwSzQbdSVmNgy6lluLP/CGzYYmOSQCDosj0KA1uozTHqYylR2Od4Ozup/JcuiLF9Mwn3oi7kDBJCO2hiQqd6yyFEXcgNGYlHD9ZxKc4cx/Uu0eOs5ZPBGJwVtKdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgT5Kv4z305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 22:59:01 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6E82E98;
	Thu,  4 Sep 2025 05:58:22 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7653F6A8;
	Thu,  4 Sep 2025 05:58:26 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Date: Thu,  4 Sep 2025 13:57:31 +0100
Message-ID: <20250904125736.3918646-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
(taking and returning no value). This is proving problematic in
situations where leave() needs to restore some context back to its
original state (before enter() was called). In particular, this
makes it difficult to support the nesting of lazy_mmu sections -
leave() does not know whether the matching enter() call occurred
while lazy_mmu was already enabled, and whether to disable it or
not.

This patch gives all architectures the chance to store local state
while inside a lazy_mmu section by making enter() return some value,
storing it in a local variable, and having leave() take that value.
That value is typed lazy_mmu_state_t - each architecture defining
__HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
For now we define it as int everywhere, which is sufficient to
support nesting.

The diff is unfortunately rather large as all the API changes need
to be done atomically. Main parts:

* Changing the prototypes of arch_{enter,leave}_lazy_mmu_mode()
  in generic and arch code, and introducing lazy_mmu_state_t.

* Introducing LAZY_MMU_{DEFAULT,NESTED} for future support of
  nesting. enter() always returns LAZY_MMU_DEFAULT for now.
  (linux/mm_types.h is not the most natural location for defining
  those constants, but there is no other obvious header that is
  accessible where arch's implement the helpers.)

* Changing all lazy_mmu sections to introduce a lazy_mmu_state
  local variable, having enter() set it and leave() take it. Most of
  these changes were generated using the Coccinelle script below.

@@
@@
{
+ lazy_mmu_state_t lazy_mmu_state;
...
- arch_enter_lazy_mmu_mode();
+ lazy_mmu_state = arch_enter_lazy_mmu_mode();
...
- arch_leave_lazy_mmu_mode();
+ arch_leave_lazy_mmu_mode(lazy_mmu_state);
...
}

Note: it is difficult to provide a default definition of
lazy_mmu_state_t for architectures implementing lazy_mmu, because
that definition would need to be available in
arch/x86/include/asm/paravirt_types.h and adding a new generic
 #include there is very tricky due to the existing header soup.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h              | 10 +++++++---
 .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
 arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
 arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
 arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
 arch/sparc/mm/tlb.c                           |  6 ++++--
 arch/x86/include/asm/paravirt.h               |  6 ++++--
 arch/x86/include/asm/paravirt_types.h         |  2 ++
 arch/x86/xen/enlighten_pv.c                   |  2 +-
 arch/x86/xen/mmu_pv.c                         |  2 +-
 fs/proc/task_mmu.c                            |  5 +++--
 include/linux/mm_types.h                      |  3 +++
 include/linux/pgtable.h                       |  6 ++++--
 mm/madvise.c                                  | 20 ++++++++++---------
 mm/memory.c                                   | 20 +++++++++++--------
 mm/migrate_device.c                           |  5 +++--
 mm/mprotect.c                                 |  5 +++--
 mm/mremap.c                                   |  5 +++--
 mm/vmalloc.c                                  | 15 ++++++++------
 mm/vmscan.c                                   | 15 ++++++++------
 20 files changed, 97 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 728d7b6ed20a..816197d08165 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -81,7 +81,9 @@ static inline void queue_pte_barriers(void)
 }
 
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-static inline void arch_enter_lazy_mmu_mode(void)
+typedef int lazy_mmu_state_t;
+
+static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	/*
 	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
@@ -96,12 +98,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	 */
 
 	if (in_interrupt())
-		return;
+		return LAZY_MMU_DEFAULT;
 
 	set_thread_flag(TIF_LAZY_MMU);
+
+	return LAZY_MMU_DEFAULT;
 }
 
-static inline void arch_leave_lazy_mmu_mode(void)
+static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
 	if (in_interrupt())
 		return;
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 176d7fd79eeb..c9f1e819e567 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -25,13 +25,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
 #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
+typedef int lazy_mmu_state_t;
 
-static inline void arch_enter_lazy_mmu_mode(void)
+static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
 
 	if (radix_enabled())
-		return;
+		return LAZY_MMU_DEFAULT;
 	/*
 	 * apply_to_page_range can call us this preempt enabled when
 	 * operating on kernel page tables.
@@ -39,9 +40,11 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	batch->active = 1;
+
+	return LAZY_MMU_DEFAULT;
 }
 
-static inline void arch_leave_lazy_mmu_mode(void)
+static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
 	struct ppc64_tlb_batch *batch;
 
diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index 21fcad97ae80..ee664f88e679 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -189,6 +189,7 @@ void hash__tlb_flush(struct mmu_gather *tlb)
  */
 void __flush_hash_table_range(unsigned long start, unsigned long end)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	int hugepage_shift;
 	unsigned long flags;
 
@@ -205,7 +206,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
 	 * way to do things but is fine for our needs here.
 	 */
 	local_irq_save(flags);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	for (; start < end; start += PAGE_SIZE) {
 		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
 		unsigned long pte;
@@ -217,12 +218,13 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
 			continue;
 		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
 	}
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	local_irq_restore(flags);
 }
 
 void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte;
 	pte_t *start_pte;
 	unsigned long flags;
@@ -237,7 +239,7 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
 	 * way to do things but is fine for our needs here.
 	 */
 	local_irq_save(flags);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	start_pte = pte_offset_map(pmd, addr);
 	if (!start_pte)
 		goto out;
@@ -249,6 +251,6 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
 	}
 	pte_unmap(start_pte);
 out:
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	local_irq_restore(flags);
 }
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index ec98e526167e..4720f9f321af 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -53,6 +53,7 @@ void subpage_prot_free(struct mm_struct *mm)
 static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 			     int npages)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pgd_t *pgd;
 	p4d_t *p4d;
 	pud_t *pud;
@@ -73,13 +74,13 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	for (; npages > 0; --npages) {
 		pte_update(mm, addr, pte, 0, 0, 0);
 		addr += PAGE_SIZE;
 		++pte;
 	}
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(pte - 1, ptl);
 }
 
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index cd144eb31bdd..02c93a4e6af5 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -40,10 +40,11 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
 #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
+typedef int lazy_mmu_state_t;
 
 void flush_tlb_pending(void);
-void arch_enter_lazy_mmu_mode(void);
-void arch_leave_lazy_mmu_mode(void);
+lazy_mmu_state_t arch_enter_lazy_mmu_mode(void);
+void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state);
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..bf5094b770af 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -50,16 +50,18 @@ void flush_tlb_pending(void)
 	put_cpu_var(tlb_batch);
 }
 
-void arch_enter_lazy_mmu_mode(void)
+lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb;
 
 	preempt_disable();
 	tb = this_cpu_ptr(&tlb_batch);
 	tb->active = 1;
+
+	return LAZY_MMU_DEFAULT;
 }
 
-void arch_leave_lazy_mmu_mode(void)
+void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
 	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..65a0d394fba1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -527,12 +527,14 @@ static inline void arch_end_context_switch(struct task_struct *next)
 }
 
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-static inline void arch_enter_lazy_mmu_mode(void)
+static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	PVOP_VCALL0(mmu.lazy_mode.enter);
+
+	return LAZY_MMU_DEFAULT;
 }
 
-static inline void arch_leave_lazy_mmu_mode(void)
+static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
 	PVOP_VCALL0(mmu.lazy_mode.leave);
 }
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 37a8627d8277..bc1af86868a3 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -41,6 +41,8 @@ struct pv_info {
 };
 
 #ifdef CONFIG_PARAVIRT_XXL
+typedef int lazy_mmu_state_t;
+
 struct pv_lazy_ops {
 	/* Set deferred update mode, used for batching operations. */
 	void (*enter)(void);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 26bbaf4b7330..a245ba47a631 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -426,7 +426,7 @@ static void xen_start_context_switch(struct task_struct *prev)
 	BUG_ON(preemptible());
 
 	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
-		arch_leave_lazy_mmu_mode();
+		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
 		set_ti_thread_flag(task_thread_info(prev), TIF_LAZY_MMU_UPDATES);
 	}
 	enter_lazy(XEN_LAZY_CPU);
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2a4a8deaf612..2039d5132ca3 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2140,7 +2140,7 @@ static void xen_flush_lazy_mmu(void)
 	preempt_disable();
 
 	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
-		arch_leave_lazy_mmu_mode();
+		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
 		arch_enter_lazy_mmu_mode();
 	}
 
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 29cca0e6d0ff..c9bf1128a4cd 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2610,6 +2610,7 @@ static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
 static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 				  unsigned long end, struct mm_walk *walk)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	struct pagemap_scan_private *p = walk->private;
 	struct vm_area_struct *vma = walk->vma;
 	unsigned long addr, flush_end = 0;
@@ -2628,7 +2629,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 		return 0;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
@@ -2698,7 +2699,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(start_pte, ptl);
 
 	cond_resched();
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 08bc2442db93..18745c32f2c0 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1441,6 +1441,9 @@ extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
 extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
 extern void tlb_finish_mmu(struct mmu_gather *tlb);
 
+#define LAZY_MMU_DEFAULT	0
+#define LAZY_MMU_NESTED		1
+
 struct vm_fault;
 
 /**
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8848e132a6be..6932c8e344ab 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -232,8 +232,10 @@ static inline int pmd_dirty(pmd_t pmd)
  * and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-#define arch_enter_lazy_mmu_mode()	do {} while (0)
-#define arch_leave_lazy_mmu_mode()	do {} while (0)
+typedef int lazy_mmu_state_t;
+
+#define arch_enter_lazy_mmu_mode()	(LAZY_MMU_DEFAULT)
+#define arch_leave_lazy_mmu_mode(state)	((void)(state))
 #endif
 
 #ifndef pte_batch_hint
diff --git a/mm/madvise.c b/mm/madvise.c
index 35ed4ab0d7c5..72c032f2cf56 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -357,6 +357,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				unsigned long addr, unsigned long end,
 				struct mm_walk *walk)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	struct madvise_walk_private *private = walk->private;
 	struct mmu_gather *tlb = private->tlb;
 	bool pageout = private->pageout;
@@ -455,7 +456,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -463,7 +464,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		if (++batch_count == SWAP_CLUSTER_MAX) {
 			batch_count = 0;
 			if (need_resched()) {
-				arch_leave_lazy_mmu_mode();
+				arch_leave_lazy_mmu_mode(lazy_mmu_state);
 				pte_unmap_unlock(start_pte, ptl);
 				cond_resched();
 				goto restart;
@@ -499,7 +500,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				if (!folio_trylock(folio))
 					continue;
 				folio_get(folio);
-				arch_leave_lazy_mmu_mode();
+				arch_leave_lazy_mmu_mode(lazy_mmu_state);
 				pte_unmap_unlock(start_pte, ptl);
 				start_pte = NULL;
 				err = split_folio(folio);
@@ -510,7 +511,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				lazy_mmu_state = arch_enter_lazy_mmu_mode();
 				if (!err)
 					nr = 0;
 				continue;
@@ -558,7 +559,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 	}
 
 	if (start_pte) {
-		arch_leave_lazy_mmu_mode();
+		arch_leave_lazy_mmu_mode(lazy_mmu_state);
 		pte_unmap_unlock(start_pte, ptl);
 	}
 	if (pageout)
@@ -657,6 +658,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 
 {
 	const cydp_t cydp_flags = CYDP_CLEAR_YOUNG | CYDP_CLEAR_DIRTY;
+	lazy_mmu_state_t lazy_mmu_state;
 	struct mmu_gather *tlb = walk->private;
 	struct mm_struct *mm = tlb->mm;
 	struct vm_area_struct *vma = walk->vma;
@@ -677,7 +679,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -727,7 +729,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				if (!folio_trylock(folio))
 					continue;
 				folio_get(folio);
-				arch_leave_lazy_mmu_mode();
+				arch_leave_lazy_mmu_mode(lazy_mmu_state);
 				pte_unmap_unlock(start_pte, ptl);
 				start_pte = NULL;
 				err = split_folio(folio);
@@ -738,7 +740,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				lazy_mmu_state = arch_enter_lazy_mmu_mode();
 				if (!err)
 					nr = 0;
 				continue;
@@ -778,7 +780,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	if (nr_swap)
 		add_mm_counter(mm, MM_SWAPENTS, nr_swap);
 	if (start_pte) {
-		arch_leave_lazy_mmu_mode();
+		arch_leave_lazy_mmu_mode(lazy_mmu_state);
 		pte_unmap_unlock(start_pte, ptl);
 	}
 	cond_resched();
diff --git a/mm/memory.c b/mm/memory.c
index 0ba4f6b71847..ebe0ffddcb77 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1079,6 +1079,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	       pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
 	       unsigned long end)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	struct mm_struct *dst_mm = dst_vma->vm_mm;
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
@@ -1126,7 +1127,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
 	orig_src_pte = src_pte;
 	orig_dst_pte = dst_pte;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	do {
 		nr = 1;
@@ -1195,7 +1196,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
 		 addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(orig_src_pte, src_ptl);
 	add_mm_rss_vec(dst_mm, rss);
 	pte_unmap_unlock(orig_dst_pte, dst_ptl);
@@ -1694,6 +1695,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 				unsigned long addr, unsigned long end,
 				struct zap_details *details)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	bool force_flush = false, force_break = false;
 	struct mm_struct *mm = tlb->mm;
 	int rss[NR_MM_COUNTERS];
@@ -1714,7 +1716,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		return addr;
 
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	do {
 		bool any_skipped = false;
 
@@ -1746,7 +1748,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
 
 	add_mm_rss_vec(mm, rss);
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 
 	/* Do the actual TLB flush before dropping ptl */
 	if (force_flush) {
@@ -2683,6 +2685,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			unsigned long addr, unsigned long end,
 			unsigned long pfn, pgprot_t prot)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte, *mapped_pte;
 	spinlock_t *ptl;
 	int err = 0;
@@ -2690,7 +2693,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return -ENOMEM;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	do {
 		BUG_ON(!pte_none(ptep_get(pte)));
 		if (!pfn_modify_allowed(pfn, prot)) {
@@ -2700,7 +2703,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
 		pfn++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(mapped_pte, ptl);
 	return err;
 }
@@ -2989,6 +2992,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 				     pte_fn_t fn, void *data, bool create,
 				     pgtbl_mod_mask *mask)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte, *mapped_pte;
 	int err = 0;
 	spinlock_t *ptl;
@@ -3007,7 +3011,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			return -EINVAL;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	if (fn) {
 		do {
@@ -3020,7 +3024,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	}
 	*mask |= PGTBL_PTE_MODIFIED;
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e05e14d6eacd..659285c6ba77 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -59,6 +59,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long end,
 				   struct mm_walk *walk)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	struct migrate_vma *migrate = walk->private;
 	struct folio *fault_folio = migrate->fault_page ?
 		page_folio(migrate->fault_page) : NULL;
@@ -110,7 +111,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
 	if (!ptep)
 		goto again;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	for (; addr < end; addr += PAGE_SIZE, ptep++) {
 		struct dev_pagemap *pgmap;
@@ -287,7 +288,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(ptep - 1, ptl);
 
 	return 0;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 113b48985834..7bba651e5aa3 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -273,6 +273,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte, oldpte;
 	spinlock_t *ptl;
 	long pages = 0;
@@ -293,7 +294,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 		target_node = numa_node_id();
 
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 	do {
 		nr_ptes = 1;
 		oldpte = ptep_get(pte);
@@ -439,7 +440,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			}
 		}
 	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(pte - 1, ptl);
 
 	return pages;
diff --git a/mm/mremap.c b/mm/mremap.c
index e618a706aff5..dac29a734e16 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -193,6 +193,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
 static int move_ptes(struct pagetable_move_control *pmc,
 		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	struct vm_area_struct *vma = pmc->old;
 	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
@@ -256,7 +257,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
 		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
@@ -301,7 +302,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		}
 	}
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	if (force_flush)
 		flush_tlb_range(vma, old_end - len, old_end);
 	if (new_ptl != old_ptl)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..f901675dd060 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -95,6 +95,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
@@ -105,7 +106,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	do {
 		if (unlikely(!pte_none(ptep_get(pte)))) {
@@ -131,7 +132,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -354,12 +355,13 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
 static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	pte_t *pte;
 	pte_t ptent;
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	do {
 #ifdef CONFIG_HUGETLB_PAGE
@@ -378,7 +380,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
@@ -514,6 +516,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	int err = 0;
 	pte_t *pte;
 
@@ -526,7 +529,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	do {
 		struct page *page = pages[*nr];
@@ -548,7 +551,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		(*nr)++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	*mask |= PGTBL_PTE_MODIFIED;
 
 	return err;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index a48aec8bfd92..13b6657c8743 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3521,6 +3521,7 @@ static void walk_update_folio(struct lru_gen_mm_walk *walk, struct folio *folio,
 static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 			   struct mm_walk *args)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	int i;
 	bool dirty;
 	pte_t *pte;
@@ -3550,7 +3551,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
 		unsigned long pfn;
@@ -3591,7 +3592,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
 		goto restart;
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	pte_unmap_unlock(pte, ptl);
 
 	return suitable_to_scan(total, young);
@@ -3600,6 +3601,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
 				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	int i;
 	bool dirty;
 	pmd_t *pmd;
@@ -3632,7 +3634,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 	if (!spin_trylock(ptl))
 		goto done;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	do {
 		unsigned long pfn;
@@ -3679,7 +3681,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 
 	walk_update_folio(walk, last, gen, dirty);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 	spin_unlock(ptl);
 done:
 	*first = -1;
@@ -4227,6 +4229,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
  */
 bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 {
+	lazy_mmu_state_t lazy_mmu_state;
 	int i;
 	bool dirty;
 	unsigned long start;
@@ -4278,7 +4281,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		}
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_state = arch_enter_lazy_mmu_mode();
 
 	pte -= (addr - start) / PAGE_SIZE;
 
@@ -4312,7 +4315,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 
 	walk_update_folio(walk, last, gen, dirty);
 
-	arch_leave_lazy_mmu_mode();
+	arch_leave_lazy_mmu_mode(lazy_mmu_state);
 
 	/* feedback from rmap walkers to page table walkers */
 	if (mm_state && suitable_to_scan(i, young))
-- 
2.47.0


