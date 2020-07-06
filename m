Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB64215146
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 05:01:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Vh74lsMzDqg5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 13:01:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B0VbS3VHlzDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 12:57:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9920230E;
 Sun,  5 Jul 2020 19:57:06 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.84.195])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 317043F71E;
 Sun,  5 Jul 2020 19:56:59 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V4 2/3] mm/sparsemem: Enable vmem_altmap support in
 vmemmap_alloc_block_buf()
Date: Mon,  6 Jul 2020 08:26:17 +0530
Message-Id: <1594004178-8861-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594004178-8861-1-git-send-email-anshuman.khandual@arm.com>
References: <1594004178-8861-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, justin.he@arm.com,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, akpm@linux-foundation.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many instances where vmemap allocation is often switched between
regular memory and device memory just based on whether altmap is available
or not. vmemmap_alloc_block_buf() is used in various platforms to allocate
vmemmap mappings. Lets also enable it to handle altmap based device memory
allocation along with existing regular memory allocations. This will help
in avoiding the altmap based allocation switch in many places. To summarize
there are two different methods to call vmemmap_alloc_block_buf().

vmemmap_alloc_block_buf(size, node, NULL)   /* Allocate from system RAM */
vmemmap_alloc_block_buf(size, node, altmap) /* Allocate from altmap */

This converts altmap_alloc_block_buf() into a static function, drops it's
entry from the header and updates Documentation/vm/memory-model.rst.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Jia He <justin.he@arm.com>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/vm/memory-model.rst |  2 +-
 arch/arm64/mm/mmu.c               |  2 +-
 arch/powerpc/mm/init_64.c         |  4 ++--
 arch/x86/mm/init_64.c             |  5 +----
 include/linux/mm.h                |  4 ++--
 mm/sparse-vmemmap.c               | 28 +++++++++++++---------------
 6 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/Documentation/vm/memory-model.rst b/Documentation/vm/memory-model.rst
index 91228044ed16..f26142cf24f2 100644
--- a/Documentation/vm/memory-model.rst
+++ b/Documentation/vm/memory-model.rst
@@ -178,7 +178,7 @@ for persistent memory devices in pre-allocated storage on those
 devices. This storage is represented with :c:type:`struct vmem_altmap`
 that is eventually passed to vmemmap_populate() through a long chain
 of function calls. The vmemmap_populate() implementation may use the
-`vmem_altmap` along with :c:func:`altmap_alloc_block_buf` helper to
+`vmem_altmap` along with :c:func:`vmemmap_alloc_block_buf` helper to
 allocate memory map on the persistent memory device.
 
 ZONE_DEVICE
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 63b74fd56cd8..9c08d1882106 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1101,7 +1101,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		if (pmd_none(READ_ONCE(*pmdp))) {
 			void *p = NULL;
 
-			p = vmemmap_alloc_block_buf(PMD_SIZE, node);
+			p = vmemmap_alloc_block_buf(PMD_SIZE, node, NULL);
 			if (!p)
 				return -ENOMEM;
 
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index bc73abf0bc25..3fd504d72c5e 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -225,12 +225,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		 * fall back to system memory if the altmap allocation fail.
 		 */
 		if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
-			p = altmap_alloc_block_buf(page_size, altmap);
+			p = vmemmap_alloc_block_buf(page_size, node, altmap);
 			if (!p)
 				pr_debug("altmap block allocation failed, falling back to system memory");
 		}
 		if (!p)
-			p = vmemmap_alloc_block_buf(page_size, node);
+			p = vmemmap_alloc_block_buf(page_size, node, NULL);
 		if (!p)
 			return -ENOMEM;
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 19c0ed3271a3..5a7a45e7c5ea 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1463,10 +1463,7 @@ static int __meminit vmemmap_populate_hugepages(unsigned long start,
 		if (pmd_none(*pmd)) {
 			void *p;
 
-			if (altmap)
-				p = altmap_alloc_block_buf(PMD_SIZE, altmap);
-			else
-				p = vmemmap_alloc_block_buf(PMD_SIZE, node);
+			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
 			if (p) {
 				pte_t entry;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e40ac543d248..1973872ed3ab 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3015,8 +3015,8 @@ pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
 			    struct vmem_altmap *altmap);
 void *vmemmap_alloc_block(unsigned long size, int node);
 struct vmem_altmap;
-void *vmemmap_alloc_block_buf(unsigned long size, int node);
-void *altmap_alloc_block_buf(unsigned long size, struct vmem_altmap *altmap);
+void *vmemmap_alloc_block_buf(unsigned long size, int node,
+			      struct vmem_altmap *altmap);
 void vmemmap_verify(pte_t *, int, unsigned long, unsigned long);
 int vmemmap_populate_basepages(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap);
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index ceed10dec31e..41eeac67723b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -69,11 +69,19 @@ void * __meminit vmemmap_alloc_block(unsigned long size, int node)
 				__pa(MAX_DMA_ADDRESS));
 }
 
+static void * __meminit altmap_alloc_block_buf(unsigned long size,
+					       struct vmem_altmap *altmap);
+
 /* need to make sure size is all the same during early stage */
-void * __meminit vmemmap_alloc_block_buf(unsigned long size, int node)
+void * __meminit vmemmap_alloc_block_buf(unsigned long size, int node,
+					 struct vmem_altmap *altmap)
 {
-	void *ptr = sparse_buffer_alloc(size);
+	void *ptr;
+
+	if (altmap)
+		return altmap_alloc_block_buf(size, altmap);
 
+	ptr = sparse_buffer_alloc(size);
 	if (!ptr)
 		ptr = vmemmap_alloc_block(size, node);
 	return ptr;
@@ -94,15 +102,8 @@ static unsigned long __meminit vmem_altmap_nr_free(struct vmem_altmap *altmap)
 	return 0;
 }
 
-/**
- * altmap_alloc_block_buf - allocate pages from the device page map
- * @altmap:	device page map
- * @size:	size (in bytes) of the allocation
- *
- * Allocations are aligned to the size of the request.
- */
-void * __meminit altmap_alloc_block_buf(unsigned long size,
-		struct vmem_altmap *altmap)
+static void * __meminit altmap_alloc_block_buf(unsigned long size,
+					       struct vmem_altmap *altmap)
 {
 	unsigned long pfn, nr_pfns, nr_align;
 
@@ -147,10 +148,7 @@ pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
 		pte_t entry;
 		void *p;
 
-		if (altmap)
-			p = altmap_alloc_block_buf(PAGE_SIZE, altmap);
-		else
-			p = vmemmap_alloc_block_buf(PAGE_SIZE, node);
+		p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 		if (!p)
 			return NULL;
 		entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
-- 
2.20.1

