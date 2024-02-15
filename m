Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC6855F7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:38:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBNd29Rdz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 21:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBHF2krpz3fQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 21:33:29 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A7A15A1;
	Thu, 15 Feb 2024 02:33:52 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17B8B3F7B4;
	Thu, 15 Feb 2024 02:33:07 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <21cnbao@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Yang Shi <shy828301@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 15/18] mm: Add pte_batch_hint() to reduce scanning in folio_pte_batch()
Date: Thu, 15 Feb 2024 10:32:02 +0000
Message-Id: <20240215103205.2607016-16-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240215103205.2607016-1-ryan.roberts@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures (e.g. arm64) can tell from looking at a pte, if some
follow-on ptes also map contiguous physical memory with the same pgprot.
(for arm64, these are contpte mappings).

Take advantage of this knowledge to optimize folio_pte_batch() so that
it can skip these ptes when scanning to create a batch. By default, if
an arch does not opt-in, folio_pte_batch() returns a compile-time 1, so
the changes are optimized out and the behaviour is as before.

arm64 will opt-in to providing this hint in the next patch, which will
greatly reduce the cost of ptep_get() when scanning a range of contptes.

Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h | 21 +++++++++++++++++++++
 mm/memory.c             | 19 ++++++++++++-------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index bc005d84f764..a36cf4e124b0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -212,6 +212,27 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif
 
+#ifndef pte_batch_hint
+/**
+ * pte_batch_hint - Number of pages that can be added to batch without scanning.
+ * @ptep: Page table pointer for the entry.
+ * @pte: Page table entry.
+ *
+ * Some architectures know that a set of contiguous ptes all map the same
+ * contiguous memory with the same permissions. In this case, it can provide a
+ * hint to aid pte batching without the core code needing to scan every pte.
+ *
+ * An architecture implementation may ignore the PTE accessed state. Further,
+ * the dirty state must apply atomically to all the PTEs described by the hint.
+ *
+ * May be overridden by the architecture, else pte_batch_hint is always 1.
+ */
+static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
+{
+	return 1;
+}
+#endif
+
 #ifndef pte_advance_pfn
 static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 {
diff --git a/mm/memory.c b/mm/memory.c
index 3b8e56eb08a3..4dd8e35b593a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -988,16 +988,20 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 {
 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
 	const pte_t *end_ptep = start_ptep + max_nr;
-	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte), flags);
-	pte_t *ptep = start_ptep + 1;
+	pte_t expected_pte, *ptep;
 	bool writable;
+	int nr;
 
 	if (any_writable)
 		*any_writable = false;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 
-	while (ptep != end_ptep) {
+	nr = pte_batch_hint(start_ptep, pte);
+	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
+	ptep = start_ptep + nr;
+
+	while (ptep < end_ptep) {
 		pte = ptep_get(ptep);
 		if (any_writable)
 			writable = !!pte_write(pte);
@@ -1011,17 +1015,18 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		 * corner cases the next PFN might fall into a different
 		 * folio.
 		 */
-		if (pte_pfn(pte) == folio_end_pfn)
+		if (pte_pfn(pte) >= folio_end_pfn)
 			break;
 
 		if (any_writable)
 			*any_writable |= writable;
 
-		expected_pte = pte_next_pfn(expected_pte);
-		ptep++;
+		nr = pte_batch_hint(ptep, pte);
+		expected_pte = pte_advance_pfn(expected_pte, nr);
+		ptep += nr;
 	}
 
-	return ptep - start_ptep;
+	return min(ptep - start_ptep, max_nr);
 }
 
 /*
-- 
2.25.1

