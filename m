Return-Path: <linuxppc-dev+bounces-7091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC4A62B67
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 11:59:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCQ5fMDz3cbg;
	Sat, 15 Mar 2025 21:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036370;
	cv=none; b=Q0yJHy8W46yra0cHdMeJ7Tir3EcSRf43cphsMygnV/uie8WbRugRFtsy/g6X6PV8zSKAQRJpHj19NS/AmlQ09vqrefUiQTK/mkp4Dv9zyfpNYs7pT8dfg3KrBHJkPrCoYTtsQe3gzDPgytWjTRNbdgLqf6Ztf8p/asP+gQ2Fomj9Y/m209sW6E/j8mq2TvufGysJj68jOAU7GBVrdE33Y6JvTEHYZFe/LvSGfNMi8gsP9aenj3x1FcZZD28XomN63LeiX5mqScQHVecGSibSsk0H/b8TC9KTu1fhcBo1PYABNQcNnF36BSatdC+CVk+J+BR9h7/d7YiT4lVM3TUTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036370; c=relaxed/relaxed;
	bh=XImKjdayZRuHP1tB8Gx5EebMtoXsFiSQ5MItPvjUyjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z7e6++0GD6sAHA2FhLyHldxHUiuw10RyGnojHwwNXYZsPQPxMNIgz4MHYq7JxViZnwjW3f815Sk2VXGVI2AVfNkuNRih7jkA2+FPz7Ch3T0SdXu3YwyJ/TTi7ZQ8Hf3k8HcbtUjjSCfulESrnLrL2zyHe+gXOcvq/JOWyUtfcCUhRHb7hVlyumMpRj+HcKanrTiJ99493PbBf0OFgc/MislfrWUerU/Byo6K0QkxFguMdTcBN5dXTRlBYYPQrAAwGaE6hGC011k/sHHzZlIpjtoS5I/OlJUREG2kQfdJ2rJBKD+Ft1H6cMG6j7WmGtF+qw/s8XqukeYxIv6enoEX5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLAs0s17; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLAs0s17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCP6SDfz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16489A48A15;
	Sat, 15 Mar 2025 10:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33C2C4CEE9;
	Sat, 15 Mar 2025 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036367;
	bh=ifm6+RNn7W+4D9iZBd9DXE2mvpD9E69YYaSTABFkwMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XLAs0s17y4TlJdo1dj8CRoFIbCgt8ordw0TgHG/VvNSocGisqa7LAU6K10B8AsI0w
	 Khn8ABI6KU0a3m/BkEFcO70ou6Wu8vLHIqLUM/JXV4Jiysyx7inju1ovYrHO3iEK9S
	 h5zu1Yq5AwePf0Q6hPWy2A3LL1W5eUQkbL/JwOr7EMZK+awdBBGl9dAzwnw3HXGdRt
	 jTqkAid0yIIKlIDO0h84d6Gp6ZTcNaK1r1UuSbDwIuNXuHgaKGAkCskivbXA/8PLOX
	 tPKrdogC4rwrmwkYvsKL5vu6hQzN2cTCwnZuaVxdH95yrNAmKJbgxprIbfxpaCrR3p
	 mT76EiNpgsZtg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 2/6] sh: remove duplicate ioread/iowrite helpers
Date: Sat, 15 Mar 2025 11:59:03 +0100
Message-Id: <20250315105907.1275012-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315105907.1275012-1-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

The ioread/iowrite functions on sh only do memory mapped I/O like the
generic verion, and never map onto non-MMIO inb/outb variants, so they
just add complexity. In particular, the use of asm-generic/iomap.h
ties the declaration to the x86 implementation.

Remove the custom versions and use the architecture-independent fallback
code instead. Some of the calling conventions on sh are different here,
so fix that by adding 'volatile' keywords where required by the generic
implementation and change the cpg clock driver to no longer depend on
the interesting choice of return types for ioread8/ioread16/ioread32.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/include/asm/io.h |  30 ++------
 arch/sh/kernel/Makefile  |   3 -
 arch/sh/kernel/iomap.c   | 162 ---------------------------------------
 arch/sh/kernel/ioport.c  |   5 --
 arch/sh/lib/io.c         |   4 +-
 drivers/sh/clk/cpg.c     |  25 +++---
 6 files changed, 21 insertions(+), 208 deletions(-)
 delete mode 100644 arch/sh/kernel/iomap.c

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index cf5eab840d57..0f663ebec700 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -19,7 +19,6 @@
 #include <asm/machvec.h>
 #include <asm/page.h>
 #include <linux/pgtable.h>
-#include <asm-generic/iomap.h>
 
 #define __IO_PREFIX     generic
 #include <asm/io_generic.h>
@@ -100,7 +99,7 @@ pfx##writes##bwlq(volatile void __iomem *mem, const void *addr,		\
 	}								\
 }									\
 									\
-static inline void pfx##reads##bwlq(volatile void __iomem *mem,		\
+static inline void pfx##reads##bwlq(const volatile void __iomem *mem,	\
 				    void *addr, unsigned int count)	\
 {									\
 	volatile type *__addr = addr;					\
@@ -114,37 +113,18 @@ static inline void pfx##reads##bwlq(volatile void __iomem *mem,		\
 __BUILD_MEMORY_STRING(__raw_, b, u8)
 __BUILD_MEMORY_STRING(__raw_, w, u16)
 
-void __raw_writesl(void __iomem *addr, const void *data, int longlen);
-void __raw_readsl(const void __iomem *addr, void *data, int longlen);
+void __raw_writesl(void volatile __iomem *addr, const void *data, int longlen);
+void __raw_readsl(const volatile void __iomem *addr, void *data, int longlen);
 
 __BUILD_MEMORY_STRING(__raw_, q, u64)
 
 #define ioport_map ioport_map
-#define ioport_unmap ioport_unmap
 #define pci_iounmap pci_iounmap
 
-#define ioread8 ioread8
-#define ioread16 ioread16
-#define ioread16be ioread16be
-#define ioread32 ioread32
-#define ioread32be ioread32be
-
-#define iowrite8 iowrite8
-#define iowrite16 iowrite16
-#define iowrite16be iowrite16be
-#define iowrite32 iowrite32
-#define iowrite32be iowrite32be
-
-#define ioread8_rep ioread8_rep
-#define ioread16_rep ioread16_rep
-#define ioread32_rep ioread32_rep
-
-#define iowrite8_rep iowrite8_rep
-#define iowrite16_rep iowrite16_rep
-#define iowrite32_rep iowrite32_rep
-
 #ifdef CONFIG_HAS_IOPORT_MAP
 
+extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
+
 /*
  * Slowdown I/O port space accesses for antique hardware.
  */
diff --git a/arch/sh/kernel/Makefile b/arch/sh/kernel/Makefile
index ba917008d63e..7b453592adaf 100644
--- a/arch/sh/kernel/Makefile
+++ b/arch/sh/kernel/Makefile
@@ -21,10 +21,7 @@ obj-y	:= head_32.o debugtraps.o dumpstack.o				\
 	   syscalls_32.o time.o topology.o traps.o			\
 	   traps_32.o unwinder.o
 
-ifndef CONFIG_GENERIC_IOMAP
-obj-y				+= iomap.o
 obj-$(CONFIG_HAS_IOPORT_MAP)	+= ioport.o
-endif
 
 obj-y				+= sys_sh32.o
 obj-y				+= cpu/
diff --git a/arch/sh/kernel/iomap.c b/arch/sh/kernel/iomap.c
deleted file mode 100644
index 0a0dff4e66de..000000000000
--- a/arch/sh/kernel/iomap.c
+++ /dev/null
@@ -1,162 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * arch/sh/kernel/iomap.c
- *
- * Copyright (C) 2000  Niibe Yutaka
- * Copyright (C) 2005 - 2007 Paul Mundt
- */
-#include <linux/module.h>
-#include <linux/io.h>
-
-unsigned int ioread8(const void __iomem *addr)
-{
-	return readb(addr);
-}
-EXPORT_SYMBOL(ioread8);
-
-unsigned int ioread16(const void __iomem *addr)
-{
-	return readw(addr);
-}
-EXPORT_SYMBOL(ioread16);
-
-unsigned int ioread16be(const void __iomem *addr)
-{
-	return be16_to_cpu(__raw_readw(addr));
-}
-EXPORT_SYMBOL(ioread16be);
-
-unsigned int ioread32(const void __iomem *addr)
-{
-	return readl(addr);
-}
-EXPORT_SYMBOL(ioread32);
-
-unsigned int ioread32be(const void __iomem *addr)
-{
-	return be32_to_cpu(__raw_readl(addr));
-}
-EXPORT_SYMBOL(ioread32be);
-
-void iowrite8(u8 val, void __iomem *addr)
-{
-	writeb(val, addr);
-}
-EXPORT_SYMBOL(iowrite8);
-
-void iowrite16(u16 val, void __iomem *addr)
-{
-	writew(val, addr);
-}
-EXPORT_SYMBOL(iowrite16);
-
-void iowrite16be(u16 val, void __iomem *addr)
-{
-	__raw_writew(cpu_to_be16(val), addr);
-}
-EXPORT_SYMBOL(iowrite16be);
-
-void iowrite32(u32 val, void __iomem *addr)
-{
-	writel(val, addr);
-}
-EXPORT_SYMBOL(iowrite32);
-
-void iowrite32be(u32 val, void __iomem *addr)
-{
-	__raw_writel(cpu_to_be32(val), addr);
-}
-EXPORT_SYMBOL(iowrite32be);
-
-/*
- * These are the "repeat MMIO read/write" functions.
- * Note the "__raw" accesses, since we don't want to
- * convert to CPU byte order. We write in "IO byte
- * order" (we also don't have IO barriers).
- */
-static inline void mmio_insb(const void __iomem *addr, u8 *dst, int count)
-{
-	while (--count >= 0) {
-		u8 data = __raw_readb(addr);
-		*dst = data;
-		dst++;
-	}
-}
-
-static inline void mmio_insw(const void __iomem *addr, u16 *dst, int count)
-{
-	while (--count >= 0) {
-		u16 data = __raw_readw(addr);
-		*dst = data;
-		dst++;
-	}
-}
-
-static inline void mmio_insl(const void __iomem *addr, u32 *dst, int count)
-{
-	while (--count >= 0) {
-		u32 data = __raw_readl(addr);
-		*dst = data;
-		dst++;
-	}
-}
-
-static inline void mmio_outsb(void __iomem *addr, const u8 *src, int count)
-{
-	while (--count >= 0) {
-		__raw_writeb(*src, addr);
-		src++;
-	}
-}
-
-static inline void mmio_outsw(void __iomem *addr, const u16 *src, int count)
-{
-	while (--count >= 0) {
-		__raw_writew(*src, addr);
-		src++;
-	}
-}
-
-static inline void mmio_outsl(void __iomem *addr, const u32 *src, int count)
-{
-	while (--count >= 0) {
-		__raw_writel(*src, addr);
-		src++;
-	}
-}
-
-void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	mmio_insb(addr, dst, count);
-}
-EXPORT_SYMBOL(ioread8_rep);
-
-void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	mmio_insw(addr, dst, count);
-}
-EXPORT_SYMBOL(ioread16_rep);
-
-void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	mmio_insl(addr, dst, count);
-}
-EXPORT_SYMBOL(ioread32_rep);
-
-void iowrite8_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	mmio_outsb(addr, src, count);
-}
-EXPORT_SYMBOL(iowrite8_rep);
-
-void iowrite16_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	mmio_outsw(addr, src, count);
-}
-EXPORT_SYMBOL(iowrite16_rep);
-
-void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	mmio_outsl(addr, src, count);
-}
-EXPORT_SYMBOL(iowrite32_rep);
diff --git a/arch/sh/kernel/ioport.c b/arch/sh/kernel/ioport.c
index c8aff8a20164..915a3dfd9f02 100644
--- a/arch/sh/kernel/ioport.c
+++ b/arch/sh/kernel/ioport.c
@@ -23,8 +23,3 @@ void __iomem *ioport_map(unsigned long port, unsigned int nr)
 	return (void __iomem *)(port + sh_io_port_base);
 }
 EXPORT_SYMBOL(ioport_map);
-
-void ioport_unmap(void __iomem *addr)
-{
-}
-EXPORT_SYMBOL(ioport_unmap);
diff --git a/arch/sh/lib/io.c b/arch/sh/lib/io.c
index ebcf7c0a7335..dc6345e4c53b 100644
--- a/arch/sh/lib/io.c
+++ b/arch/sh/lib/io.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 
-void __raw_readsl(const void __iomem *addr, void *datap, int len)
+void __raw_readsl(const volatile void __iomem *addr, void *datap, int len)
 {
 	u32 *data;
 
@@ -60,7 +60,7 @@ void __raw_readsl(const void __iomem *addr, void *datap, int len)
 }
 EXPORT_SYMBOL(__raw_readsl);
 
-void __raw_writesl(void __iomem *addr, const void *data, int len)
+void __raw_writesl(volatile void __iomem *addr, const void *data, int len)
 {
 	if (likely(len != 0)) {
 		int tmp1;
diff --git a/drivers/sh/clk/cpg.c b/drivers/sh/clk/cpg.c
index fd72d9088bdc..64ed7d64458a 100644
--- a/drivers/sh/clk/cpg.c
+++ b/drivers/sh/clk/cpg.c
@@ -26,6 +26,19 @@ static unsigned int sh_clk_read(struct clk *clk)
 	return ioread32(clk->mapped_reg);
 }
 
+static unsigned int sh_clk_read_status(struct clk *clk)
+{
+	void __iomem *mapped_status = (phys_addr_t)clk->status_reg -
+		(phys_addr_t)clk->enable_reg + clk->mapped_reg;
+
+	if (clk->flags & CLK_ENABLE_REG_8BIT)
+		return ioread8(mapped_status);
+	else if (clk->flags & CLK_ENABLE_REG_16BIT)
+		return ioread16(mapped_status);
+
+	return ioread32(mapped_status);
+}
+
 static void sh_clk_write(int value, struct clk *clk)
 {
 	if (clk->flags & CLK_ENABLE_REG_8BIT)
@@ -40,20 +53,10 @@ static int sh_clk_mstp_enable(struct clk *clk)
 {
 	sh_clk_write(sh_clk_read(clk) & ~(1 << clk->enable_bit), clk);
 	if (clk->status_reg) {
-		unsigned int (*read)(const void __iomem *addr);
 		int i;
-		void __iomem *mapped_status = (phys_addr_t)clk->status_reg -
-			(phys_addr_t)clk->enable_reg + clk->mapped_reg;
-
-		if (clk->flags & CLK_ENABLE_REG_8BIT)
-			read = ioread8;
-		else if (clk->flags & CLK_ENABLE_REG_16BIT)
-			read = ioread16;
-		else
-			read = ioread32;
 
 		for (i = 1000;
-		     (read(mapped_status) & (1 << clk->enable_bit)) && i;
+		     (sh_clk_read_status(clk) & (1 << clk->enable_bit)) && i;
 		     i--)
 			cpu_relax();
 		if (!i) {
-- 
2.39.5


