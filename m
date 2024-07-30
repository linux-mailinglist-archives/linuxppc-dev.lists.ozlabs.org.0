Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A54940F67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:32:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XU5gA41f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBPV5Xc1z30Ss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XU5gA41f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5Lt1d0pz3cb0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:44:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24D1F61DB8;
	Tue, 30 Jul 2024 06:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03182C32782;
	Tue, 30 Jul 2024 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321891;
	bh=DVj1dF/3LIG4QvumgddsFqj1lx0SQkF4MqPzNl7vGkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XU5gA41fGeeGuG84jrc0u9UbdT/1OsrKiK6gQ3j2Dsfzspr/VFoGGY+9jRktUTxPK
	 eCGcueThv1EkrEWTBCdEOfYYfg98cNkh9aL9IF5PQmYQLJsXHenG6BTEDfpnx4HRTt
	 TG8HbzuCVQ0Yi4yCrfqsrt0bVyQPCbBoH3u3b1xRrZCKzGXrJd+WVkan/f/ggLnn2L
	 OAxW9p4eTi5ixJZtACGTpHef4YO3O2bTkOma9P1V+YtTDRQRofXG8ycaO2YYLPUoLA
	 G8KSSn7XyBfjWFhT9lu+2dLE6tceUhkIIcFz3EtYj5naYaEqlGB/vOaIaJXYdxgv9q
	 dGnAH3je2sPvA==
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
Subject: [RFC PATCH 09/18] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
Date: Tue, 30 Jul 2024 14:47:03 +0800
Message-ID: <20240730064712.3714387-10-alexs@kernel.org>
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
Cc: nvdimm@lists.linux.dev, Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Sam Ravnborg <sam@ravnborg.org>, Alex Shi <alexs@kernel.org>, Anup Patel <anup@brainfault.org>, Hugh Dickins <hughd@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jason Gunthorpe <jgg@ziepe.ca>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Dawei Li <dawei.li@shingroup.cn>, Alexander Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Oscar Salvador <osalvador@suse.de>, Chris Zankel <chris@zankel.net>, Christian Brauner <brauner@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alex Shi <alexs@kernel.org>

Replace pgtable_t and struct page by ptdesc in pte_alloc_one series
functions.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Dawei Li <dawei.li@shingroup.cn>
Cc: Vishal Moola  <vishal.moola@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: David S. Miller <davem@davemloft.net>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Breno Leitao <leitao@debian.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mike Rapoport  <rppt@kernel.org>
Cc: Hugh Dickins <hughd@google.com>
---
 arch/arm/include/asm/pgalloc.h      |  9 ++++-----
 arch/powerpc/include/asm/pgalloc.h  |  4 ++--
 arch/s390/include/asm/pgalloc.h     |  2 +-
 arch/sparc/include/asm/pgalloc_32.h |  2 +-
 arch/sparc/include/asm/pgalloc_64.h |  2 +-
 arch/sparc/mm/init_64.c             |  2 +-
 arch/sparc/mm/srmmu.c               |  4 ++--
 arch/x86/include/asm/pgalloc.h      |  2 +-
 arch/x86/mm/pgtable.c               |  2 +-
 arch/xtensa/include/asm/pgalloc.h   | 12 ++++++------
 fs/dax.c                            |  2 +-
 include/asm-generic/pgalloc.h       |  6 +++---
 mm/huge_memory.c                    |  8 ++++----
 mm/memory.c                         |  8 ++++----
 14 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index a17f01235c29..e8501a6c3336 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -91,16 +91,15 @@ pte_alloc_one_kernel(struct mm_struct *mm)
 #define PGTABLE_HIGHMEM 0
 #endif
 
-static inline pgtable_t
-pte_alloc_one(struct mm_struct *mm)
+static inline struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *pte;
+	struct ptdesc *pte;
 
 	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
 	if (!pte)
 		return NULL;
-	if (!PageHighMem(pte))
-		clean_pte_table(page_address(pte));
+	if (!PageHighMem(ptdesc_page(pte)))
+		clean_pte_table(ptdesc_address(pte));
 	return pte;
 }
 
diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
index 3a971e2a8c73..37512f344b37 100644
--- a/arch/powerpc/include/asm/pgalloc.h
+++ b/arch/powerpc/include/asm/pgalloc.h
@@ -27,9 +27,9 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	return (pte_t *)pte_fragment_alloc(mm, 1);
 }
 
-static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
+static inline struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
-	return (pgtable_t)pte_fragment_alloc(mm, 0);
+	return (struct ptdesc *)pte_fragment_alloc(mm, 0);
 }
 
 void pte_frag_destroy(void *pte_frag);
diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 7b84ef6dc4b6..771494526f6e 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -137,7 +137,7 @@ static inline void pmd_populate(struct mm_struct *mm,
  * page table entry allocation/free routines.
  */
 #define pte_alloc_one_kernel(mm) ((pte_t *)page_table_alloc(mm))
-#define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
+#define pte_alloc_one(mm) ((struct ptdesc *)page_table_alloc(mm))
 
 #define pte_free_kernel(mm, pte) page_table_free(mm, (unsigned long *) pte)
 #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
diff --git a/arch/sparc/include/asm/pgalloc_32.h b/arch/sparc/include/asm/pgalloc_32.h
index 4f73e87b22a3..bc3ef54d9564 100644
--- a/arch/sparc/include/asm/pgalloc_32.h
+++ b/arch/sparc/include/asm/pgalloc_32.h
@@ -55,7 +55,7 @@ static inline void free_pmd_fast(pmd_t * pmd)
 void pmd_set(pmd_t *pmdp, pte_t *ptep);
 #define pmd_populate_kernel		pmd_populate
 
-pgtable_t pte_alloc_one(struct mm_struct *mm);
+struct ptdesc *pte_alloc_one(struct mm_struct *mm);
 
 static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
diff --git a/arch/sparc/include/asm/pgalloc_64.h b/arch/sparc/include/asm/pgalloc_64.h
index caa7632be4c2..285aa7958912 100644
--- a/arch/sparc/include/asm/pgalloc_64.h
+++ b/arch/sparc/include/asm/pgalloc_64.h
@@ -61,7 +61,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 }
 
 pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
-pgtable_t pte_alloc_one(struct mm_struct *mm);
+struct ptdesc *pte_alloc_one(struct mm_struct *mm);
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte);
 void pte_free(struct mm_struct *mm, pgtable_t ptepage);
 
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 53d7cb5bbffe..e1b33f996469 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2900,7 +2900,7 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	return pte;
 }
 
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
 
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9df51a62333d..60bb8628bb1f 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -346,7 +346,7 @@ pgd_t *get_pgd_fast(void)
  * Alignments up to the page size are the same for physical and virtual
  * addresses of the nocache area.
  */
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
 	pte_t *ptep;
 	struct page *page;
@@ -362,7 +362,7 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 	}
 	spin_unlock(&mm->page_table_lock);
 
-	return ptep;
+	return (struct ptdesc *)ptep;
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t ptep)
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index dcd836b59beb..497c757b5b98 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -51,7 +51,7 @@ extern gfp_t __userpte_alloc_gfp;
 extern pgd_t *pgd_alloc(struct mm_struct *);
 extern void pgd_free(struct mm_struct *mm, pgd_t *pgd);
 
-extern pgtable_t pte_alloc_one(struct mm_struct *);
+extern struct ptdesc *pte_alloc_one(struct mm_struct *);
 
 extern void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte);
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 93e54ba91fbf..c27d15cd01b9 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -28,7 +28,7 @@ void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 
 gfp_t __userpte_alloc_gfp = GFP_PGTABLE_USER | PGTABLE_HIGHMEM;
 
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
 	return __pte_alloc_one(mm, __userpte_alloc_gfp);
 }
diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
index 7fc0f9126dd3..a9206c02956e 100644
--- a/arch/xtensa/include/asm/pgalloc.h
+++ b/arch/xtensa/include/asm/pgalloc.h
@@ -51,15 +51,15 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	return ptep;
 }
 
-static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
+static inline struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
-	if (!page)
+	ptdesc = __pte_alloc_one(mm, GFP_PGTABLE_USER);
+	if (!ptdesc)
 		return NULL;
-	ptes_clear(page_address(page));
-	return page;
+	ptes_clear(ptdesc_address(ptdesc));
+	return ptdesc;
 }
 
 #endif /* CONFIG_MMU */
diff --git a/fs/dax.c b/fs/dax.c
index 6f7cea248206..51cbc08b22e7 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1222,7 +1222,7 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 				  DAX_PMD | DAX_ZERO_PAGE);
 
 	if (arch_needs_pgtable_deposit()) {
-		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		ptdesc = pte_alloc_one(vma->vm_mm);
 		if (!ptdesc)
 			return VM_FAULT_OOM;
 	}
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 7c48f5fbf8aa..1a4070f8d5dd 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -63,7 +63,7 @@ static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
  *
  * Return: `struct page` referencing the ptdesc or %NULL on error
  */
-static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
+static inline struct ptdesc *__pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
 {
 	struct ptdesc *ptdesc;
 
@@ -75,7 +75,7 @@ static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
 		return NULL;
 	}
 
-	return ptdesc_page(ptdesc);
+	return ptdesc;
 }
 #define __pte_alloc_one(...)	alloc_hooks(__pte_alloc_one_noprof(__VA_ARGS__))
 
@@ -88,7 +88,7 @@ static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
  *
  * Return: `struct page` referencing the ptdesc or %NULL on error
  */
-static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
+static inline struct ptdesc *pte_alloc_one_noprof(struct mm_struct *mm)
 {
 	return __pte_alloc_one_noprof(mm, GFP_PGTABLE_USER);
 }
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 236e1582d97e..6274eb7559ac 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -959,7 +959,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 	}
 	folio_throttle_swaprate(folio, gfp);
 
-	ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+	ptdesc = pte_alloc_one(vma->vm_mm);
 	if (unlikely(!ptdesc)) {
 		ret = VM_FAULT_OOM;
 		goto release;
@@ -1091,7 +1091,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 		struct folio *zero_folio;
 		vm_fault_t ret;
 
-		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		ptdesc = pte_alloc_one(vma->vm_mm);
 		if (unlikely(!ptdesc))
 			return VM_FAULT_OOM;
 		zero_folio = mm_get_huge_zero_folio(vma->vm_mm);
@@ -1213,7 +1213,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 		return VM_FAULT_SIGBUS;
 
 	if (arch_needs_pgtable_deposit()) {
-		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		ptdesc = pte_alloc_one(vma->vm_mm);
 		if (!ptdesc)
 			return VM_FAULT_OOM;
 	}
@@ -1376,7 +1376,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (!vma_is_anonymous(dst_vma))
 		return 0;
 
-	ptdesc = page_ptdesc(pte_alloc_one(dst_mm));
+	ptdesc = pte_alloc_one(dst_mm);
 	if (unlikely(!ptdesc))
 		goto out;
 
diff --git a/mm/memory.c b/mm/memory.c
index 5b01d94a0b5f..37529e0a9ce2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -445,7 +445,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
 
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte_alloc_one(mm));
+	struct ptdesc *ptdesc = pte_alloc_one(mm);
 	if (!ptdesc)
 		return -ENOMEM;
 
@@ -4647,7 +4647,7 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
 	 *				# flush A, B to clear the writeback
 	 */
 	if (pmd_none(*vmf->pmd) && !vmf->prealloc_pte) {
-		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
+		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
@@ -4725,7 +4725,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
 	 * related to pte entry. Use the preallocated table for that.
 	 */
 	if (arch_needs_pgtable_deposit() && !vmf->prealloc_pte) {
-		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
+		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
@@ -5010,7 +5010,7 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
 		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
 
 	if (pmd_none(*vmf->pmd)) {
-		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
+		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
-- 
2.43.0

