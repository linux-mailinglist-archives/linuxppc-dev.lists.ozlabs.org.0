Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B39627D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYCw6XdkzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LFUwWUgk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfw1ZPNzDr3j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfn4CqKz9v0Gj;
 Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LFUwWUgk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XGtgZT23h2WL; Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfn2wjsz9v0GZ;
 Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310033; bh=F4vajnIpJaxsa3LCOfDluH5icf182iHp85Z30DDs3k8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LFUwWUgkrEHvRCxDFf9PyCjhIpq+auBnhJmqNfalRQ8xMVfT9Lej2aSoZRNWMDP6v
 IAqs8l9ojXzVzES315MTkiETmPObTL3JgVBYBD2uiqdUCpfZ5mHTS5TGs0zperkIhe
 83col3OcEbNCs98kV24dEubyIewWksriDcn/ml1M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5BB28B7D1;
 Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xKf9dTwy2trk; Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83A808B7C9;
 Tue, 20 Aug 2019 16:07:13 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6577F6B734; Tue, 20 Aug 2019 14:07:13 +0000 (UTC)
Message-Id: <5fa3ef069fbd0f152512afaae19e7a60161454cf.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 05/12] powerpc/mm: rework io-workaround invocation.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:13 +0000 (UTC)
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

ppc_md.ioremap() is only used for I/O workaround on CELL platform,
so indirect function call can be avoided.

This patch reworks the io-workaround and ioremap() functions to
use the global 'io_workaround_inited' flag for the activation
of io-workaround.

When CONFIG_PPC_IO_WORKAROUNDS or CONFIG_PPC_INDIRECT_MMIO are not
selected, the I/O workaround ioremap() voids and the global flag is
not used.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/io-workarounds.h | 20 ++++++++++++++++++++
 arch/powerpc/include/asm/machdep.h        |  2 --
 arch/powerpc/kernel/io-workarounds.c      | 13 +++++--------
 arch/powerpc/mm/pgtable_64.c              | 17 +++++++++--------
 4 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/io-workarounds.h b/arch/powerpc/include/asm/io-workarounds.h
index 01567ea4ceaf..3cce499fbe27 100644
--- a/arch/powerpc/include/asm/io-workarounds.h
+++ b/arch/powerpc/include/asm/io-workarounds.h
@@ -8,6 +8,7 @@
 #ifndef _IO_WORKAROUNDS_H
 #define _IO_WORKAROUNDS_H
 
+#ifdef CONFIG_PPC_IO_WORKAROUNDS
 #include <linux/io.h>
 #include <asm/pci-bridge.h>
 
@@ -32,4 +33,23 @@ extern int spiderpci_iowa_init(struct iowa_bus *, void *);
 #define SPIDER_PCI_DUMMY_READ		0x0810
 #define SPIDER_PCI_DUMMY_READ_BASE	0x0814
 
+#endif
+
+#if defined(CONFIG_PPC_IO_WORKAROUNDS) && defined(CONFIG_PPC_INDIRECT_MMIO)
+extern bool io_workaround_inited;
+
+static inline bool iowa_is_active(void)
+{
+	return unlikely(io_workaround_inited);
+}
+#else
+static inline bool iowa_is_active(void)
+{
+	return false;
+}
+#endif
+
+void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
+			   pgprot_t prot, void *caller);
+
 #endif /* _IO_WORKAROUNDS_H */
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 3370df4bdaa0..657ec893bdcb 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -31,8 +31,6 @@ struct pci_host_bridge;
 struct machdep_calls {
 	char		*name;
 #ifdef CONFIG_PPC64
-	void __iomem *	(*ioremap)(phys_addr_t addr, unsigned long size,
-				   pgprot_t prot, void *caller);
 #ifdef CONFIG_PM
 	void		(*iommu_save)(void);
 	void		(*iommu_restore)(void);
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index fbd2d0007c52..0276bc8c8969 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -149,8 +149,8 @@ static const struct ppc_pci_io iowa_pci_io = {
 };
 
 #ifdef CONFIG_PPC_INDIRECT_MMIO
-static void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
-				  pgprot_t prot, void *caller)
+void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
+			   pgprot_t prot, void *caller)
 {
 	struct iowa_bus *bus;
 	void __iomem *res = __ioremap_caller(addr, size, prot, caller);
@@ -163,20 +163,17 @@ static void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
 	}
 	return res;
 }
-#else /* CONFIG_PPC_INDIRECT_MMIO */
-#define iowa_ioremap NULL
 #endif /* !CONFIG_PPC_INDIRECT_MMIO */
 
+bool io_workaround_inited;
+
 /* Enable IO workaround */
 static void io_workaround_init(void)
 {
-	static int io_workaround_inited;
-
 	if (io_workaround_inited)
 		return;
 	ppc_pci_io = iowa_pci_io;
-	ppc_md.ioremap = iowa_ioremap;
-	io_workaround_inited = 1;
+	io_workaround_inited = true;
 }
 
 /* Register new bus to support workaround */
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 2882419737b9..0a147daeb0f2 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -35,6 +35,7 @@
 #include <asm/page.h>
 #include <asm/prom.h>
 #include <asm/io.h>
+#include <asm/io-workarounds.h>
 #include <asm/mmu_context.h>
 #include <asm/pgtable.h>
 #include <asm/mmu.h>
@@ -208,8 +209,8 @@ void __iomem * ioremap(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (ppc_md.ioremap)
-		return ppc_md.ioremap(addr, size, prot, caller);
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 
@@ -218,8 +219,8 @@ void __iomem * ioremap_wc(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (ppc_md.ioremap)
-		return ppc_md.ioremap(addr, size, prot, caller);
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 
@@ -228,8 +229,8 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (ppc_md.ioremap)
-		return ppc_md.ioremap(addr, size, prot, caller);
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 
@@ -250,8 +251,8 @@ void __iomem * ioremap_prot(phys_addr_t addr, unsigned long size,
 	 */
 	pte = pte_mkprivileged(pte);
 
-	if (ppc_md.ioremap)
-		return ppc_md.ioremap(addr, size, pte_pgprot(pte), caller);
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
 	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
 }
 
-- 
2.13.3

