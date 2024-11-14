Return-Path: <linuxppc-dev+bounces-3198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE399C8B7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sW1806z3041;
	Fri, 15 Nov 2024 00:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589887;
	cv=none; b=AghcrgybQFUKfcsvPpOjEve1fNS2akrq/faU7zDvbr1Z4fvIHhqnZzPLKBz4LUd0oqkkr5Y9giaYT+NGT7e2jL3LaBuxisQfOatwi69BMM/csspL7xU+SVkRgg1dGsruXJqX2jmY2/mr9ZekfwuS+4H8zROxYPLR/YgHc/L68WJZsJKPIBG0i3NU6GJYejjvP7DHTc+w3FbIP3AyZHb5a06T3f/uoyjPLHW+It7tFKRqjyDbciYjBEKPAiBUz8CNY0/0nYLhXqdNw4vA9JvG+fAxWr8JeM7Jnf9du08PwrRQ0xhptwr+Kq+EA60+482toh/EnSzFJ9FyCbj4mgiwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589887; c=relaxed/relaxed;
	bh=k8/vfBFFvEHplchFubXAH9E7dgE8c/AD23cYGz7s4z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JV3x42511Rxd/bZOfXhblR5Huh+gt+zUPVNn4d5noouZ03QF4JGFso0hJn7V+b4I1OBo3hYD+G1Qes4Ww/brf6NSznjuePzQRlSnraQpYH+zecUUeSNmdXmc/QHgNaebF+DzUtAyo47wKX2Ht57iw+clU3V9a2/K2hbh7Pe6RAhCSQnq92830KaPwKqjigI2qhLFFcMgNRSfW6yLInz7s41y7vsZolGb6URSodCWNT0bbJMQ7yqOBJpYrLOv+VzcC2GBZJn2PBLdCaG0uN6QupNvfkHa3kXaVgsG7UZIGnnYQKUpd/Xtyrbut3dQQAb2VANy3HDG/8EW+3sXPRKtcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q6uqBo11; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q6uqBo11;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sT1HKjz300g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589881;
	bh=k8/vfBFFvEHplchFubXAH9E7dgE8c/AD23cYGz7s4z0=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6uqBo11lxbYXbMDCkTPXyfsA912UxwVYrbmF3M5V9gVTIY16jf8iwU/imwfuIZh9
	 IVA+WbJkR/3VgCVZ9TIOFWjYaoiS3/aI9TkGhVHZX3Y7HN8cxjhB6px7dEQ4AH/GIx
	 qFscEIT5ZeA4jEEGKXq7FFSmpbyZKPJJwY0TrFqr1K6sbPle7lcrh+RKr2M/BolySs
	 KlYHZ82IZEuQ92bLkH4mZGH0Rn56hgUI3JEH7BU/dON7a1qERbS49qS+G1OCX6l+lg
	 WdmdJet3hArJfN/qBNLs8uXZ3Iltw7f0oPg1AJ51mXAWXXH9zTXlkXXP0LF7SD+ITY
	 jv2xSqd/5wpOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sP3QPqz4wxx;
	Fri, 15 Nov 2024 00:11:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Date: Fri, 15 Nov 2024 00:11:04 +1100
Message-ID: <20241114131114.602234-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

CHRP (Common Hardware Reference Platform) was a standard developed by
IBM & Apple for PowerPC-based systems.

The standard was used in the development of some machines but never
gained wide spread adoption.

The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
some from Motorola? No Apple machines should be affected.

All of those mentioned above are over or nearing 20 years old, and seem
to have no active users.

So remove the CHRP support. If there's interest in still supporting some
of the machines that can be brought back from the git history.

Note there are still some references to CHRP/chrp in various comments
and some in the code, because later standards (eg. RPA, PAPR) used some
elements of CHRP or copied the CHRP behaviour. These will need to be
cleaned up on a case-by-case basis to either refer to newer standards or
left as-is when that's correct.

The CHRP code was copied from arch/ppc, and before that it mostly
predates git, so the original authorship is largely lost. If anyone
wrote any of this code and would like a CREDITS entry just let me know.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig            |   1 -
 arch/powerpc/platforms/Makefile           |   1 -
 arch/powerpc/platforms/chrp/Kconfig       |  16 -
 arch/powerpc/platforms/chrp/Makefile      |   4 -
 arch/powerpc/platforms/chrp/chrp.h        |  11 -
 arch/powerpc/platforms/chrp/gg2.h         |  61 ---
 arch/powerpc/platforms/chrp/nvram.c       |  96 ----
 arch/powerpc/platforms/chrp/pci.c         | 387 --------------
 arch/powerpc/platforms/chrp/pegasos_eth.c | 204 --------
 arch/powerpc/platforms/chrp/setup.c       | 586 ----------------------
 arch/powerpc/platforms/chrp/smp.c         |  54 --
 arch/powerpc/platforms/chrp/time.c        | 159 ------
 12 files changed, 1580 deletions(-)
 delete mode 100644 arch/powerpc/platforms/chrp/Kconfig
 delete mode 100644 arch/powerpc/platforms/chrp/Makefile
 delete mode 100644 arch/powerpc/platforms/chrp/chrp.h
 delete mode 100644 arch/powerpc/platforms/chrp/gg2.h
 delete mode 100644 arch/powerpc/platforms/chrp/nvram.c
 delete mode 100644 arch/powerpc/platforms/chrp/pci.c
 delete mode 100644 arch/powerpc/platforms/chrp/pegasos_eth.c
 delete mode 100644 arch/powerpc/platforms/chrp/setup.c
 delete mode 100644 arch/powerpc/platforms/chrp/smp.c
 delete mode 100644 arch/powerpc/platforms/chrp/time.c

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index a454149ae02f..6c10a7241195 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -3,7 +3,6 @@ menu "Platform support"
 
 source "arch/powerpc/platforms/powernv/Kconfig"
 source "arch/powerpc/platforms/pseries/Kconfig"
-source "arch/powerpc/platforms/chrp/Kconfig"
 source "arch/powerpc/platforms/512x/Kconfig"
 source "arch/powerpc/platforms/52xx/Kconfig"
 source "arch/powerpc/platforms/powermac/Kconfig"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 3cee4a842736..662652192a6f 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -3,7 +3,6 @@
 obj-$(CONFIG_FSL_ULI1575)	+= fsl_uli1575.o
 
 obj-$(CONFIG_PPC_PMAC)		+= powermac/
-obj-$(CONFIG_PPC_CHRP)		+= chrp/
 obj-$(CONFIG_44x)		+= 44x/
 obj-$(CONFIG_PPC_MPC512x)	+= 512x/
 obj-$(CONFIG_PPC_MPC52xx)	+= 52xx/
diff --git a/arch/powerpc/platforms/chrp/Kconfig b/arch/powerpc/platforms/chrp/Kconfig
deleted file mode 100644
index ff30ed579a39..000000000000
--- a/arch/powerpc/platforms/chrp/Kconfig
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config PPC_CHRP
-	bool "Common Hardware Reference Platform (CHRP) based machines"
-	depends on PPC_BOOK3S_32
-	select HAVE_PCSPKR_PLATFORM
-	select MPIC
-	select PPC_I8259
-	select PPC_INDIRECT_PCI
-	select PPC_RTAS
-	select PPC_RTAS_DAEMON
-	select RTAS_ERROR_LOGGING
-	select PPC_MPC106
-	select PPC_UDBG_16550
-	select PPC_HASH_MMU_NATIVE
-	select FORCE_PCI
-	default y
diff --git a/arch/powerpc/platforms/chrp/Makefile b/arch/powerpc/platforms/chrp/Makefile
deleted file mode 100644
index 05639db9a33f..000000000000
--- a/arch/powerpc/platforms/chrp/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y				+= setup.o time.o pegasos_eth.o pci.o
-obj-$(CONFIG_SMP)		+= smp.o
-obj-$(CONFIG_NVRAM:m=y)		+= nvram.o
diff --git a/arch/powerpc/platforms/chrp/chrp.h b/arch/powerpc/platforms/chrp/chrp.h
deleted file mode 100644
index 6ff4631d9db4..000000000000
--- a/arch/powerpc/platforms/chrp/chrp.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Declarations of CHRP platform-specific things.
- */
-
-extern void chrp_nvram_init(void);
-extern void chrp_get_rtc_time(struct rtc_time *);
-extern int chrp_set_rtc_time(struct rtc_time *);
-extern long chrp_time_init(void);
-
-extern void chrp_find_bridges(void);
diff --git a/arch/powerpc/platforms/chrp/gg2.h b/arch/powerpc/platforms/chrp/gg2.h
deleted file mode 100644
index 341ae55b99fb..000000000000
--- a/arch/powerpc/platforms/chrp/gg2.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- *  include/asm-ppc/gg2.h -- VLSI VAS96011/12 `Golden Gate 2' register definitions
- *
- *  Copyright (C) 1997 Geert Uytterhoeven
- *
- *  This file is based on the following documentation:
- *
- *	The VAS96011/12 Chipset, Data Book, Edition 1.0
- *	VLSI Technology, Inc.
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive
- *  for more details.
- */
-
-#ifndef _ASMPPC_GG2_H
-#define _ASMPPC_GG2_H
-
-    /*
-     *  Memory Map (CHRP mode)
-     */
-
-#define GG2_PCI_MEM_BASE	0xc0000000	/* Peripheral memory space */
-#define GG2_ISA_MEM_BASE	0xf7000000	/* Peripheral memory alias */
-#define GG2_ISA_IO_BASE		0xf8000000	/* Peripheral I/O space */
-#define GG2_PCI_CONFIG_BASE	0xfec00000	/* PCI configuration space */
-#define GG2_INT_ACK_SPECIAL	0xfec80000	/* Interrupt acknowledge and */
-						/* special PCI cycles */
-#define GG2_ROM_BASE0		0xff000000	/* ROM bank 0 */
-#define GG2_ROM_BASE1		0xff800000	/* ROM bank 1 */
-
-
-    /*
-     *  GG2 specific PCI Registers
-     */
-
-extern void __iomem *gg2_pci_config_base;	/* kernel virtual address */
-
-#define GG2_PCI_BUSNO		0x40	/* Bus number */
-#define GG2_PCI_SUBBUSNO	0x41	/* Subordinate bus number */
-#define GG2_PCI_DISCCTR		0x42	/* Disconnect counter */
-#define GG2_PCI_PPC_CTRL	0x50	/* PowerPC interface control register */
-#define GG2_PCI_ADDR_MAP	0x5c	/* Address map */
-#define GG2_PCI_PCI_CTRL	0x60	/* PCI interface control register */
-#define GG2_PCI_ROM_CTRL	0x70	/* ROM interface control register */
-#define GG2_PCI_ROM_TIME	0x74	/* ROM timing */
-#define GG2_PCI_CC_CTRL		0x80	/* Cache controller control register */
-#define GG2_PCI_DRAM_BANK0	0x90	/* Control register for DRAM bank #0 */
-#define GG2_PCI_DRAM_BANK1	0x94	/* Control register for DRAM bank #1 */
-#define GG2_PCI_DRAM_BANK2	0x98	/* Control register for DRAM bank #2 */
-#define GG2_PCI_DRAM_BANK3	0x9c	/* Control register for DRAM bank #3 */
-#define GG2_PCI_DRAM_BANK4	0xa0	/* Control register for DRAM bank #4 */
-#define GG2_PCI_DRAM_BANK5	0xa4	/* Control register for DRAM bank #5 */
-#define GG2_PCI_DRAM_TIME0	0xb0	/* Timing parameters set #0 */
-#define GG2_PCI_DRAM_TIME1	0xb4	/* Timing parameters set #1 */
-#define GG2_PCI_DRAM_CTRL	0xc0	/* DRAM control */
-#define GG2_PCI_ERR_CTRL	0xd0	/* Error control register */
-#define GG2_PCI_ERR_STATUS	0xd4	/* Error status register */
-					/* Cleared when read */
-
-#endif /* _ASMPPC_GG2_H */
diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
deleted file mode 100644
index d3bf56a46656..000000000000
--- a/arch/powerpc/platforms/chrp/nvram.c
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  c 2001 PPC 64 Team, IBM Corp
- *
- * /dev/nvram driver for PPC
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/spinlock.h>
-#include <linux/uaccess.h>
-#include <linux/of.h>
-#include <asm/machdep.h>
-#include <asm/rtas.h>
-#include "chrp.h"
-
-static unsigned int nvram_size;
-static unsigned char nvram_buf[4];
-static DEFINE_SPINLOCK(nvram_lock);
-
-static unsigned char chrp_nvram_read_val(int addr)
-{
-	unsigned int done;
-	unsigned long flags;
-	unsigned char ret;
-
-	if (addr >= nvram_size) {
-		printk(KERN_DEBUG "%s: read addr %d > nvram_size %u\n",
-		       current->comm, addr, nvram_size);
-		return 0xff;
-	}
-	spin_lock_irqsave(&nvram_lock, flags);
-	if ((rtas_call(rtas_function_token(RTAS_FN_NVRAM_FETCH), 3, 2, &done, addr,
-		       __pa(nvram_buf), 1) != 0) || 1 != done)
-		ret = 0xff;
-	else
-		ret = nvram_buf[0];
-	spin_unlock_irqrestore(&nvram_lock, flags);
-
-	return ret;
-}
-
-static void chrp_nvram_write_val(int addr, unsigned char val)
-{
-	unsigned int done;
-	unsigned long flags;
-
-	if (addr >= nvram_size) {
-		printk(KERN_DEBUG "%s: write addr %d > nvram_size %u\n",
-		       current->comm, addr, nvram_size);
-		return;
-	}
-	spin_lock_irqsave(&nvram_lock, flags);
-	nvram_buf[0] = val;
-	if ((rtas_call(rtas_function_token(RTAS_FN_NVRAM_STORE), 3, 2, &done, addr,
-		       __pa(nvram_buf), 1) != 0) || 1 != done)
-		printk(KERN_DEBUG "rtas IO error storing 0x%02x at %d", val, addr);
-	spin_unlock_irqrestore(&nvram_lock, flags);
-}
-
-static ssize_t chrp_nvram_size(void)
-{
-	return nvram_size;
-}
-
-void __init chrp_nvram_init(void)
-{
-	struct device_node *nvram;
-	const __be32 *nbytes_p;
-	unsigned int proplen;
-
-	nvram = of_find_node_by_type(NULL, "nvram");
-	if (nvram == NULL)
-		return;
-
-	nbytes_p = of_get_property(nvram, "#bytes", &proplen);
-	if (nbytes_p == NULL || proplen != sizeof(unsigned int)) {
-		of_node_put(nvram);
-		return;
-	}
-
-	nvram_size = be32_to_cpup(nbytes_p);
-
-	printk(KERN_INFO "CHRP nvram contains %u bytes\n", nvram_size);
-	of_node_put(nvram);
-
-	ppc_md.nvram_read_val  = chrp_nvram_read_val;
-	ppc_md.nvram_write_val = chrp_nvram_write_val;
-	ppc_md.nvram_size      = chrp_nvram_size;
-
-	return;
-}
-
-MODULE_DESCRIPTION("PPC NVRAM device driver");
-MODULE_LICENSE("GPL v2");
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
deleted file mode 100644
index 428fd2a7b3ee..000000000000
--- a/arch/powerpc/platforms/chrp/pci.c
+++ /dev/null
@@ -1,387 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * CHRP pci routines.
- */
-
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/delay.h>
-#include <linux/string.h>
-#include <linux/init.h>
-#include <linux/pgtable.h>
-#include <linux/of_address.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-#include <asm/hydra.h>
-#include <asm/machdep.h>
-#include <asm/sections.h>
-#include <asm/pci-bridge.h>
-#include <asm/grackle.h>
-#include <asm/rtas.h>
-
-#include "chrp.h"
-#include "gg2.h"
-
-/* LongTrail */
-void __iomem *gg2_pci_config_base;
-
-/*
- * The VLSI Golden Gate II has only 512K of PCI configuration space, so we
- * limit the bus number to 3 bits
- */
-
-static int gg2_read_config(struct pci_bus *bus, unsigned int devfn, int off,
-			   int len, u32 *val)
-{
-	volatile void __iomem *cfg_data;
-	struct pci_controller *hose = pci_bus_to_host(bus);
-
-	if (bus->number > 7)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	/*
-	 * Note: the caller has already checked that off is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	cfg_data = hose->cfg_data + ((bus->number<<16) | (devfn<<8) | off);
-	switch (len) {
-	case 1:
-		*val =  in_8(cfg_data);
-		break;
-	case 2:
-		*val = in_le16(cfg_data);
-		break;
-	default:
-		*val = in_le32(cfg_data);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int gg2_write_config(struct pci_bus *bus, unsigned int devfn, int off,
-			    int len, u32 val)
-{
-	volatile void __iomem *cfg_data;
-	struct pci_controller *hose = pci_bus_to_host(bus);
-
-	if (bus->number > 7)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	/*
-	 * Note: the caller has already checked that off is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	cfg_data = hose->cfg_data + ((bus->number<<16) | (devfn<<8) | off);
-	switch (len) {
-	case 1:
-		out_8(cfg_data, val);
-		break;
-	case 2:
-		out_le16(cfg_data, val);
-		break;
-	default:
-		out_le32(cfg_data, val);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops gg2_pci_ops =
-{
-	.read = gg2_read_config,
-	.write = gg2_write_config,
-};
-
-/*
- * Access functions for PCI config space using RTAS calls.
- */
-static int rtas_read_config(struct pci_bus *bus, unsigned int devfn, int offset,
-			    int len, u32 *val)
-{
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	unsigned long addr = (offset & 0xff) | ((devfn & 0xff) << 8)
-		| (((bus->number - hose->first_busno) & 0xff) << 16)
-		| (hose->global_number << 24);
-        int ret = -1;
-	int rval;
-
-	rval = rtas_call(rtas_function_token(RTAS_FN_READ_PCI_CONFIG), 2, 2, &ret, addr, len);
-	*val = ret;
-	return rval? PCIBIOS_DEVICE_NOT_FOUND: PCIBIOS_SUCCESSFUL;
-}
-
-static int rtas_write_config(struct pci_bus *bus, unsigned int devfn, int offset,
-			     int len, u32 val)
-{
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	unsigned long addr = (offset & 0xff) | ((devfn & 0xff) << 8)
-		| (((bus->number - hose->first_busno) & 0xff) << 16)
-		| (hose->global_number << 24);
-	int rval;
-
-	rval = rtas_call(rtas_function_token(RTAS_FN_WRITE_PCI_CONFIG), 3, 1, NULL,
-			 addr, len, val);
-	return rval? PCIBIOS_DEVICE_NOT_FOUND: PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops rtas_pci_ops =
-{
-	.read = rtas_read_config,
-	.write = rtas_write_config,
-};
-
-volatile struct Hydra __iomem *Hydra = NULL;
-
-static int __init hydra_init(void)
-{
-	struct device_node *np;
-	struct resource r;
-
-	np = of_find_node_by_name(NULL, "mac-io");
-	if (np == NULL || of_address_to_resource(np, 0, &r)) {
-		of_node_put(np);
-		return 0;
-	}
-	of_node_put(np);
-	Hydra = ioremap(r.start, resource_size(&r));
-	printk("Hydra Mac I/O at %llx\n", (unsigned long long)r.start);
-	printk("Hydra Feature_Control was %x",
-	       in_le32(&Hydra->Feature_Control));
-	out_le32(&Hydra->Feature_Control, (HYDRA_FC_SCC_CELL_EN |
-					   HYDRA_FC_SCSI_CELL_EN |
-					   HYDRA_FC_SCCA_ENABLE |
-					   HYDRA_FC_SCCB_ENABLE |
-					   HYDRA_FC_ARB_BYPASS |
-					   HYDRA_FC_MPIC_ENABLE |
-					   HYDRA_FC_SLOW_SCC_PCLK |
-					   HYDRA_FC_MPIC_IS_MASTER));
-	printk(", now %x\n", in_le32(&Hydra->Feature_Control));
-	return 1;
-}
-
-#define PRG_CL_RESET_VALID 0x00010000
-
-static void __init
-setup_python(struct pci_controller *hose, struct device_node *dev)
-{
-	u32 __iomem *reg;
-	u32 val;
-	struct resource r;
-
-	if (of_address_to_resource(dev, 0, &r)) {
-		printk(KERN_ERR "No address for Python PCI controller\n");
-		return;
-	}
-
-	/* Clear the magic go-slow bit */
-	reg = ioremap(r.start + 0xf6000, 0x40);
-	BUG_ON(!reg); 
-	val = in_be32(&reg[12]);
-	if (val & PRG_CL_RESET_VALID) {
-		out_be32(&reg[12], val & ~PRG_CL_RESET_VALID);
-		in_be32(&reg[12]);
-	}
-	iounmap(reg);
-
-	setup_indirect_pci(hose, r.start + 0xf8000, r.start + 0xf8010, 0);
-}
-
-/* Marvell Discovery II based Pegasos 2 */
-static void __init setup_peg2(struct pci_controller *hose, struct device_node *dev)
-{
-	struct device_node *root = of_find_node_by_path("/");
-	struct device_node *rtas;
-
-	rtas = of_find_node_by_name (root, "rtas");
-	if (rtas) {
-		hose->ops = &rtas_pci_ops;
-		of_node_put(rtas);
-	} else {
-		printk ("RTAS supporting Pegasos OF not found, please upgrade"
-			" your firmware\n");
-	}
-	pci_add_flags(PCI_REASSIGN_ALL_BUS);
-	/* keep the reference to the root node */
-}
-
-void __init
-chrp_find_bridges(void)
-{
-	struct device_node *dev;
-	const int *bus_range;
-	int len, index = -1;
-	struct pci_controller *hose;
-	const unsigned int *dma;
-	const char *model, *machine;
-	int is_longtrail = 0, is_mot = 0, is_pegasos = 0;
-	struct device_node *root = of_find_node_by_path("/");
-	struct resource r;
-	/*
-	 * The PCI host bridge nodes on some machines don't have
-	 * properties to adequately identify them, so we have to
-	 * look at what sort of machine this is as well.
-	 */
-	machine = of_get_property(root, "model", NULL);
-	if (machine != NULL) {
-		is_longtrail = strncmp(machine, "IBM,LongTrail", 13) == 0;
-		is_mot = strncmp(machine, "MOT", 3) == 0;
-		if (strncmp(machine, "Pegasos2", 8) == 0)
-			is_pegasos = 2;
-		else if (strncmp(machine, "Pegasos", 7) == 0)
-			is_pegasos = 1;
-	}
-	for_each_child_of_node(root, dev) {
-		if (!of_node_is_type(dev, "pci"))
-			continue;
-		++index;
-		/* The GG2 bridge on the LongTrail doesn't have an address */
-		if (of_address_to_resource(dev, 0, &r) && !is_longtrail) {
-			printk(KERN_WARNING "Can't use %pOF: no address\n",
-			       dev);
-			continue;
-		}
-		bus_range = of_get_property(dev, "bus-range", &len);
-		if (bus_range == NULL || len < 2 * sizeof(int)) {
-			printk(KERN_WARNING "Can't get bus-range for %pOF\n",
-				dev);
-			continue;
-		}
-		if (bus_range[1] == bus_range[0])
-			printk(KERN_INFO "PCI bus %d", bus_range[0]);
-		else
-			printk(KERN_INFO "PCI buses %d..%d",
-			       bus_range[0], bus_range[1]);
-		printk(" controlled by %pOF", dev);
-		if (!is_longtrail)
-			printk(" at %llx", (unsigned long long)r.start);
-		printk("\n");
-
-		hose = pcibios_alloc_controller(dev);
-		if (!hose) {
-			printk("Can't allocate PCI controller structure for %pOF\n",
-				dev);
-			continue;
-		}
-		hose->first_busno = hose->self_busno = bus_range[0];
-		hose->last_busno = bus_range[1];
-
-		model = of_get_property(dev, "model", NULL);
-		if (model == NULL)
-			model = "<none>";
-		if (strncmp(model, "IBM, Python", 11) == 0) {
-			setup_python(hose, dev);
-		} else if (is_mot
-			   || strncmp(model, "Motorola, Grackle", 17) == 0) {
-			setup_grackle(hose);
-		} else if (is_longtrail) {
-			void __iomem *p = ioremap(GG2_PCI_CONFIG_BASE, 0x80000);
-			hose->ops = &gg2_pci_ops;
-			hose->cfg_data = p;
-			gg2_pci_config_base = p;
-		} else if (is_pegasos == 1) {
-			setup_indirect_pci(hose, 0xfec00cf8, 0xfee00cfc, 0);
-		} else if (is_pegasos == 2) {
-			setup_peg2(hose, dev);
-		} else if (!strncmp(model, "IBM,CPC710", 10)) {
-			setup_indirect_pci(hose,
-					   r.start + 0x000f8000,
-					   r.start + 0x000f8010,
-					   0);
-			if (index == 0) {
-				dma = of_get_property(dev, "system-dma-base",
-							&len);
-				if (dma && len >= sizeof(*dma)) {
-					dma = (unsigned int *)
-						(((unsigned long)dma) +
-						len - sizeof(*dma));
-						pci_dram_offset = *dma;
-				}
-			}
-		} else {
-			printk("No methods for %pOF (model %s), using RTAS\n",
-			       dev, model);
-			hose->ops = &rtas_pci_ops;
-		}
-
-		pci_process_bridge_OF_ranges(hose, dev, index == 0);
-
-		/* check the first bridge for a property that we can
-		   use to set pci_dram_offset */
-		dma = of_get_property(dev, "ibm,dma-ranges", &len);
-		if (index == 0 && dma != NULL && len >= 6 * sizeof(*dma)) {
-			pci_dram_offset = dma[2] - dma[3];
-			printk("pci_dram_offset = %lx\n", pci_dram_offset);
-		}
-	}
-	of_node_put(root);
-
-	/*
-	 *  "Temporary" fixes for PCI devices.
-	 *  -- Geert
-	 */
-	hydra_init();		/* Mac I/O */
-
-	pci_create_OF_bus_map();
-}
-
-/* SL82C105 IDE Control/Status Register */
-#define SL82C105_IDECSR                0x40
-
-/* Fixup for Winbond ATA quirk, required for briq mostly because the
- * 8259 is configured for level sensitive IRQ 14 and so wants the
- * ATA controller to be set to fully native mode or bad things
- * will happen.
- */
-static void chrp_pci_fixup_winbond_ata(struct pci_dev *sl82c105)
-{
-	u8 progif;
-
-	/* If non-briq machines need that fixup too, please speak up */
-	if (!machine_is(chrp) || _chrp_type != _CHRP_briq)
-		return;
-
-	if ((sl82c105->class & 5) != 5) {
-		printk("W83C553: Switching SL82C105 IDE to PCI native mode\n");
-		/* Enable SL82C105 PCI native IDE mode */
-		pci_read_config_byte(sl82c105, PCI_CLASS_PROG, &progif);
-		pci_write_config_byte(sl82c105, PCI_CLASS_PROG, progif | 0x05);
-		sl82c105->class |= 0x05;
-		/* Disable SL82C105 second port */
-		pci_write_config_word(sl82c105, SL82C105_IDECSR, 0x0003);
-		/* Clear IO BARs, they will be reassigned */
-		pci_write_config_dword(sl82c105, PCI_BASE_ADDRESS_0, 0);
-		pci_write_config_dword(sl82c105, PCI_BASE_ADDRESS_1, 0);
-		pci_write_config_dword(sl82c105, PCI_BASE_ADDRESS_2, 0);
-		pci_write_config_dword(sl82c105, PCI_BASE_ADDRESS_3, 0);
-	}
-}
-DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_WINBOND, PCI_DEVICE_ID_WINBOND_82C105,
-			chrp_pci_fixup_winbond_ata);
-
-/* Pegasos2 firmware version 20040810 configures the built-in IDE controller
- * in legacy mode, but sets the PCI registers to PCI native mode.
- * The chip can only operate in legacy mode, so force the PCI class into legacy
- * mode as well. The same fixup must be done to the class-code property in
- * the IDE node /pci@80000000/ide@C,1
- */
-static void chrp_pci_fixup_vt8231_ata(struct pci_dev *viaide)
-{
-	u8 progif;
-	struct pci_dev *viaisa;
-
-	if (!machine_is(chrp) || _chrp_type != _CHRP_Pegasos)
-		return;
-	if (viaide->irq != 14)
-		return;
-
-	viaisa = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8231, NULL);
-	if (!viaisa)
-		return;
-	dev_info(&viaide->dev, "Fixing VIA IDE, force legacy mode on\n");
-
-	pci_read_config_byte(viaide, PCI_CLASS_PROG, &progif);
-	pci_write_config_byte(viaide, PCI_CLASS_PROG, progif & ~0x5);
-	viaide->class &= ~0x5;
-
-	pci_dev_put(viaisa);
-}
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C586_1, chrp_pci_fixup_vt8231_ata);
diff --git a/arch/powerpc/platforms/chrp/pegasos_eth.c b/arch/powerpc/platforms/chrp/pegasos_eth.c
deleted file mode 100644
index 6f4a41a9352a..000000000000
--- a/arch/powerpc/platforms/chrp/pegasos_eth.c
+++ /dev/null
@@ -1,204 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  Copyright (C) 2005 Sven Luther <sl@bplan-gmbh.de>
- *  Thanks to :
- *	Dale Farnsworth <dale@farnsworth.org>
- *	Mark A. Greer <mgreer@mvista.com>
- *	Nicolas DET <nd@bplan-gmbh.de>
- *	Benjamin Herrenschmidt <benh@kernel.crashing.org>
- *  And anyone else who helped me on this.
- */
-
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/ioport.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/pci.h>
-
-#define PEGASOS2_MARVELL_REGBASE 		(0xf1000000)
-#define PEGASOS2_MARVELL_REGSIZE 		(0x00004000)
-#define PEGASOS2_SRAM_BASE 			(0xf2000000)
-#define PEGASOS2_SRAM_SIZE			(256*1024)
-
-#define PEGASOS2_SRAM_BASE_ETH_PORT0			(PEGASOS2_SRAM_BASE)
-#define PEGASOS2_SRAM_BASE_ETH_PORT1			(PEGASOS2_SRAM_BASE_ETH_PORT0 + (PEGASOS2_SRAM_SIZE / 2) )
-
-#define PEGASOS2_SRAM_RXRING_SIZE		(PEGASOS2_SRAM_SIZE/4)
-#define PEGASOS2_SRAM_TXRING_SIZE		(PEGASOS2_SRAM_SIZE/4)
-
-#undef BE_VERBOSE
-
-#define MV64340_BASE_ADDR_ENABLE                                    0x278
-#define MV64340_INTEGRATED_SRAM_BASE_ADDR                           0x268
-#define MV64340_SRAM_CONFIG                                         0x380
-
-static struct resource mv643xx_eth_shared_resources[] = {
-	[0] = {
-		.name	= "ethernet shared base",
-		.start	= 0xf1000000 + MV643XX_ETH_SHARED_REGS,
-		.end	= 0xf1000000 + MV643XX_ETH_SHARED_REGS +
-					MV643XX_ETH_SHARED_REGS_SIZE - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device mv643xx_eth_shared_device = {
-	.name		= MV643XX_ETH_SHARED_NAME,
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(mv643xx_eth_shared_resources),
-	.resource	= mv643xx_eth_shared_resources,
-};
-
-/*
- * The orion mdio driver only covers shared + 0x4 up to shared + 0x84 - 1
- */
-static struct resource mv643xx_eth_mvmdio_resources[] = {
-	[0] = {
-		.name	= "ethernet mdio base",
-		.start	= 0xf1000000 + MV643XX_ETH_SHARED_REGS + 0x4,
-		.end	= 0xf1000000 + MV643XX_ETH_SHARED_REGS + 0x83,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device mv643xx_eth_mvmdio_device = {
-	.name		= "orion-mdio",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(mv643xx_eth_mvmdio_resources),
-	.resource	= mv643xx_eth_mvmdio_resources,
-};
-
-static struct resource mv643xx_eth_port1_resources[] = {
-	[0] = {
-		.name	= "eth port1 irq",
-		.start	= 9,
-		.end	= 9,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-static struct mv643xx_eth_platform_data eth_port1_pd = {
-	.shared		= &mv643xx_eth_shared_device,
-	.port_number	= 1,
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(7),
-
-	.tx_sram_addr = PEGASOS2_SRAM_BASE_ETH_PORT1,
-	.tx_sram_size = PEGASOS2_SRAM_TXRING_SIZE,
-	.tx_queue_size = PEGASOS2_SRAM_TXRING_SIZE/16,
-
-	.rx_sram_addr = PEGASOS2_SRAM_BASE_ETH_PORT1 + PEGASOS2_SRAM_TXRING_SIZE,
-	.rx_sram_size = PEGASOS2_SRAM_RXRING_SIZE,
-	.rx_queue_size = PEGASOS2_SRAM_RXRING_SIZE/16,
-};
-
-static struct platform_device eth_port1_device = {
-	.name		= MV643XX_ETH_NAME,
-	.id		= 1,
-	.num_resources	= ARRAY_SIZE(mv643xx_eth_port1_resources),
-	.resource	= mv643xx_eth_port1_resources,
-	.dev = {
-		.platform_data = &eth_port1_pd,
-	},
-};
-
-static struct platform_device *mv643xx_eth_pd_devs[] __initdata = {
-	&mv643xx_eth_shared_device,
-	&mv643xx_eth_mvmdio_device,
-	&eth_port1_device,
-};
-
-/***********/
-/***********/
-#define MV_READ(offset,val) 	{ val = readl(mv643xx_reg_base + offset); }
-#define MV_WRITE(offset,data) writel(data, mv643xx_reg_base + offset)
-
-static void __iomem *mv643xx_reg_base;
-
-static int __init Enable_SRAM(void)
-{
-	u32 ALong;
-
-	if (mv643xx_reg_base == NULL)
-		mv643xx_reg_base = ioremap(PEGASOS2_MARVELL_REGBASE,
-					PEGASOS2_MARVELL_REGSIZE);
-
-	if (mv643xx_reg_base == NULL)
-		return -ENOMEM;
-
-#ifdef BE_VERBOSE
-	printk("Pegasos II/Marvell MV64361: register remapped from %p to %p\n",
-		(void *)PEGASOS2_MARVELL_REGBASE, (void *)mv643xx_reg_base);
-#endif
-
-	MV_WRITE(MV64340_SRAM_CONFIG, 0);
-
-	MV_WRITE(MV64340_INTEGRATED_SRAM_BASE_ADDR, PEGASOS2_SRAM_BASE >> 16);
-
-	MV_READ(MV64340_BASE_ADDR_ENABLE, ALong);
-	ALong &= ~(1 << 19);
-	MV_WRITE(MV64340_BASE_ADDR_ENABLE, ALong);
-
-	ALong = 0x02;
-	ALong |= PEGASOS2_SRAM_BASE & 0xffff0000;
-	MV_WRITE(MV643XX_ETH_BAR_4, ALong);
-
-	MV_WRITE(MV643XX_ETH_SIZE_REG_4, (PEGASOS2_SRAM_SIZE-1) & 0xffff0000);
-
-	MV_READ(MV643XX_ETH_BASE_ADDR_ENABLE_REG, ALong);
-	ALong &= ~(1 << 4);
-	MV_WRITE(MV643XX_ETH_BASE_ADDR_ENABLE_REG, ALong);
-
-#ifdef BE_VERBOSE
-	printk("Pegasos II/Marvell MV64361: register unmapped\n");
-	printk("Pegasos II/Marvell MV64361: SRAM at %p, size=%x\n", (void*) PEGASOS2_SRAM_BASE, PEGASOS2_SRAM_SIZE);
-#endif
-
-	iounmap(mv643xx_reg_base);
-	mv643xx_reg_base = NULL;
-
-	return 1;
-}
-
-
-/***********/
-/***********/
-static int __init mv643xx_eth_add_pds(void)
-{
-	int ret = 0;
-	static struct pci_device_id pci_marvell_mv64360[] = {
-		{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL, PCI_DEVICE_ID_MARVELL_MV64360) },
-		{ }
-	};
-
-#ifdef BE_VERBOSE
-	printk("Pegasos II/Marvell MV64361: init\n");
-#endif
-
-	if (pci_dev_present(pci_marvell_mv64360)) {
-		ret = platform_add_devices(mv643xx_eth_pd_devs,
-				ARRAY_SIZE(mv643xx_eth_pd_devs));
-
-		if ( Enable_SRAM() < 0)
-		{
-			eth_port1_pd.tx_sram_addr = 0;
-			eth_port1_pd.tx_sram_size = 0;
-			eth_port1_pd.rx_sram_addr = 0;
-			eth_port1_pd.rx_sram_size = 0;
-
-#ifdef BE_VERBOSE
-			printk("Pegasos II/Marvell MV64361: Can't enable the "
-				"SRAM\n");
-#endif
-		}
-	}
-
-#ifdef BE_VERBOSE
-	printk("Pegasos II/Marvell MV64361: init is over\n");
-#endif
-
-	return ret;
-}
-
-device_initcall(mv643xx_eth_add_pds);
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
deleted file mode 100644
index 36ee3a5056a1..000000000000
--- a/arch/powerpc/platforms/chrp/setup.c
+++ /dev/null
@@ -1,586 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  Copyright (C) 1995  Linus Torvalds
- *  Adapted from 'alpha' version by Gary Thomas
- *  Modified by Cort Dougan (cort@cs.nmt.edu)
- */
-
-/*
- * bootup setup stuff..
- */
-
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/stddef.h>
-#include <linux/unistd.h>
-#include <linux/ptrace.h>
-#include <linux/user.h>
-#include <linux/tty.h>
-#include <linux/major.h>
-#include <linux/interrupt.h>
-#include <linux/reboot.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <generated/utsrelease.h>
-#include <linux/adb.h>
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/console.h>
-#include <linux/seq_file.h>
-#include <linux/root_dev.h>
-#include <linux/initrd.h>
-#include <linux/timer.h>
-#include <linux/of_address.h>
-#include <linux/of_fdt.h>
-#include <linux/of_irq.h>
-
-#include <asm/io.h>
-#include <asm/pci-bridge.h>
-#include <asm/dma.h>
-#include <asm/machdep.h>
-#include <asm/irq.h>
-#include <asm/hydra.h>
-#include <asm/sections.h>
-#include <asm/time.h>
-#include <asm/i8259.h>
-#include <asm/mpic.h>
-#include <asm/rtas.h>
-#include <asm/xmon.h>
-
-#include "chrp.h"
-#include "gg2.h"
-
-void rtas_indicator_progress(char *, unsigned short);
-
-int _chrp_type;
-EXPORT_SYMBOL(_chrp_type);
-
-static struct mpic *chrp_mpic;
-
-/* Used for doing CHRP event-scans */
-DEFINE_PER_CPU(struct timer_list, heartbeat_timer);
-unsigned long event_scan_interval;
-
-extern unsigned long loops_per_jiffy;
-
-/* To be replaced by RTAS when available */
-static unsigned int __iomem *briq_SPOR;
-
-#ifdef CONFIG_SMP
-extern struct smp_ops_t chrp_smp_ops;
-#endif
-
-static const char *gg2_memtypes[4] = {
-	"FPM", "SDRAM", "EDO", "BEDO"
-};
-static const char *gg2_cachesizes[4] = {
-	"256 KB", "512 KB", "1 MB", "Reserved"
-};
-static const char *gg2_cachetypes[4] = {
-	"Asynchronous", "Reserved", "Flow-Through Synchronous",
-	"Pipelined Synchronous"
-};
-static const char *gg2_cachemodes[4] = {
-	"Disabled", "Write-Through", "Copy-Back", "Transparent Mode"
-};
-
-static const char *chrp_names[] = {
-	"Unknown",
-	"","","",
-	"Motorola",
-	"IBM or Longtrail",
-	"Genesi Pegasos",
-	"Total Impact Briq"
-};
-
-static void chrp_show_cpuinfo(struct seq_file *m)
-{
-	int i, sdramen;
-	unsigned int t;
-	struct device_node *root;
-	const char *model = "";
-
-	root = of_find_node_by_path("/");
-	if (root)
-		model = of_get_property(root, "model", NULL);
-	seq_printf(m, "machine\t\t: CHRP %s\n", model);
-
-	/* longtrail (goldengate) stuff */
-	if (model && !strncmp(model, "IBM,LongTrail", 13)) {
-		/* VLSI VAS96011/12 `Golden Gate 2' */
-		/* Memory banks */
-		sdramen = (in_le32(gg2_pci_config_base + GG2_PCI_DRAM_CTRL)
-			   >>31) & 1;
-		for (i = 0; i < (sdramen ? 4 : 6); i++) {
-			t = in_le32(gg2_pci_config_base+
-						 GG2_PCI_DRAM_BANK0+
-						 i*4);
-			if (!(t & 1))
-				continue;
-			switch ((t>>8) & 0x1f) {
-			case 0x1f:
-				model = "4 MB";
-				break;
-			case 0x1e:
-				model = "8 MB";
-				break;
-			case 0x1c:
-				model = "16 MB";
-				break;
-			case 0x18:
-				model = "32 MB";
-				break;
-			case 0x10:
-				model = "64 MB";
-				break;
-			case 0x00:
-				model = "128 MB";
-				break;
-			default:
-				model = "Reserved";
-				break;
-			}
-			seq_printf(m, "memory bank %d\t: %s %s\n", i, model,
-				   gg2_memtypes[sdramen ? 1 : ((t>>1) & 3)]);
-		}
-		/* L2 cache */
-		t = in_le32(gg2_pci_config_base+GG2_PCI_CC_CTRL);
-		seq_printf(m, "board l2\t: %s %s (%s)\n",
-			   gg2_cachesizes[(t>>7) & 3],
-			   gg2_cachetypes[(t>>2) & 3],
-			   gg2_cachemodes[t & 3]);
-	}
-	of_node_put(root);
-}
-
-/*
- *  Fixes for the National Semiconductor PC78308VUL SuperI/O
- *
- *  Some versions of Open Firmware incorrectly initialize the IRQ settings
- *  for keyboard and mouse
- */
-static inline void __init sio_write(u8 val, u8 index)
-{
-	outb(index, 0x15c);
-	outb(val, 0x15d);
-}
-
-static inline u8 __init sio_read(u8 index)
-{
-	outb(index, 0x15c);
-	return inb(0x15d);
-}
-
-static void __init sio_fixup_irq(const char *name, u8 device, u8 level,
-				     u8 type)
-{
-	u8 level0, type0, active;
-
-	/* select logical device */
-	sio_write(device, 0x07);
-	active = sio_read(0x30);
-	level0 = sio_read(0x70);
-	type0 = sio_read(0x71);
-	if (level0 != level || type0 != type || !active) {
-		printk(KERN_WARNING "sio: %s irq level %d, type %d, %sactive: "
-		       "remapping to level %d, type %d, active\n",
-		       name, level0, type0, !active ? "in" : "", level, type);
-		sio_write(0x01, 0x30);
-		sio_write(level, 0x70);
-		sio_write(type, 0x71);
-	}
-}
-
-static void __init sio_init(void)
-{
-	struct device_node *root;
-	const char *model;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return;
-
-	model = of_get_property(root, "model", NULL);
-	if (model && !strncmp(model, "IBM,LongTrail", 13)) {
-		/* logical device 0 (KBC/Keyboard) */
-		sio_fixup_irq("keyboard", 0, 1, 2);
-		/* select logical device 1 (KBC/Mouse) */
-		sio_fixup_irq("mouse", 1, 12, 2);
-	}
-
-	of_node_put(root);
-}
-
-
-static void __init pegasos_set_l2cr(void)
-{
-	struct device_node *np;
-
-	/* On Pegasos, enable the l2 cache if needed, as the OF forgets it */
-	if (_chrp_type != _CHRP_Pegasos)
-		return;
-
-	/* Enable L2 cache if needed */
-	np = of_find_node_by_type(NULL, "cpu");
-	if (np != NULL) {
-		const unsigned int *l2cr = of_get_property(np, "l2cr", NULL);
-		if (l2cr == NULL) {
-			printk ("Pegasos l2cr : no cpu l2cr property found\n");
-			goto out;
-		}
-		if (!((*l2cr) & 0x80000000)) {
-			printk ("Pegasos l2cr : L2 cache was not active, "
-				"activating\n");
-			_set_L2CR(0);
-			_set_L2CR((*l2cr) | 0x80000000);
-		}
-	}
-out:
-	of_node_put(np);
-}
-
-static void __noreturn briq_restart(char *cmd)
-{
-	local_irq_disable();
-	if (briq_SPOR)
-		out_be32(briq_SPOR, 0);
-	for(;;);
-}
-
-/*
- * Per default, input/output-device points to the keyboard/screen
- * If no card is installed, the built-in serial port is used as a fallback.
- * But unfortunately, the firmware does not connect /chosen/{stdin,stdout}
- * to the built-in serial node. Instead, a /failsafe node is created.
- */
-static __init void chrp_init(void)
-{
-	struct device_node *node;
-	const char *property;
-
-	if (strstr(boot_command_line, "console="))
-		return;
-	/* find the boot console from /chosen/stdout */
-	if (!of_chosen)
-		return;
-	node = of_find_node_by_path("/");
-	if (!node)
-		return;
-	property = of_get_property(node, "model", NULL);
-	if (!property)
-		goto out_put;
-	if (strcmp(property, "Pegasos2"))
-		goto out_put;
-	/* this is a Pegasos2 */
-	property = of_get_property(of_chosen, "linux,stdout-path", NULL);
-	if (!property)
-		goto out_put;
-	of_node_put(node);
-	node = of_find_node_by_path(property);
-	if (!node)
-		return;
-	if (!of_node_is_type(node, "serial"))
-		goto out_put;
-	/*
-	 * The 9pin connector is either /failsafe
-	 * or /pci@80000000/isa@C/serial@i2F8
-	 * The optional graphics card has also type 'serial' in VGA mode.
-	 */
-	if (of_node_name_eq(node, "failsafe") || of_node_name_eq(node, "serial"))
-		add_preferred_console("ttyS", 0, NULL);
-out_put:
-	of_node_put(node);
-}
-
-static void __init chrp_setup_arch(void)
-{
-	struct device_node *root = of_find_node_by_path("/");
-	const char *machine = NULL;
-
-	/* init to some ~sane value until calibrate_delay() runs */
-	loops_per_jiffy = 50000000/HZ;
-
-	if (root)
-		machine = of_get_property(root, "model", NULL);
-	if (machine && strncmp(machine, "Pegasos", 7) == 0) {
-		_chrp_type = _CHRP_Pegasos;
-	} else if (machine && strncmp(machine, "IBM", 3) == 0) {
-		_chrp_type = _CHRP_IBM;
-	} else if (machine && strncmp(machine, "MOT", 3) == 0) {
-		_chrp_type = _CHRP_Motorola;
-	} else if (machine && strncmp(machine, "TotalImpact,BRIQ-1", 18) == 0) {
-		_chrp_type = _CHRP_briq;
-		/* Map the SPOR register on briq and change the restart hook */
-		briq_SPOR = ioremap(0xff0000e8, 4);
-		ppc_md.restart = briq_restart;
-	} else {
-		/* Let's assume it is an IBM chrp if all else fails */
-		_chrp_type = _CHRP_IBM;
-	}
-	of_node_put(root);
-	printk("chrp type = %x [%s]\n", _chrp_type, chrp_names[_chrp_type]);
-
-	rtas_initialize();
-	if (rtas_function_token(RTAS_FN_DISPLAY_CHARACTER) >= 0)
-		ppc_md.progress = rtas_progress;
-
-	/* use RTAS time-of-day routines if available */
-	if (rtas_function_token(RTAS_FN_GET_TIME_OF_DAY) != RTAS_UNKNOWN_SERVICE) {
-		ppc_md.get_boot_time	= rtas_get_boot_time;
-		ppc_md.get_rtc_time	= rtas_get_rtc_time;
-		ppc_md.set_rtc_time	= rtas_set_rtc_time;
-	}
-
-	/* On pegasos, enable the L2 cache if not already done by OF */
-	pegasos_set_l2cr();
-
-	/*
-	 *  Fix the Super I/O configuration
-	 */
-	sio_init();
-
-	/*
-	 * Print the banner, then scroll down so boot progress
-	 * can be printed.  -- Cort
-	 */
-	if (ppc_md.progress) ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0x0);
-}
-
-static void chrp_8259_cascade(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned int cascade_irq = i8259_irq();
-
-	if (cascade_irq)
-		generic_handle_irq(cascade_irq);
-
-	chip->irq_eoi(&desc->irq_data);
-}
-
-/*
- * Finds the open-pic node and sets up the mpic driver.
- */
-static void __init chrp_find_openpic(void)
-{
-	struct device_node *np, *root;
-	int len, i, j;
-	int isu_size;
-	const unsigned int *iranges, *opprop = NULL;
-	int oplen = 0;
-	unsigned long opaddr;
-	int na = 1;
-
-	np = of_find_node_by_type(NULL, "open-pic");
-	if (np == NULL)
-		return;
-	root = of_find_node_by_path("/");
-	if (root) {
-		opprop = of_get_property(root, "platform-open-pic", &oplen);
-		na = of_n_addr_cells(root);
-	}
-	if (opprop && oplen >= na * sizeof(unsigned int)) {
-		opaddr = opprop[na-1];	/* assume 32-bit */
-		oplen /= na * sizeof(unsigned int);
-	} else {
-		struct resource r;
-		if (of_address_to_resource(np, 0, &r)) {
-			goto bail;
-		}
-		opaddr = r.start;
-		oplen = 0;
-	}
-
-	printk(KERN_INFO "OpenPIC at %lx\n", opaddr);
-
-	iranges = of_get_property(np, "interrupt-ranges", &len);
-	if (iranges == NULL)
-		len = 0;	/* non-distributed mpic */
-	else
-		len /= 2 * sizeof(unsigned int);
-
-	/*
-	 * The first pair of cells in interrupt-ranges refers to the
-	 * IDU; subsequent pairs refer to the ISUs.
-	 */
-	if (oplen < len) {
-		printk(KERN_ERR "Insufficient addresses for distributed"
-		       " OpenPIC (%d < %d)\n", oplen, len);
-		len = oplen;
-	}
-
-	isu_size = 0;
-	if (len > 0 && iranges[1] != 0) {
-		printk(KERN_INFO "OpenPIC irqs %d..%d in IDU\n",
-		       iranges[0], iranges[0] + iranges[1] - 1);
-	}
-	if (len > 1)
-		isu_size = iranges[3];
-
-	chrp_mpic = mpic_alloc(np, opaddr, MPIC_NO_RESET,
-			isu_size, 0, " MPIC    ");
-	if (chrp_mpic == NULL) {
-		printk(KERN_ERR "Failed to allocate MPIC structure\n");
-		goto bail;
-	}
-	j = na - 1;
-	for (i = 1; i < len; ++i) {
-		iranges += 2;
-		j += na;
-		printk(KERN_INFO "OpenPIC irqs %d..%d in ISU at %x\n",
-		       iranges[0], iranges[0] + iranges[1] - 1,
-		       opprop[j]);
-		mpic_assign_isu(chrp_mpic, i - 1, opprop[j]);
-	}
-
-	mpic_init(chrp_mpic);
-	ppc_md.get_irq = mpic_get_irq;
- bail:
-	of_node_put(root);
-	of_node_put(np);
-}
-
-static void __init chrp_find_8259(void)
-{
-	struct device_node *np, *pic = NULL;
-	unsigned long chrp_int_ack = 0;
-	unsigned int cascade_irq;
-
-	/* Look for cascade */
-	for_each_node_by_type(np, "interrupt-controller")
-		if (of_device_is_compatible(np, "chrp,iic")) {
-			pic = np;
-			break;
-		}
-	/* Ok, 8259 wasn't found. We need to handle the case where
-	 * we have a pegasos that claims to be chrp but doesn't have
-	 * a proper interrupt tree
-	 */
-	if (pic == NULL && chrp_mpic != NULL) {
-		printk(KERN_ERR "i8259: Not found in device-tree"
-		       " assuming no legacy interrupts\n");
-		return;
-	}
-
-	/* Look for intack. In a perfect world, we would look for it on
-	 * the ISA bus that holds the 8259 but heh... Works that way. If
-	 * we ever see a problem, we can try to re-use the pSeries code here.
-	 * Also, Pegasos-type platforms don't have a proper node to start
-	 * from anyway
-	 */
-	for_each_node_by_name(np, "pci") {
-		const unsigned int *addrp = of_get_property(np,
-				"8259-interrupt-acknowledge", NULL);
-
-		if (addrp == NULL)
-			continue;
-		chrp_int_ack = addrp[of_n_addr_cells(np)-1];
-		break;
-	}
-	of_node_put(np);
-	if (np == NULL)
-		printk(KERN_WARNING "Cannot find PCI interrupt acknowledge"
-		       " address, polling\n");
-
-	i8259_init(pic, chrp_int_ack);
-	if (ppc_md.get_irq == NULL) {
-		ppc_md.get_irq = i8259_irq;
-		irq_set_default_host(i8259_get_host());
-	}
-	if (chrp_mpic != NULL) {
-		cascade_irq = irq_of_parse_and_map(pic, 0);
-		if (!cascade_irq)
-			printk(KERN_ERR "i8259: failed to map cascade irq\n");
-		else
-			irq_set_chained_handler(cascade_irq,
-						chrp_8259_cascade);
-	}
-}
-
-static void __init chrp_init_IRQ(void)
-{
-#if defined(CONFIG_VT) && defined(CONFIG_INPUT_ADBHID) && defined(CONFIG_XMON)
-	struct device_node *kbd;
-#endif
-	chrp_find_openpic();
-	chrp_find_8259();
-
-#ifdef CONFIG_SMP
-	/* Pegasos has no MPIC, those ops would make it crash. It might be an
-	 * option to move setting them to after we probe the PIC though
-	 */
-	if (chrp_mpic != NULL)
-		smp_ops = &chrp_smp_ops;
-#endif /* CONFIG_SMP */
-
-	if (_chrp_type == _CHRP_Pegasos)
-		ppc_md.get_irq        = i8259_irq;
-
-#if defined(CONFIG_VT) && defined(CONFIG_INPUT_ADBHID) && defined(CONFIG_XMON)
-	/* see if there is a keyboard in the device tree
-	   with a parent of type "adb" */
-	for_each_node_by_name(kbd, "keyboard")
-		if (of_node_is_type(kbd->parent, "adb"))
-			break;
-	of_node_put(kbd);
-	if (kbd) {
-		if (request_irq(HYDRA_INT_ADB_NMI, xmon_irq, 0, "XMON break",
-				NULL))
-			pr_err("Failed to register XMON break interrupt\n");
-	}
-#endif
-}
-
-static void __init
-chrp_init2(void)
-{
-#if IS_ENABLED(CONFIG_NVRAM)
-	chrp_nvram_init();
-#endif
-
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
-
-	if (ppc_md.progress)
-		ppc_md.progress("  Have fun!    ", 0x7777);
-}
-
-static int __init chrp_probe(void)
-{
-	const char *dtype = of_get_flat_dt_prop(of_get_flat_dt_root(),
-						"device_type", NULL);
- 	if (dtype == NULL)
- 		return 0;
- 	if (strcmp(dtype, "chrp"))
-		return 0;
-
-	DMA_MODE_READ = 0x44;
-	DMA_MODE_WRITE = 0x48;
-
-	pm_power_off = rtas_power_off;
-
-	chrp_init();
-
-	return 1;
-}
-
-define_machine(chrp) {
-	.name			= "CHRP",
-	.probe			= chrp_probe,
-	.setup_arch		= chrp_setup_arch,
-	.discover_phbs		= chrp_find_bridges,
-	.init			= chrp_init2,
-	.show_cpuinfo		= chrp_show_cpuinfo,
-	.init_IRQ		= chrp_init_IRQ,
-	.restart		= rtas_restart,
-	.halt			= rtas_halt,
-	.time_init		= chrp_time_init,
-	.set_rtc_time		= chrp_set_rtc_time,
-	.get_rtc_time		= chrp_get_rtc_time,
-	.phys_mem_access_prot	= pci_phys_mem_access_prot,
-};
diff --git a/arch/powerpc/platforms/chrp/smp.c b/arch/powerpc/platforms/chrp/smp.c
deleted file mode 100644
index ab95155647a4..000000000000
--- a/arch/powerpc/platforms/chrp/smp.c
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Smp support for CHRP machines.
- *
- * Written by Cort Dougan (cort@cs.nmt.edu) borrowing a great
- * deal of code from the sparc and intel versions.
- *
- * Copyright (C) 1999 Cort Dougan <cort@cs.nmt.edu>
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/smp.h>
-#include <linux/interrupt.h>
-#include <linux/kernel_stat.h>
-#include <linux/delay.h>
-#include <linux/spinlock.h>
-#include <linux/pgtable.h>
-
-#include <asm/ptrace.h>
-#include <linux/atomic.h>
-#include <asm/irq.h>
-#include <asm/page.h>
-#include <asm/sections.h>
-#include <asm/io.h>
-#include <asm/smp.h>
-#include <asm/machdep.h>
-#include <asm/mpic.h>
-#include <asm/rtas.h>
-
-static int smp_chrp_kick_cpu(int nr)
-{
-	*(unsigned long *)KERNELBASE = nr;
-	asm volatile("dcbf 0,%0"::"r"(KERNELBASE):"memory");
-
-	return 0;
-}
-
-static void smp_chrp_setup_cpu(int cpu_nr)
-{
-	mpic_setup_this_cpu();
-}
-
-/* CHRP with openpic */
-struct smp_ops_t chrp_smp_ops = {
-	.cause_nmi_ipi = NULL,
-	.message_pass = smp_mpic_message_pass,
-	.probe = smp_mpic_probe,
-	.kick_cpu = smp_chrp_kick_cpu,
-	.setup_cpu = smp_chrp_setup_cpu,
-	.give_timebase = rtas_give_timebase,
-	.take_timebase = rtas_take_timebase,
-};
diff --git a/arch/powerpc/platforms/chrp/time.c b/arch/powerpc/platforms/chrp/time.c
deleted file mode 100644
index d46417e3d8e0..000000000000
--- a/arch/powerpc/platforms/chrp/time.c
+++ /dev/null
@@ -1,159 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  Copyright (C) 1991, 1992, 1995  Linus Torvalds
- *
- * Adapted for PowerPC (PReP) by Gary Thomas
- * Modified by Cort Dougan (cort@cs.nmt.edu).
- * Copied and modified from arch/i386/kernel/time.c
- *
- */
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/interrupt.h>
-#include <linux/time.h>
-#include <linux/timex.h>
-#include <linux/kernel_stat.h>
-#include <linux/mc146818rtc.h>
-#include <linux/init.h>
-#include <linux/bcd.h>
-#include <linux/ioport.h>
-#include <linux/of_address.h>
-
-#include <asm/io.h>
-#include <asm/nvram.h>
-#include <asm/sections.h>
-#include <asm/time.h>
-
-#include <platforms/chrp/chrp.h>
-
-#define NVRAM_AS0  0x74
-#define NVRAM_AS1  0x75
-#define NVRAM_DATA 0x77
-
-static int nvram_as1 = NVRAM_AS1;
-static int nvram_as0 = NVRAM_AS0;
-static int nvram_data = NVRAM_DATA;
-
-long __init chrp_time_init(void)
-{
-	struct device_node *rtcs;
-	struct resource r;
-	int base;
-
-	rtcs = of_find_compatible_node(NULL, "rtc", "pnpPNP,b00");
-	if (rtcs == NULL)
-		rtcs = of_find_compatible_node(NULL, "rtc", "ds1385-rtc");
-	if (rtcs == NULL)
-		return 0;
-	if (of_address_to_resource(rtcs, 0, &r)) {
-		of_node_put(rtcs);
-		return 0;
-	}
-	of_node_put(rtcs);
-
-	base = r.start;
-	nvram_as1 = 0;
-	nvram_as0 = base;
-	nvram_data = base + 1;
-
-	return 0;
-}
-
-static int chrp_cmos_clock_read(int addr)
-{
-	if (nvram_as1 != 0)
-		outb(addr>>8, nvram_as1);
-	outb(addr, nvram_as0);
-	return (inb(nvram_data));
-}
-
-static void chrp_cmos_clock_write(unsigned long val, int addr)
-{
-	if (nvram_as1 != 0)
-		outb(addr>>8, nvram_as1);
-	outb(addr, nvram_as0);
-	outb(val, nvram_data);
-	return;
-}
-
-/*
- * Set the hardware clock. -- Cort
- */
-int chrp_set_rtc_time(struct rtc_time *tmarg)
-{
-	unsigned char save_control, save_freq_select;
-	struct rtc_time tm = *tmarg;
-
-	spin_lock(&rtc_lock);
-
-	save_control = chrp_cmos_clock_read(RTC_CONTROL); /* tell the clock it's being set */
-
-	chrp_cmos_clock_write((save_control|RTC_SET), RTC_CONTROL);
-
-	save_freq_select = chrp_cmos_clock_read(RTC_FREQ_SELECT); /* stop and reset prescaler */
-
-	chrp_cmos_clock_write((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
-
-	if (!(save_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
-		tm.tm_sec = bin2bcd(tm.tm_sec);
-		tm.tm_min = bin2bcd(tm.tm_min);
-		tm.tm_hour = bin2bcd(tm.tm_hour);
-		tm.tm_mon = bin2bcd(tm.tm_mon);
-		tm.tm_mday = bin2bcd(tm.tm_mday);
-		tm.tm_year = bin2bcd(tm.tm_year);
-	}
-	chrp_cmos_clock_write(tm.tm_sec,RTC_SECONDS);
-	chrp_cmos_clock_write(tm.tm_min,RTC_MINUTES);
-	chrp_cmos_clock_write(tm.tm_hour,RTC_HOURS);
-	chrp_cmos_clock_write(tm.tm_mon,RTC_MONTH);
-	chrp_cmos_clock_write(tm.tm_mday,RTC_DAY_OF_MONTH);
-	chrp_cmos_clock_write(tm.tm_year,RTC_YEAR);
-
-	/* The following flags have to be released exactly in this order,
-	 * otherwise the DS12887 (popular MC146818A clone with integrated
-	 * battery and quartz) will not reset the oscillator and will not
-	 * update precisely 500 ms later. You won't find this mentioned in
-	 * the Dallas Semiconductor data sheets, but who believes data
-	 * sheets anyway ...                           -- Markus Kuhn
-	 */
-	chrp_cmos_clock_write(save_control, RTC_CONTROL);
-	chrp_cmos_clock_write(save_freq_select, RTC_FREQ_SELECT);
-
-	spin_unlock(&rtc_lock);
-	return 0;
-}
-
-void chrp_get_rtc_time(struct rtc_time *tm)
-{
-	unsigned int year, mon, day, hour, min, sec;
-
-	do {
-		sec = chrp_cmos_clock_read(RTC_SECONDS);
-		min = chrp_cmos_clock_read(RTC_MINUTES);
-		hour = chrp_cmos_clock_read(RTC_HOURS);
-		day = chrp_cmos_clock_read(RTC_DAY_OF_MONTH);
-		mon = chrp_cmos_clock_read(RTC_MONTH);
-		year = chrp_cmos_clock_read(RTC_YEAR);
-	} while (sec != chrp_cmos_clock_read(RTC_SECONDS));
-
-	if (!(chrp_cmos_clock_read(RTC_CONTROL) & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
-		sec = bcd2bin(sec);
-		min = bcd2bin(min);
-		hour = bcd2bin(hour);
-		day = bcd2bin(day);
-		mon = bcd2bin(mon);
-		year = bcd2bin(year);
-	}
-	if (year < 70)
-		year += 100;
-	tm->tm_sec = sec;
-	tm->tm_min = min;
-	tm->tm_hour = hour;
-	tm->tm_mday = day;
-	tm->tm_mon = mon;
-	tm->tm_year = year;
-}
-- 
2.47.0


