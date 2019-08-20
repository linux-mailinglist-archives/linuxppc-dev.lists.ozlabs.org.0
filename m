Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700896261
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:26:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CY5Q0Q9nzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LAjTxHEJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfw1rSXzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfp4DJzz9v0Gh;
 Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LAjTxHEJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nttQgid0pbse; Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfp3BBsz9v0GZ;
 Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310034; bh=SBsNMvGsbMMC8XFjes4L70Rdi1s+t6kRWxXgqat2LYU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LAjTxHEJx9N9jYfbpDE4kpnJ8o/aFDX7HUbL23XHYrCAsdaFgnXI7AF5H4K0dStko
 3s4t1uCvwJhz5xrdvrzjV7pu4SIby9N4Jw1o5rT+mOh/3Jg04e6N5aiQCbeulOMno7
 xROrtpW8XKZv7WsxotcnPIrk0sWXzfSmvKde2pvc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB57E8B7C9;
 Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NZen0_zo3DCl; Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 873088B7D0;
 Tue, 20 Aug 2019 16:07:14 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6B0536B734; Tue, 20 Aug 2019 14:07:14 +0000 (UTC)
Message-Id: <6223803ce024d6ab4dfaa919f44098aed5b4bc33.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 06/12] powerpc/mm: move common 32/64 bits ioremap functions
 into ioremap.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:14 +0000 (UTC)
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

ioremap(), ioremap_wc() and ioremap_coherent() are now identical on
PPC32 and PPC64 as iowa_is_active() will always return false on
PPC32. Move them into a new common location called ioremap.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/Makefile     |  2 +-
 arch/powerpc/mm/ioremap.c    | 36 ++++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c | 27 ---------------------------
 arch/powerpc/mm/pgtable_64.c | 33 ---------------------------------
 4 files changed, 37 insertions(+), 61 deletions(-)
 create mode 100644 arch/powerpc/mm/ioremap.c

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 0f499db315d6..29c682fe9144 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -7,7 +7,7 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
 obj-y				:= fault.o mem.o pgtable.o mmap.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
-				   pgtable-frag.o \
+				   pgtable-frag.o ioremap.o \
 				   init-common.o mmu_context.o drmem.o
 obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
new file mode 100644
index 000000000000..7f1d462e7745
--- /dev/null
+++ b/arch/powerpc/mm/ioremap.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/io.h>
+#include <asm/io-workarounds.h>
+
+void __iomem *ioremap(phys_addr_t addr, unsigned long size)
+{
+	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
+	void *caller = __builtin_return_address(0);
+
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
+	return __ioremap_caller(addr, size, prot, caller);
+}
+EXPORT_SYMBOL(ioremap);
+
+void __iomem *ioremap_wc(phys_addr_t addr, unsigned long size)
+{
+	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
+	void *caller = __builtin_return_address(0);
+
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
+	return __ioremap_caller(addr, size, prot, caller);
+}
+EXPORT_SYMBOL(ioremap_wc);
+
+void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
+{
+	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
+	void *caller = __builtin_return_address(0);
+
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, prot, caller);
+	return __ioremap_caller(addr, size, prot, caller);
+}
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 848ee4a30dd1..3a4972007ec0 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -39,24 +39,6 @@ EXPORT_SYMBOL(ioremap_bot);	/* aka VMALLOC_END */
 extern char etext[], _stext[], _sinittext[], _einittext[];
 
 void __iomem *
-ioremap(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
-
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap);
-
-void __iomem *
-ioremap_wc(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
-
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_wc);
-
-void __iomem *
 ioremap_wt(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
@@ -66,15 +48,6 @@ ioremap_wt(phys_addr_t addr, unsigned long size)
 EXPORT_SYMBOL(ioremap_wt);
 
 void __iomem *
-ioremap_coherent(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
-
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_coherent);
-
-void __iomem *
 ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
 {
 	pte_t pte = __pte(flags);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 0a147daeb0f2..358233ea8d85 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -35,7 +35,6 @@
 #include <asm/page.h>
 #include <asm/prom.h>
 #include <asm/io.h>
-#include <asm/io-workarounds.h>
 #include <asm/mmu_context.h>
 #include <asm/pgtable.h>
 #include <asm/mmu.h>
@@ -204,36 +203,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-void __iomem * ioremap(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
-
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
-	return __ioremap_caller(addr, size, prot, caller);
-}
-
-void __iomem * ioremap_wc(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
-
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
-	return __ioremap_caller(addr, size, prot, caller);
-}
-
-void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
-
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
-	return __ioremap_caller(addr, size, prot, caller);
-}
-
 void __iomem * ioremap_prot(phys_addr_t addr, unsigned long size,
 			     unsigned long flags)
 {
@@ -278,8 +247,6 @@ void iounmap(volatile void __iomem *token)
 	vunmap(addr);
 }
 
-EXPORT_SYMBOL(ioremap);
-EXPORT_SYMBOL(ioremap_wc);
 EXPORT_SYMBOL(ioremap_prot);
 EXPORT_SYMBOL(__ioremap_at);
 EXPORT_SYMBOL(iounmap);
-- 
2.13.3

