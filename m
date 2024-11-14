Return-Path: <linuxppc-dev+bounces-3183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C19C8B16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:52:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QQ73xLz304s;
	Thu, 14 Nov 2024 23:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588686;
	cv=none; b=blficLY/Nfh/UqmyIrOf5tqZ1QtiwTdaquDpR65AatOIFJZCpi95iunyzAmoYeE0y5q0qk/ahuCoog3Xc6uFtjjkSrp+LzYICHaY3aqkPoFjd902i6fWbf/plrXl4CqDm/7sesVPR6Qvyd2iw5s/IMmh9IEBEoEVIU5tPsfTHBY5DIy19nE3oOqSDvOtFG2AfuMFNYTKSPcn5YMRR5SNrsQ47sbk8vMArscJntZy2hSIdKWAcR4nJEgZpRC/l5tijRvqebaqSwQ25SuK/GprQ5ARhcIgPhZBNkVR5/e2JA/jVPIYybMSiI2mCxoRaa1aP9t5JxK8rqZHkDzacUxHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588686; c=relaxed/relaxed;
	bh=H8lyx8G3Z4+tVjH0lJsE7Fc3k15j/9ittWhBSHnJ06g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXsOPEo3q+M2E/gXzbX49aSQCkUWzdaVZYSD3gBdbhz2O27tjbXfRkgIC4ObGxCmsRz8pgS9hKeOuBjXJ2nrwItzeUiHlgoR7lEGom7og2SNeDs56fo3cxciMXDb3/9JwzoG5/tMeBPcvP5GVxVv6XVFYpZM4hq+88OhtpME6Zo5OuIhomelx1k45TkWQo1AslEvwI2jjQ6ftukT2KFrrOrhS8lg+K8aP06hP6RNbMCffAg8wcWbZr1A0K2k9LgVTEfygWVc+D/yen89UjmDPUdpZytQVDZW8Nb/zpSaFiK6KMcFKBrcc6mbDxsIKAadulGN8nGDWczJRJ7c5F2w7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qd5d06iE; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qd5d06iE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QN0LQSz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588681;
	bh=H8lyx8G3Z4+tVjH0lJsE7Fc3k15j/9ittWhBSHnJ06g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qd5d06iEzMp22mD8mJkUwimze70K0eIAzzlE1l+J8JIE4Nju/4fCf2owrQdN9+bGv
	 SNemrj5rY2YzoSyd1fL/ux58VM2+rD5Z8p3uzY4EwQBgvcH21IdltJnmQ05SvQebwc
	 KeYRPOF0adwSYZXIsL9gZfzhEhhNtCylzyGMGZpmuEL9kOFeNg//6HNK3zZnZn6PGg
	 KvoGfRPX0ubZkVVW7EdOU83NWnawUSUp8xebtQKueV4mxEmNgNmhVD2A/ZXSDDxYqC
	 spEEIh20z6x37X7Csqil0DYGjNz+uI+WSxLTqracd/VhA+BgjavW41IhHWsgygg6FN
	 S3uyeGMu7vVXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QK1B5nz4xPy;
	Thu, 14 Nov 2024 23:51:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 09/20] powerpc/io: Remove PPC_IO_WORKAROUNDS
Date: Thu, 14 Nov 2024 23:50:58 +1100
Message-ID: <20241114125111.599093-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The Cell blade support was the last user of PPC_IO_WORKAROUNDS, so they
can now be removed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/io-workarounds.h |  55 ------
 arch/powerpc/kernel/Makefile              |   2 -
 arch/powerpc/kernel/io-workarounds.c      | 197 ----------------------
 arch/powerpc/mm/ioremap.c                 |   9 -
 arch/powerpc/platforms/Kconfig            |   3 -
 5 files changed, 266 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/io-workarounds.h
 delete mode 100644 arch/powerpc/kernel/io-workarounds.c

diff --git a/arch/powerpc/include/asm/io-workarounds.h b/arch/powerpc/include/asm/io-workarounds.h
deleted file mode 100644
index 3cce499fbe27..000000000000
--- a/arch/powerpc/include/asm/io-workarounds.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Support PCI IO workaround
- *
- * (C) Copyright 2007-2008 TOSHIBA CORPORATION
- */
-
-#ifndef _IO_WORKAROUNDS_H
-#define _IO_WORKAROUNDS_H
-
-#ifdef CONFIG_PPC_IO_WORKAROUNDS
-#include <linux/io.h>
-#include <asm/pci-bridge.h>
-
-/* Bus info */
-struct iowa_bus {
-	struct pci_controller *phb;
-	struct ppc_pci_io *ops;
-	void   *private;
-};
-
-void iowa_register_bus(struct pci_controller *, struct ppc_pci_io *,
-		       int (*)(struct iowa_bus *, void *), void *);
-struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR);
-struct iowa_bus *iowa_pio_find_bus(unsigned long);
-
-extern struct ppc_pci_io spiderpci_ops;
-extern int spiderpci_iowa_init(struct iowa_bus *, void *);
-
-#define SPIDER_PCI_REG_BASE		0xd000
-#define SPIDER_PCI_REG_SIZE		0x1000
-#define SPIDER_PCI_VCI_CNTL_STAT	0x0110
-#define SPIDER_PCI_DUMMY_READ		0x0810
-#define SPIDER_PCI_DUMMY_READ_BASE	0x0814
-
-#endif
-
-#if defined(CONFIG_PPC_IO_WORKAROUNDS) && defined(CONFIG_PPC_INDIRECT_MMIO)
-extern bool io_workaround_inited;
-
-static inline bool iowa_is_active(void)
-{
-	return unlikely(io_workaround_inited);
-}
-#else
-static inline bool iowa_is_active(void)
-{
-	return false;
-}
-#endif
-
-void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
-			   pgprot_t prot, void *caller);
-
-#endif /* _IO_WORKAROUNDS_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index d6febd297e72..6ac621155ec3 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -152,8 +152,6 @@ obj-$(CONFIG_PCI_MSI)		+= msi.o
 obj-$(CONFIG_AUDIT)		+= audit.o
 obj64-$(CONFIG_AUDIT)		+= compat_audit.o
 
-obj-$(CONFIG_PPC_IO_WORKAROUNDS)	+= io-workarounds.o
-
 obj-y				+= trace/
 
 ifneq ($(CONFIG_PPC_INDIRECT_PIO),y)
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
deleted file mode 100644
index c877f074d174..000000000000
--- a/arch/powerpc/kernel/io-workarounds.c
+++ /dev/null
@@ -1,197 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Support PCI IO workaround
- *
- *  Copyright (C) 2006 Benjamin Herrenschmidt <benh@kernel.crashing.org>
- *		       IBM, Corp.
- *  (C) Copyright 2007-2008 TOSHIBA CORPORATION
- */
-#undef DEBUG
-
-#include <linux/kernel.h>
-#include <linux/sched/mm.h>	/* for init_mm */
-#include <linux/pgtable.h>
-
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/ppc-pci.h>
-#include <asm/io-workarounds.h>
-#include <asm/pte-walk.h>
-
-
-#define IOWA_MAX_BUS	8
-
-static struct iowa_bus iowa_busses[IOWA_MAX_BUS];
-static unsigned int iowa_bus_count;
-
-static struct iowa_bus *iowa_pci_find(unsigned long vaddr, unsigned long paddr)
-{
-	int i, j;
-	struct resource *res;
-	unsigned long vstart, vend;
-
-	for (i = 0; i < iowa_bus_count; i++) {
-		struct iowa_bus *bus = &iowa_busses[i];
-		struct pci_controller *phb = bus->phb;
-
-		if (vaddr) {
-			vstart = (unsigned long)phb->io_base_virt;
-			vend = vstart + phb->pci_io_size - 1;
-			if ((vaddr >= vstart) && (vaddr <= vend))
-				return bus;
-		}
-
-		if (paddr)
-			for (j = 0; j < 3; j++) {
-				res = &phb->mem_resources[j];
-				if (paddr >= res->start && paddr <= res->end)
-					return bus;
-			}
-	}
-
-	return NULL;
-}
-
-#ifdef CONFIG_PPC_INDIRECT_MMIO
-struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR addr)
-{
-	struct iowa_bus *bus;
-	int token;
-
-	token = PCI_GET_ADDR_TOKEN(addr);
-
-	if (token && token <= iowa_bus_count)
-		bus = &iowa_busses[token - 1];
-	else {
-		unsigned long vaddr, paddr;
-
-		vaddr = (unsigned long)PCI_FIX_ADDR(addr);
-		if (vaddr < PHB_IO_BASE || vaddr >= PHB_IO_END)
-			return NULL;
-
-		paddr = ppc_find_vmap_phys(vaddr);
-
-		bus = iowa_pci_find(vaddr, paddr);
-
-		if (bus == NULL)
-			return NULL;
-	}
-
-	return bus;
-}
-#else /* CONFIG_PPC_INDIRECT_MMIO */
-struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR addr)
-{
-	return NULL;
-}
-#endif /* !CONFIG_PPC_INDIRECT_MMIO */
-
-#ifdef CONFIG_PPC_INDIRECT_PIO
-struct iowa_bus *iowa_pio_find_bus(unsigned long port)
-{
-	unsigned long vaddr = (unsigned long)pci_io_base + port;
-	return iowa_pci_find(vaddr, 0);
-}
-#else
-struct iowa_bus *iowa_pio_find_bus(unsigned long port)
-{
-	return NULL;
-}
-#endif
-
-#define DEF_PCI_AC_RET(name, ret, at, al, space, aa)		\
-static ret iowa_##name at					\
-{								\
-	struct iowa_bus *bus;					\
-	bus = iowa_##space##_find_bus(aa);			\
-	if (bus && bus->ops && bus->ops->name)			\
-		return bus->ops->name al;			\
-	return __do_##name al;					\
-}
-
-#define DEF_PCI_AC_NORET(name, at, al, space, aa)		\
-static void iowa_##name at					\
-{								\
-	struct iowa_bus *bus;					\
-	bus = iowa_##space##_find_bus(aa);			\
-	if (bus && bus->ops && bus->ops->name) {		\
-		bus->ops->name al;				\
-		return;						\
-	}							\
-	__do_##name al;						\
-}
-
-#include <asm/io-defs.h>
-
-#undef DEF_PCI_AC_RET
-#undef DEF_PCI_AC_NORET
-
-static const struct ppc_pci_io iowa_pci_io = {
-
-#define DEF_PCI_AC_RET(name, ret, at, al, space, aa)	.name = iowa_##name,
-#define DEF_PCI_AC_NORET(name, at, al, space, aa)	.name = iowa_##name,
-
-#include <asm/io-defs.h>
-
-#undef DEF_PCI_AC_RET
-#undef DEF_PCI_AC_NORET
-
-};
-
-#ifdef CONFIG_PPC_INDIRECT_MMIO
-void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
-			   pgprot_t prot, void *caller)
-{
-	struct iowa_bus *bus;
-	void __iomem *res = __ioremap_caller(addr, size, prot, caller);
-	int busno;
-
-	bus = iowa_pci_find(0, (unsigned long)addr);
-	if (bus != NULL) {
-		busno = bus - iowa_busses;
-		PCI_SET_ADDR_TOKEN(res, busno + 1);
-	}
-	return res;
-}
-#endif /* !CONFIG_PPC_INDIRECT_MMIO */
-
-bool io_workaround_inited;
-
-/* Enable IO workaround */
-static void io_workaround_init(void)
-{
-	if (io_workaround_inited)
-		return;
-	ppc_pci_io = iowa_pci_io;
-	io_workaround_inited = true;
-}
-
-/* Register new bus to support workaround */
-void iowa_register_bus(struct pci_controller *phb, struct ppc_pci_io *ops,
-		       int (*initfunc)(struct iowa_bus *, void *), void *data)
-{
-	struct iowa_bus *bus;
-	struct device_node *np = phb->dn;
-
-	io_workaround_init();
-
-	if (iowa_bus_count >= IOWA_MAX_BUS) {
-		pr_err("IOWA:Too many pci bridges, "
-		       "workarounds disabled for %pOF\n", np);
-		return;
-	}
-
-	bus = &iowa_busses[iowa_bus_count];
-	bus->phb = phb;
-	bus->ops = ops;
-	bus->private = data;
-
-	if (initfunc)
-		if ((*initfunc)(bus, data))
-			return;
-
-	iowa_bus_count++;
-
-	pr_debug("IOWA:[%d]Add bus, %pOF.\n", iowa_bus_count-1, np);
-}
-
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 7b0afcabd89f..70b08bf3dd1f 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -4,7 +4,6 @@
 #include <linux/slab.h>
 #include <linux/mmzone.h>
 #include <linux/vmalloc.h>
-#include <asm/io-workarounds.h>
 
 unsigned long ioremap_bot;
 EXPORT_SYMBOL(ioremap_bot);
@@ -14,8 +13,6 @@ void __iomem *ioremap(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 EXPORT_SYMBOL(ioremap);
@@ -25,8 +22,6 @@ void __iomem *ioremap_wc(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 EXPORT_SYMBOL(ioremap_wc);
@@ -36,8 +31,6 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
 	void *caller = __builtin_return_address(0);
 
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
 
@@ -50,8 +43,6 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long flags)
 	if (pte_write(pte))
 		pte = pte_mkdirty(pte);
 
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
 	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
 }
 EXPORT_SYMBOL(ioremap_prot);
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index a454149ae02f..d11ade7cf7b3 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -189,9 +189,6 @@ config PPC_INDIRECT_PIO
 config PPC_INDIRECT_MMIO
 	bool
 
-config PPC_IO_WORKAROUNDS
-	bool
-
 source "drivers/cpufreq/Kconfig"
 
 menu "CPUIdle driver"
-- 
2.47.0


