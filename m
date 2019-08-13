Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8558C210
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 22:23:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467PKq6T9LzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="O9DrD3EH"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P4b1jH7zDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:11:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467P4S3fLBz9v0CL;
 Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=O9DrD3EH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id l6iNqXAQgTJL; Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467P4S2RdZz9v05l;
 Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565727096; bh=Lcen1LNdA7+NgKMAunfBllg/nD1eaeDdJLKprC+pjIE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=O9DrD3EHLCuvergN7OHcHWGxqBU9+q7K9xfOzD3B85bGsDZ5cr9DWN4+KxA86f0QS
 kLhQ/GUOcqcj2fMw5fNCjiFPmc2t39/hRj+d7hDsuNtw4WyBmpZn7Q1S+Zi3HKNho2
 tDgKlF4QkQVB7JpdT/3rYjJwbfoWoKTxAabRwGlU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D5E78B7F2;
 Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id brcuPcWHgM2M; Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 211E38B7F0;
 Tue, 13 Aug 2019 22:11:36 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EE3D769632; Tue, 13 Aug 2019 20:11:35 +0000 (UTC)
Message-Id: <baa13cb4e4940a406ff31577b9b073410ba7d24f.1565726867.git.christophe.leroy@c-s.fr>
In-Reply-To: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 03/10] powerpc/mm: move common 32/64 bits ioremap functions
 into ioremap.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 13 Aug 2019 20:11:35 +0000 (UTC)
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

ioremap(), __ioremap(), ioremap_wc() and ioremap_coherent() are
now identical on PPC32 and PPC64 as iowa_is_active() will always
return false on PPC32. Move them into a new common location called
ioremap.c

Allthough ioremap_wt() only exists on PPC32, move it into ioremap.c
as well. As it is the only one specific to PPC32, it is not worth
creating an ioremap_32.c file and leaving it in pgtable_32.c would
make it the only ioremap function in that file at the end of the
series.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/Makefile     |  2 +-
 arch/powerpc/mm/ioremap.c    | 52 ++++++++++++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c | 43 ------------------------------------
 arch/powerpc/mm/pgtable_64.c | 39 ---------------------------------
 4 files changed, 53 insertions(+), 83 deletions(-)
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
index 000000000000..89479ee88344
--- /dev/null
+++ b/arch/powerpc/mm/ioremap.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/io.h>
+#include <asm/io-workarounds.h>
+
+void __iomem *__ioremap(phys_addr_t addr, unsigned long size, unsigned long flags)
+{
+	return __ioremap_caller(addr, size, __pgprot(flags), __builtin_return_address(0));
+}
+EXPORT_SYMBOL(__ioremap);
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
+#ifdef CONFIG_PPC32
+void __iomem *ioremap_wt(phys_addr_t addr, unsigned long size)
+{
+	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
+
+	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
+}
+EXPORT_SYMBOL(ioremap_wt);
+#endif
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
index 35cb96cfc258..1999ec11706d 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -39,42 +39,6 @@ EXPORT_SYMBOL(ioremap_bot);	/* aka VMALLOC_END */
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
-ioremap_wt(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
-
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_wt);
-
-void __iomem *
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
@@ -92,12 +56,6 @@ ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
 EXPORT_SYMBOL(ioremap_prot);
 
 void __iomem *
-__ioremap(phys_addr_t addr, unsigned long size, unsigned long flags)
-{
-	return __ioremap_caller(addr, size, __pgprot(flags), __builtin_return_address(0));
-}
-
-void __iomem *
 __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
 {
 	unsigned long v, i;
@@ -171,7 +129,6 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 out:
 	return (void __iomem *) (v + ((unsigned long)addr & ~PAGE_MASK));
 }
-EXPORT_SYMBOL(__ioremap);
 
 void iounmap(volatile void __iomem *addr)
 {
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 194efc6f39fb..3ad921ac4862 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -204,42 +204,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-void __iomem * __ioremap(phys_addr_t addr, unsigned long size,
-			 unsigned long flags)
-{
-	return __ioremap_caller(addr, size, __pgprot(flags), __builtin_return_address(0));
-}
-
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
@@ -289,10 +253,7 @@ void iounmap(volatile void __iomem *token)
 	__iounmap(token);
 }
 
-EXPORT_SYMBOL(ioremap);
-EXPORT_SYMBOL(ioremap_wc);
 EXPORT_SYMBOL(ioremap_prot);
-EXPORT_SYMBOL(__ioremap);
 EXPORT_SYMBOL(__ioremap_at);
 EXPORT_SYMBOL(iounmap);
 EXPORT_SYMBOL(__iounmap);
-- 
2.13.3

