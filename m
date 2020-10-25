Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CE298149
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 11:24:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJvGw4dXNzDr1N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 21:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=SR8LIdsy; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJv6035ylzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 21:17:12 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9F56222E7;
 Sun, 25 Oct 2020 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603621028;
 bh=fWqEsJtW6nrMdKfFuKO5wuXLJZv2B2YzQewNgbwL7B8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SR8LIdsytMJiBsEIqd/48utNGr6/cEpmB56s7maJKJDxF5jenH22OuAMSr1Hko8CU
 krTJIE6TiUnuurhqX6zq1fjGl9QemuQldFXoP8JOAjlu5EQH1SEazXj1Hf97EJNSiy
 cUpUrE2Dxdv7Jv0a4uIe0NxGHiXi4NtFQFLEtB4w=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/4] arch, mm: make kernel_page_present() always available
Date: Sun, 25 Oct 2020 12:15:55 +0200
Message-Id: <20201025101555.3057-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201025101555.3057-1-rppt@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

For architectures that enable ARCH_HAS_SET_MEMORY having the ability to
verify that a page is mapped in the kernel direct map can be useful
regardless of hibernation.

Add RISC-V implementation of kernel_page_present() and update its forward
declarations and stubs to be a part of set_memory API.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/mm/pageattr.c            | 29 +++++++++++++++++++++++++++++
 arch/x86/include/asm/set_memory.h   |  1 +
 arch/x86/mm/pat/set_memory.c        |  2 --
 include/linux/mm.h                  |  7 -------
 include/linux/set_memory.h          |  5 +++++
 7 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9384fd8fc13c..45217f21f1fe 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -140,6 +140,7 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
+bool kernel_page_present(struct page *page);
 
 #include <asm-generic/cacheflush.h>
 
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..d690b08dff2a 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -24,6 +24,7 @@ static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
+bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 321b09d2e2ea..87ba5a68bbb8 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -198,3 +198,32 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 			     __pgprot(0), __pgprot(_PAGE_PRESENT));
 }
 #endif
+
+bool kernel_page_present(struct page *page)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	pgd_t *pgd;
+	pud_t *pud;
+	p4d_t *p4d;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	pgd = pgd_offset_k(addr);
+	if (!pgd_present(*pgd))
+		return false;
+
+	p4d = p4d_offset(pgd, addr);
+	if (!p4d_present(*p4d))
+		return false;
+
+	pud = pud_offset(p4d, addr);
+	if (!pud_present(*pud))
+		return false;
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd))
+		return false;
+
+	pte = pte_offset_kernel(pmd, addr);
+	return pte_present(*pte);
+}
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 5948218f35c5..4352f08bfbb5 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -82,6 +82,7 @@ int set_pages_rw(struct page *page, int numpages);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
+bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
 
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 7f248fc45317..16f878c26667 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2228,7 +2228,6 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 }
 #endif /* CONFIG_DEBUG_PAGEALLOC */
 
-#ifdef CONFIG_HIBERNATION
 bool kernel_page_present(struct page *page)
 {
 	unsigned int level;
@@ -2240,7 +2239,6 @@ bool kernel_page_present(struct page *page)
 	pte = lookup_address((unsigned long)page_address(page), &level);
 	return (pte_val(*pte) & _PAGE_PRESENT);
 }
-#endif /* CONFIG_HIBERNATION */
 
 int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
 				   unsigned numpages, unsigned long page_flags)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ab0ef6bd351d..44b82f22e76a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2937,16 +2937,9 @@ static inline void debug_pagealloc_map_pages(struct page *page,
 	if (debug_pagealloc_enabled_static())
 		__kernel_map_pages(page, numpages, enable);
 }
-
-#ifdef CONFIG_HIBERNATION
-extern bool kernel_page_present(struct page *page);
-#endif	/* CONFIG_HIBERNATION */
 #else	/* CONFIG_DEBUG_PAGEALLOC */
 static inline void debug_pagealloc_map_pages(struct page *page,
 					     int numpages, int enable) {}
-#ifdef CONFIG_HIBERNATION
-static inline bool kernel_page_present(struct page *page) { return true; }
-#endif	/* CONFIG_HIBERNATION */
 #endif	/* CONFIG_DEBUG_PAGEALLOC */
 
 #ifdef __HAVE_ARCH_GATE_AREA
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 860e0f843c12..fe1aa4e54680 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -23,6 +23,11 @@ static inline int set_direct_map_default_noflush(struct page *page)
 {
 	return 0;
 }
+
+static inline bool kernel_page_present(struct page *page)
+{
+	return true;
+}
 #endif
 
 #ifndef set_mce_nospec
-- 
2.28.0

