Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F296295
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:40:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYPM5qKCzDq9R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:40:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tvNEZMGU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfz2kPyzDr2k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfv5cNhz9v0Gf;
 Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tvNEZMGU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BmJS4c9iWh7u; Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfv4VKTz9v0GZ;
 Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310039; bh=z8e9Uj6B03G0dGIE0WzUdq843UoPWnyiQPD9j81kWUk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tvNEZMGUIIq2btu2OxJxqV+N+USRj8VpVLNs4qTAiEefx/MuzkkSlsayjQ4gnIqri
 T/0TdDPNpC0QTVdzWPNeoPpRq6fmBrbLI71lqafGVvwwNNG9zBRNAVj7ab0Bj/rMbA
 cFKA7s2zpo5iWgSFt89eMAgWd5ibTlhP64cSKq/U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0519A8B7D0;
 Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oCUmSbafffWn; Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF4728B7C9;
 Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8CDC26B734; Tue, 20 Aug 2019 14:07:19 +0000 (UTC)
Message-Id: <42e7e36ad32e0fdf76692426cc642799c9f689b8.1566309263.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 11/12] powerpc/mm: refactor ioremap vm area setup.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:19 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC32 and PPC64 are doing the same once SLAB is available.
Create a do_ioremap() function that calls get_vm_area and
do the mapping.

For PPC64, we add the 4K PFN hack sanity check to __ioremap_caller()
in order to avoid using __ioremap_at(). Other checks in __ioremap_at()
are irrelevant for __ioremap_caller().

On PPC64, VM area is allocated in the range [ioremap_bot ; IOREMAP_END]
On PPC32, VM area is allocated in the range [VMALLOC_START ; VMALLOC_END]

Lets define IOREMAP_START is ioremap_bot for PPC64, and alias
IOREMAP_START/END to VMALLOC_START/END on PPC32

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
 arch/powerpc/include/asm/io.h                |  2 ++
 arch/powerpc/include/asm/nohash/32/pgtable.h |  4 ++++
 arch/powerpc/include/asm/nohash/64/pgtable.h |  1 +
 arch/powerpc/mm/ioremap.c                    | 20 ++++++++++++++++++++
 arch/powerpc/mm/ioremap_32.c                 | 15 ++++-----------
 arch/powerpc/mm/ioremap_64.c                 | 17 +++++++----------
 8 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index aa1bc5f8da90..331a29a501a1 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -165,6 +165,10 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #define IOREMAP_TOP	KVIRT_TOP
 #endif
 
+/* PPC32 shares vmalloc area with ioremap */
+#define IOREMAP_START	VMALLOC_START
+#define IOREMAP_END	VMALLOC_END
+
 /*
  * Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 16MB value just means that there will be a 64MB "hole" after the
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 11819e3c755e..9eedb4aa6600 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -316,6 +316,7 @@ extern unsigned long pci_io_base;
 #define  PHB_IO_BASE	(ISA_IO_END)
 #define  PHB_IO_END	(KERN_IO_START + FULL_IO_SIZE)
 #define IOREMAP_BASE	(PHB_IO_END)
+#define IOREMAP_START	(ioremap_bot)
 #define IOREMAP_END	(KERN_IO_END)
 
 /* Advertise special mapping type for AGP */
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 8e00d95f9600..dc529ea0fffa 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -723,6 +723,8 @@ void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 extern void iounmap(volatile void __iomem *addr);
 
 int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot);
+void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
+			 pgprot_t prot, void *caller);
 
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
 				      pgprot_t prot, void *caller);
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 7ce2a7c9fade..3e1a4c1e40f0 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -93,6 +93,10 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #define IOREMAP_TOP	KVIRT_TOP
 #endif
 
+/* PPC32 shares vmalloc area with ioremap */
+#define IOREMAP_START	VMALLOC_START
+#define IOREMAP_END	VMALLOC_END
+
 /*
  * Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 16MB value just means that there will be a 64MB "hole" after the
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index b9f66cf15c31..9a33b8bd842d 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -53,6 +53,7 @@
 #define  PHB_IO_BASE	(ISA_IO_END)
 #define  PHB_IO_END	(KERN_IO_START + FULL_IO_SIZE)
 #define IOREMAP_BASE	(PHB_IO_END)
+#define IOREMAP_START	(ioremap_bot)
 #define IOREMAP_END	(KERN_VIRT_START + KERN_VIRT_SIZE)
 
 
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 50ee6544d0b7..57630325846c 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -80,3 +80,23 @@ int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t
 
 	return 0;
 }
+
+void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
+			 pgprot_t prot, void *caller)
+{
+	struct vm_struct *area;
+	int ret;
+
+	area = __get_vm_area_caller(size, VM_IOREMAP, IOREMAP_START, IOREMAP_END, caller);
+	if (area == NULL)
+		return NULL;
+
+	area->phys_addr = pa;
+	ret = ioremap_range((unsigned long)area->addr, pa, size, prot);
+	if (!ret)
+		return (void __iomem *)area->addr + offset;
+
+	free_vm_area(area);
+
+	return NULL;
+}
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index 85b90a62e084..fcf343dbf2bf 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -18,7 +18,7 @@ void __iomem *
 __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
 {
 	unsigned long v;
-	phys_addr_t p;
+	phys_addr_t p, offset;
 	int err;
 
 	/*
@@ -28,6 +28,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 * (ioremap_bot records where we're up to).
 	 */
 	p = addr & PAGE_MASK;
+	offset = addr & ~PAGE_MASK;
 	size = PAGE_ALIGN(addr + size) - p;
 
 	/*
@@ -62,12 +63,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 		goto out;
 
 	if (slab_is_available()) {
-		struct vm_struct *area;
-		area = get_vm_area_caller(size, VM_IOREMAP, caller);
-		if (area == 0)
-			return NULL;
-		area->phys_addr = p;
-		v = (unsigned long)area->addr;
+		return do_ioremap(p, offset, size, prot, caller);
 	} else {
 		v = (ioremap_bot -= size);
 	}
@@ -77,11 +73,8 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 */
 
 	err = ioremap_range((unsigned long)v, p, size, prot);
-	if (err) {
-		if (slab_is_available())
-			vunmap((void *)v);
+	if (err)
 		return NULL;
-	}
 
 out:
 	return (void __iomem *)(v + ((unsigned long)addr & ~PAGE_MASK));
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index d132ce1e538d..e37b68b7f0e8 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -46,9 +46,13 @@ EXPORT_SYMBOL(__iounmap_at);
 void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 			       pgprot_t prot, void *caller)
 {
-	phys_addr_t paligned;
+	phys_addr_t paligned, offset;
 	void __iomem *ret;
 
+	/* We don't support the 4K PFN hack with ioremap */
+	if (pgprot_val(prot) & H_PAGE_4K_PFN)
+		return NULL;
+
 	/*
 	 * Choose an address to map it to. Once the vmalloc system is running,
 	 * we use it. Before that, we map using addresses going up from
@@ -56,21 +60,14 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 	 * through ioremap_bot.
 	 */
 	paligned = addr & PAGE_MASK;
+	offset = addr & ~PAGE_MASK;
 	size = PAGE_ALIGN(addr + size) - paligned;
 
 	if (size == 0 || paligned == 0)
 		return NULL;
 
 	if (slab_is_available()) {
-		struct vm_struct *area;
-
-		area = __get_vm_area_caller(size, VM_IOREMAP, ioremap_bot,
-					    IOREMAP_END, caller);
-		if (area == NULL)
-			return NULL;
-
-		area->phys_addr = paligned;
-		ret = __ioremap_at(paligned, area->addr, size, prot);
+		return do_ioremap(paligned, offset, size, prot, caller);
 	} else {
 		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
 		if (ret)
-- 
2.13.3

