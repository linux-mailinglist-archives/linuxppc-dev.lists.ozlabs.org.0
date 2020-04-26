Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DF21B8CD0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 08:04:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498y6V5vYGzDq9H
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 16:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498xv45Km2zDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 15:54:40 +1000 (AEST)
IronPort-SDR: L2KAToTEH7hnsphYclO50nP1vlpb9c2PR2Ms79uYU2ay6Vj/Sf9bcIXYn0/SnR7hNgT0nflHKQ
 J4DbgshtLn5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
IronPort-SDR: JbrFxZQOg4mMIuwtoATzRdij1dRliQGnUgWcjgmHA5TRHF3mzGglJEjgI5nDw5LX1Vgmb6bj/B
 U1DQQme6oOjQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="302014809"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Date: Sat, 25 Apr 2020 22:54:05 -0700
Message-Id: <20200426055406.134198-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200426055406.134198-1-ira.weiny@intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Every arch has the same check for a not HIGHMEM page.  Define
kmap_atomic_fast() to quickly return already mapped pages and reduce the
code duplication by lifting this check to the core.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/mm/highmem.c        | 7 +++----
 arch/arm/mm/highmem.c        | 8 +++-----
 arch/csky/mm/highmem.c       | 7 +++----
 arch/microblaze/mm/highmem.c | 8 +++-----
 arch/mips/mm/highmem.c       | 7 +++----
 arch/nds32/mm/highmem.c      | 7 +++----
 arch/powerpc/mm/highmem.c    | 7 +++----
 arch/sparc/mm/highmem.c      | 7 +++----
 arch/x86/mm/highmem_32.c     | 8 +++-----
 arch/xtensa/mm/highmem.c     | 7 +++----
 include/linux/highmem.h      | 9 +++++++++
 11 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 4db13a6b9f3b..1cae4b911a33 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
 {
 	int idx, cpu_idx;
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	cpu_idx = kmap_atomic_idx_push();
 	idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index c700b32350ee..4a629f616a6a 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -35,13 +35,11 @@ void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr;
-	void *kmap;
+	void *kmap = kmap_atomic_fast(page);
 	int type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (kmap)
+		return kmap;
 
 #ifdef CONFIG_DEBUG_HIGHMEM
 	/*
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 69b1931986ae..1191f57f53ae 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -25,12 +25,11 @@ EXPORT_SYMBOL(kmap);
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index d7569f77fa15..99fdf826edc2 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -36,13 +36,11 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index c3c9fe962f0f..ba03ca75d4a1 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -33,12 +33,11 @@ EXPORT_SYMBOL(kmap);
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index f9348bec0ecb..4aabde586489 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -14,13 +14,12 @@ void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr, pte;
+	void *addr = kmap_atomic_fast(page);
 	int type;
 	pte_t *ptep;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 320c1672b2ae..cdf5b716801a 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -33,12 +33,11 @@
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d4a80adea7e5..178641805567 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -56,12 +56,11 @@ void __init kmap_init(void)
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	long idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index c4ebfd0ae401..34770499b0ff 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -15,13 +15,11 @@
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 184ceadccc1a..38c14e0b578c 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -41,11 +41,10 @@ void *kmap_atomic(struct page *page)
 {
 	enum fixed_addresses idx;
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	idx = kmap_idx(kmap_atomic_idx_push(),
 		       DCACHE_ALIAS(page_to_phys(page)));
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 1a3b7690c78c..eee53e151900 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -60,6 +60,15 @@ static inline void kunmap(struct page *page)
 	kunmap_high(page);
 }
 
+static inline void *kmap_atomic_fast(struct page *page)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+	return NULL;
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

