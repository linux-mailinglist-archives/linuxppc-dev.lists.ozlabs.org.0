Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE187027F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 11:11:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKYXM4LvLz3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 19:11:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8l866cu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8l866cu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8l866cu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8l866cu;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKYWY10X2z30NN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 19:11:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684141862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBuHsMVsHTAI0RHYgISB0uXb9e32Yu/B2askY5ny76Y=;
	b=i8l866cuL+kzfgxTGQ/9nvAtS4qeO2y6UNQ5z062yQAvwwkLNZ09MopBjLpJKJOAFUlPKR
	Lx2VYcRIw8kolsT1s3e8K+bIlUMTEtnlYSL5vkhrEl3H/GMjJFxr2MW6A64aAu+8Fq8vMv
	AAO6fxAYDk3D6o8M1aygD1F9dsz39PU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684141862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBuHsMVsHTAI0RHYgISB0uXb9e32Yu/B2askY5ny76Y=;
	b=i8l866cuL+kzfgxTGQ/9nvAtS4qeO2y6UNQ5z062yQAvwwkLNZ09MopBjLpJKJOAFUlPKR
	Lx2VYcRIw8kolsT1s3e8K+bIlUMTEtnlYSL5vkhrEl3H/GMjJFxr2MW6A64aAu+8Fq8vMv
	AAO6fxAYDk3D6o8M1aygD1F9dsz39PU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-9A1xWtYJNY267tJuB8jy-Q-1; Mon, 15 May 2023 05:10:59 -0400
X-MC-Unique: 9A1xWtYJNY267tJuB8jy-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D24857E06;
	Mon, 15 May 2023 09:10:57 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-32.pek2.redhat.com [10.72.12.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7212840C206F;
	Mon, 15 May 2023 09:10:50 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 RESEND 15/17] powerpc: mm: Convert to GENERIC_IOREMAP
Date: Mon, 15 May 2023 17:08:46 +0800
Message-Id: <20230515090848.833045-16-bhe@redhat.com>
In-Reply-To: <20230515090848.833045-1-bhe@redhat.com>
References: <20230515090848.833045-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com, Baoquan He <bhe@redhat.com>, arnd@arndb.de, schnelle@linux.ibm.com, deller@gmx.de, Nicholas Piggin <npiggin@gmail.com>, hch@infradead.org, linux-mm@kvack.org, David.Laight@ACULAB.COM, willy@infradead.org, agordeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, shorne@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

By taking GENERIC_IOREMAP method, the generic generic_ioremap_prot(),
generic_iounmap(), and their generic wrapper ioremap_prot(), ioremap()
and iounmap() are all visible and available to arch. Arch needs to
provide wrapper functions to override the generic versions if there's
arch specific handling in its ioremap_prot(), ioremap() or iounmap().
This change will simplify implementation by removing duplicated codes
with generic_ioremap_prot() and generic_iounmap(), and has the equivalent
functioality as before.

Here, add wrapper functions ioremap_prot() and iounmap() for powerpc's
special operation when ioremap() and iounmap().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig          |  1 +
 arch/powerpc/include/asm/io.h |  8 +++-----
 arch/powerpc/mm/ioremap.c     | 26 +-------------------------
 arch/powerpc/mm/ioremap_32.c  | 19 +++++++++----------
 arch/powerpc/mm/ioremap_64.c  | 12 ++----------
 5 files changed, 16 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..e0a88ebcd026 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -194,6 +194,7 @@ config PPC
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY
+	select GENERIC_IOREMAP
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 67a3fb6de498..0732b743e099 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -889,8 +889,8 @@ static inline void iosync(void)
  *
  */
 extern void __iomem *ioremap(phys_addr_t address, unsigned long size);
-extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
-				  unsigned long flags);
+#define ioremap ioremap
+#define ioremap_prot ioremap_prot
 extern void __iomem *ioremap_wc(phys_addr_t address, unsigned long size);
 #define ioremap_wc ioremap_wc
 
@@ -904,14 +904,12 @@ void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 #define ioremap_cache(addr, size) \
 	ioremap_prot((addr), (size), pgprot_val(PAGE_KERNEL))
 
-extern void iounmap(volatile void __iomem *addr);
+#define iounmap iounmap
 
 void __iomem *ioremap_phb(phys_addr_t paddr, unsigned long size);
 
 int early_ioremap_range(unsigned long ea, phys_addr_t pa,
 			unsigned long size, pgprot_t prot);
-void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
-			 pgprot_t prot, void *caller);
 
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
 				      pgprot_t prot, void *caller);
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 4f12504fb405..705e8e8ffde4 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -41,7 +41,7 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 	return __ioremap_caller(addr, size, prot, caller);
 }
 
-void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
+void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long flags)
 {
 	pte_t pte = __pte(flags);
 	void *caller = __builtin_return_address(0);
@@ -74,27 +74,3 @@ int early_ioremap_range(unsigned long ea, phys_addr_t pa,
 
 	return 0;
 }
-
-void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
-			 pgprot_t prot, void *caller)
-{
-	struct vm_struct *area;
-	int ret;
-	unsigned long va;
-
-	area = __get_vm_area_caller(size, VM_IOREMAP, IOREMAP_START, IOREMAP_END, caller);
-	if (area == NULL)
-		return NULL;
-
-	area->phys_addr = pa;
-	va = (unsigned long)area->addr;
-
-	ret = ioremap_page_range(va, va + size, pa, prot);
-	if (!ret)
-		return (void __iomem *)area->addr + offset;
-
-	vunmap_range(va, va + size);
-	free_vm_area(area);
-
-	return NULL;
-}
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index 9d13143b8be4..ca5bc6be3e6f 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -21,6 +21,13 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	phys_addr_t p, offset;
 	int err;
 
+	/*
+	 * If the address lies within the first 16 MB, assume it's in ISA
+	 * memory space
+	 */
+	if (addr < SZ_16M)
+		addr += _ISA_MEM_BASE;
+
 	/*
 	 * Choose an address to map it to.
 	 * Once the vmalloc system is running, we use it.
@@ -31,13 +38,6 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	offset = addr & ~PAGE_MASK;
 	size = PAGE_ALIGN(addr + size) - p;
 
-	/*
-	 * If the address lies within the first 16 MB, assume it's in ISA
-	 * memory space
-	 */
-	if (p < 16 * 1024 * 1024)
-		p += _ISA_MEM_BASE;
-
 #ifndef CONFIG_CRASH_DUMP
 	/*
 	 * Don't allow anybody to remap normal RAM that we're using.
@@ -63,7 +63,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 		return (void __iomem *)v + offset;
 
 	if (slab_is_available())
-		return do_ioremap(p, offset, size, prot, caller);
+		return generic_ioremap_prot(addr, size, prot);
 
 	/*
 	 * Should check if it is a candidate for a BAT mapping
@@ -87,7 +87,6 @@ void iounmap(volatile void __iomem *addr)
 	if (v_block_mapped((unsigned long)addr))
 		return;
 
-	if (addr > high_memory && (unsigned long)addr < ioremap_bot)
-		vunmap((void *)(PAGE_MASK & (unsigned long)addr));
+	generic_iounmap(addr);
 }
 EXPORT_SYMBOL(iounmap);
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index 3acece00b33e..d24e5f166723 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -29,7 +29,7 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 		return NULL;
 
 	if (slab_is_available())
-		return do_ioremap(paligned, offset, size, prot, caller);
+		return generic_ioremap_prot(addr, size, prot);
 
 	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
 
@@ -49,17 +49,9 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
  */
 void iounmap(volatile void __iomem *token)
 {
-	void *addr;
-
 	if (!slab_is_available())
 		return;
 
-	addr = (void *)((unsigned long __force)PCI_FIX_ADDR(token) & PAGE_MASK);
-
-	if ((unsigned long)addr < ioremap_bot) {
-		pr_warn("Attempt to iounmap early bolted mapping at 0x%p\n", addr);
-		return;
-	}
-	vunmap(addr);
+	generic_iounmap(PCI_FIX_ADDR(token));
 }
 EXPORT_SYMBOL(iounmap);
-- 
2.34.1

