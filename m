Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159F846A50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 09:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7qB2mKGz3wWl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 19:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7j710lpz3dVB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 19:09:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ED401A2D;
	Fri,  2 Feb 2024 00:09:40 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2CAC3F5A1;
	Fri,  2 Feb 2024 00:08:54 -0800 (PST)
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
Subject: [PATCH v5 11/25] arm64/mm: pte_clear(): New layer to manage contig bit
Date: Fri,  2 Feb 2024 08:07:42 +0000
Message-Id: <20240202080756.1453939-12-ryan.roberts@arm.com>
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

Create a new layer for the in-table PTE manipulation APIs. For now, The
existing API is prefixed with double underscore to become the
arch-private API and the public API is just a simple wrapper that calls
the private API.

The public API implementation will subsequently be used to transparently
manipulate the contiguous bit where appropriate. But since there are
already some contig-aware users (e.g. hugetlb, kernel mapper), we must
first ensure those users use the private API directly so that the future
contig-bit manipulations in the public API do not interfere with those
existing uses.

Tested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 3 ++-
 arch/arm64/mm/fixmap.c           | 2 +-
 arch/arm64/mm/hugetlbpage.c      | 2 +-
 arch/arm64/mm/mmu.c              | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f1fd6c5e3eca..3b0ff58109c5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -93,7 +93,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
 #define pte_none(pte)		(!pte_val(pte))
-#define pte_clear(mm, addr, ptep) \
+#define __pte_clear(mm, addr, ptep) \
 				__set_pte(ptep, __pte(0))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
@@ -1140,6 +1140,7 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
 
 #define set_pte					__set_pte
 #define set_ptes				__set_ptes
+#define pte_clear				__pte_clear
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 51cd4501816d..bfc02568805a 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -123,7 +123,7 @@ void __set_fixmap(enum fixed_addresses idx,
 	if (pgprot_val(flags)) {
 		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
 	} else {
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
 	}
 }
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 9d7e7315eaa3..3d73b83cf97f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -400,7 +400,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	ncontig = num_contig_ptes(sz, &pgsize);
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
+		__pte_clear(mm, addr, ptep);
 }
 
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7cc1930f0e10..bcaa5a5d86f8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -859,7 +859,7 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 			continue;
 
 		WARN_ON(!pte_present(pte));
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 		if (free_mapped)
 			free_hotplug_page_range(pte_page(pte),
-- 
2.25.1

