Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0E846A73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 09:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7wS6KV6z86dB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 19:19:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7k71fNcz3vkx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 19:10:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B01B1C00;
	Fri,  2 Feb 2024 00:10:34 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F6B93F5A1;
	Fri,  2 Feb 2024 00:09:48 -0800 (PST)
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
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 25/25] arm64/mm: Automatically fold contpte mappings
Date: Fri,  2 Feb 2024 08:07:56 +0000
Message-Id: <20240202080756.1453939-26-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202080756.1453939-1-ryan.roberts@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
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

There are situations where a change to a single PTE could cause the
contpte block in which it resides to become foldable (i.e. could be
repainted with the contiguous bit). Such situations arise, for example,
when user space temporarily changes protections, via mprotect, for
individual pages, such can be the case for certain garbage collectors.

We would like to detect when such a PTE change occurs. However this can
be expensive due to the amount of checking required. Therefore only
perform the checks when an indiviual PTE is modified via mprotect
(ptep_modify_prot_commit() -> set_pte_at() -> set_ptes(nr=1)) and only
when we are setting the final PTE in a contpte-aligned block.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 26 +++++++++++++
 arch/arm64/mm/contpte.c          | 64 ++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index cdc310880a3b..d3357fe4eb89 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1192,6 +1192,8 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
  * where it is possible and makes sense to do so. The PTE_CONT bit is considered
  * a private implementation detail of the public ptep API (see below).
  */
+extern void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte);
 extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte);
 extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
@@ -1213,6 +1215,29 @@ extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep,
 				pte_t entry, int dirty);
 
+static __always_inline void contpte_try_fold(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	/*
+	 * Only bother trying if both the virtual and physical addresses are
+	 * aligned and correspond to the last entry in a contig range. The core
+	 * code mostly modifies ranges from low to high, so this is the likely
+	 * the last modification in the contig range, so a good time to fold.
+	 * We can't fold special mappings, because there is no associated folio.
+	 */
+
+	const unsigned long contmask = CONT_PTES - 1;
+	bool valign = ((addr >> PAGE_SHIFT) & contmask) == contmask;
+
+	if (unlikely(valign)) {
+		bool palign = (pte_pfn(pte) & contmask) == contmask;
+
+		if (unlikely(palign &&
+		    pte_valid(pte) && !pte_cont(pte) && !pte_special(pte)))
+			__contpte_try_fold(mm, addr, ptep, pte);
+	}
+}
+
 static __always_inline void contpte_try_unfold(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep, pte_t pte)
 {
@@ -1287,6 +1312,7 @@ static __always_inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 	if (likely(nr == 1)) {
 		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
 		__set_ptes(mm, addr, ptep, pte, 1);
+		contpte_try_fold(mm, addr, ptep, pte);
 	} else {
 		contpte_set_ptes(mm, addr, ptep, pte, nr);
 	}
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 80346108450b..2c7dafd0552a 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -67,6 +67,70 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
 }
 
+void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
+			pte_t *ptep, pte_t pte)
+{
+	/*
+	 * We have already checked that the virtual and pysical addresses are
+	 * correctly aligned for a contpte mapping in contpte_try_fold() so the
+	 * remaining checks are to ensure that the contpte range is fully
+	 * covered by a single folio, and ensure that all the ptes are valid
+	 * with contiguous PFNs and matching prots. We ignore the state of the
+	 * access and dirty bits for the purpose of deciding if its a contiguous
+	 * range; the folding process will generate a single contpte entry which
+	 * has a single access and dirty bit. Those 2 bits are the logical OR of
+	 * their respective bits in the constituent pte entries. In order to
+	 * ensure the contpte range is covered by a single folio, we must
+	 * recover the folio from the pfn, but special mappings don't have a
+	 * folio backing them. Fortunately contpte_try_fold() already checked
+	 * that the pte is not special - we never try to fold special mappings.
+	 * Note we can't use vm_normal_page() for this since we don't have the
+	 * vma.
+	 */
+
+	unsigned long folio_saddr, folio_eaddr;
+	unsigned long cont_saddr, cont_eaddr;
+	pte_t expected_pte, subpte;
+	struct folio *folio;
+	struct page *page;
+	unsigned long pfn;
+	pte_t *orig_ptep;
+	pgprot_t prot;
+
+	int i;
+
+	if (!mm_is_user(mm))
+		return;
+
+	page = pte_page(pte);
+	folio = page_folio(page);
+	folio_saddr = addr - (page - &folio->page) * PAGE_SIZE;
+	folio_eaddr = folio_saddr + folio_nr_pages(folio) * PAGE_SIZE;
+	cont_saddr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+	cont_eaddr = cont_saddr + CONT_PTE_SIZE;
+
+	if (folio_saddr > cont_saddr || folio_eaddr < cont_eaddr)
+		return;
+
+	pfn = pte_pfn(pte) - ((addr - cont_saddr) >> PAGE_SHIFT);
+	prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+	expected_pte = pfn_pte(pfn, prot);
+	orig_ptep = ptep;
+	ptep = contpte_align_down(ptep);
+
+	for (i = 0; i < CONT_PTES; i++) {
+		subpte = pte_mkold(pte_mkclean(__ptep_get(ptep)));
+		if (!pte_same(subpte, expected_pte))
+			return;
+		expected_pte = pte_advance_pfn(expected_pte, 1);
+		ptep++;
+	}
+
+	pte = pte_mkcont(pte);
+	contpte_convert(mm, addr, orig_ptep, pte);
+}
+EXPORT_SYMBOL(__contpte_try_fold);
+
 void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			pte_t *ptep, pte_t pte)
 {
-- 
2.25.1

