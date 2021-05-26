Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B63916E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 14:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqqK82Mhdz30B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 22:00:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cpqeZJM2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cpqeZJM2; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqqJf2cz2z2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 22:00:17 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id n8so493238plf.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNOewunu1/YI5ycKKjgkCiFR8rult6PJWWdN0KnYOJQ=;
 b=cpqeZJM2SgzRAOE7tNBsKq19UCCXqSnnMbjtrm4cAk/IRW75KAc2WEsmeE/jRyyT5x
 6whZxpsdMsmBAbY1kT7YYo0XfuP/+VIexve5+YRLf5Lk8jxT0yGhmt81awjwV54vk6m1
 mENwGkYLgxKBgNQjhzSDqt8XCUGM5TbiDoLvmm7+RiK4366UVsxiFCGUzj+7yXkZ4iI5
 c7gfZTISJlfzqV+rFqlV9qv4NhI7v9HrlOQFKhK9XKJyTJUWJJRYLbRYw4/75gxeFBCG
 xHwUZQLc1NbB5l4ysgo/oJjtDzN2MjDgd3MxoJ0Ap2C9csNKN60YYyBckuQuSjLCV7ol
 fcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNOewunu1/YI5ycKKjgkCiFR8rult6PJWWdN0KnYOJQ=;
 b=FmWlRW10ptkOWrtds96LcA2cZJkaUfuUUF5qSvEOkEyZIl34Mex++oFe4SIG5efzxm
 9n3hPJ4yUBZQ+J0Xg/6/9Jx7xw2bphdxmuMM5hrtFtK/zfu1IhzW2s85kkOAdL8fI7Sf
 jMnyk0U368D1SUpNSZ7YC0jsk+3/Xoi3YV7Vlp9VAfVwweEs5l2eUDJHiT7MMl16hYRn
 AJS1IBbOpnoaDIWRcd2+OPVSINRKI25NWkjZWr6n5veeUULqAe8m3FJnQYUIn1R07q8p
 sz9nl7CStyy/Le7B9ybRgPby4tAiVkEMhbQ5zrH8pYALskHVUpSc4PezBmOPOCu+jBk+
 bAHQ==
X-Gm-Message-State: AOAM533d3MSBDwQkDY999S3b+5tIcW8uKWvcZP4Y+CChhstFD3fcBE4G
 9WT3kfGC216NXc4+fIA2IGu4SO4Dgj0=
X-Google-Smtp-Source: ABdhPJzdjQ9Lk9R36+NfAZ+XV0vJ/nJkSoyeeRQ+1ah2J9ueTMoVJRkOPswSoVmd4+1eQNwGDHJiNg==
X-Received: by 2002:a17:902:aa95:b029:fd:8e4a:f341 with SMTP id
 d21-20020a170902aa95b02900fd8e4af341mr2351560plr.78.1622030413959; 
 Wed, 26 May 2021 05:00:13 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id h18sm15831712pfr.49.2021.05.26.05.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:00:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Book3S HV: Fix reverse map real-mode address
 lookup with huge vmalloc
Date: Wed, 26 May 2021 22:00:05 +1000
Message-Id: <20210526120005.3432222-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

real_vmalloc_addr() does not currently work for huge vmalloc, which is
what the reverse map can be allocated with for radix host, hash guest.

Extract the hugepage aware equivalent from eeh code into a helper, and
convert existing sites including this one to use it.

Fixes: 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Factor out the same 3 patterns.
- Improve code and use PFN_PHYS [Christophe]

 arch/powerpc/include/asm/pte-walk.h  | 29 ++++++++++++++++++++++++++++
 arch/powerpc/kernel/eeh.c            | 23 +---------------------
 arch/powerpc/kernel/io-workarounds.c | 15 +++-----------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c  | 15 ++------------
 4 files changed, 35 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/include/asm/pte-walk.h b/arch/powerpc/include/asm/pte-walk.h
index 33fa5dd8ee6a..714a35f0d425 100644
--- a/arch/powerpc/include/asm/pte-walk.h
+++ b/arch/powerpc/include/asm/pte-walk.h
@@ -31,6 +31,35 @@ static inline pte_t *find_init_mm_pte(unsigned long ea, unsigned *hshift)
 	pgd_t *pgdir = init_mm.pgd;
 	return __find_linux_pte(pgdir, ea, NULL, hshift);
 }
+
+/*
+ * Convert a kernel vmap virtual address (vmalloc or ioremap space) to a
+ * physical address, without taking locks. This can be used in real-mode.
+ */
+static inline phys_addr_t ppc_find_vmap_phys(unsigned long addr)
+{
+	pte_t *ptep;
+	phys_addr_t pa;
+	int hugepage_shift;
+
+	/*
+	 * init_mm does not free page tables, and does not do THP. It may
+	 * have huge pages from huge vmalloc / ioremap etc.
+	 */
+	ptep = find_init_mm_pte(addr, &hugepage_shift);
+	if (WARN_ON(!ptep))
+		return 0;
+
+	pa = PFN_PHYS(pte_pfn(*ptep));
+
+	if (!hugepage_shift)
+		hugepage_shift = PAGE_SHIFT;
+
+	pa |= addr & ((1ul << hugepage_shift) - 1);
+
+	return pa;
+}
+
 /*
  * This is what we should always use. Any other lockless page table lookup needs
  * careful audit against THP split.
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index f24cd53ff26e..3bbdcc86d01b 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -346,28 +346,7 @@ void eeh_slot_error_detail(struct eeh_pe *pe, int severity)
  */
 static inline unsigned long eeh_token_to_phys(unsigned long token)
 {
-	pte_t *ptep;
-	unsigned long pa;
-	int hugepage_shift;
-
-	/*
-	 * We won't find hugepages here(this is iomem). Hence we are not
-	 * worried about _PAGE_SPLITTING/collapse. Also we will not hit
-	 * page table free, because of init_mm.
-	 */
-	ptep = find_init_mm_pte(token, &hugepage_shift);
-	if (!ptep)
-		return token;
-
-	pa = pte_pfn(*ptep);
-
-	/* On radix we can do hugepage mappings for io, so handle that */
-	if (!hugepage_shift)
-		hugepage_shift = PAGE_SHIFT;
-
-	pa <<= PAGE_SHIFT;
-	pa |= token & ((1ul << hugepage_shift) - 1);
-	return pa;
+	return ppc_find_vmap_phys(token);
 }
 
 /*
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index 51bbaae94ccc..ddba8761e58c 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -65,22 +65,13 @@ struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR addr)
 		bus = &iowa_busses[token - 1];
 	else {
 		unsigned long vaddr, paddr;
-		pte_t *ptep;
 
 		vaddr = (unsigned long)PCI_FIX_ADDR(addr);
 		if (vaddr < PHB_IO_BASE || vaddr >= PHB_IO_END)
 			return NULL;
-		/*
-		 * We won't find huge pages here (iomem). Also can't hit
-		 * a page table free due to init_mm
-		 */
-		ptep = find_init_mm_pte(vaddr, &hugepage_shift);
-		if (ptep == NULL)
-			paddr = 0;
-		else {
-			WARN_ON(hugepage_shift);
-			paddr = pte_pfn(*ptep) << PAGE_SHIFT;
-		}
+
+		paddr = ppc_find_vmap_phys(vaddr);
+
 		bus = iowa_pci_find(vaddr, paddr);
 
 		if (bus == NULL)
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7af7c70f1468..7a0f12404e0e 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -23,20 +23,9 @@
 #include <asm/pte-walk.h>
 
 /* Translate address of a vmalloc'd thing to a linear map address */
-static void *real_vmalloc_addr(void *x)
+static void *real_vmalloc_addr(void *addr)
 {
-	unsigned long addr = (unsigned long) x;
-	pte_t *p;
-	/*
-	 * assume we don't have huge pages in vmalloc space...
-	 * So don't worry about THP collapse/split. Called
-	 * Only in realmode with MSR_EE = 0, hence won't need irq_save/restore.
-	 */
-	p = find_init_mm_pte(addr, NULL);
-	if (!p || !pte_present(*p))
-		return NULL;
-	addr = (pte_pfn(*p) << PAGE_SHIFT) | (addr & ~PAGE_MASK);
-	return __va(addr);
+	return __va(ppc_find_vmap_phys((unsigned long)addr));
 }
 
 /* Return 1 if we need to do a global tlbie, 0 if we can use tlbiel */
-- 
2.23.0

