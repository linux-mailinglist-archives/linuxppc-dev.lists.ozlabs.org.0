Return-Path: <linuxppc-dev+bounces-7094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5AA62B73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 12:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCk0BqFz30WY;
	Sat, 15 Mar 2025 21:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036385;
	cv=none; b=ikOZ/WhiWblmTYCbJkZzv79a37Gjz705Xk1m2Hl8pdSn+UWeVvaO+2u9fsg+hKJbm9qQ7TPBKuqtZR9QtNctbwyYcpgG742Ex0hvqY2uN+M84Yed8XEvA+HrxOILJfacvJvcI7MSytKNlkkISvsefXxmcr8zybHsP2zLF6OepXqDWxegk+nsJ3KwEaaDqBmRASNEwuc7MNJgg4fuYPKc7DAW/Gqj1ij8sGZ5RHe/mrJWhiJHfYpReI3A+ASfoJCo5FPJyrbZGTcb+bufVZ6DMp5GZELb26vjNW8R9tpAVaLW8ldw6mBenv2SAVA2f6U97r0hBmCrpt+yFIOfCyyGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036385; c=relaxed/relaxed;
	bh=QZcZfk5I1QRNGhfNcE+MwBtyIC/hnjnEOl/F332hVXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmfmK2KDrOx2KUzeKHK1sC3L7P+kODnKg0TLGnwKi6goI1fxf98XAvEoa613k4W+P/3T0/dZaKQOct3W+uteiTt0RHBsR4GLutvh+PwHTaB/kyPc2G2VsJgJyyXJgk4+w1nKt1IwYVPaIIqJu0m8zzFU7r1aVAqkxKCcCjo+OnlHdU+mMrElAuCaMTsc09Uza2fmA1vBdNy9lRRc4Ou+jDFaLhN/yvtuh3ELTB8Ejs4ANvi36z0Uo+mZnzL3ap6OKssBm1S3Ru1nHX6wzt0rM0SmrHvE6DMhWjdKMfXGfUh3jvLy8SN5NVlSklhxWM6Ay/lB+tRRnhAdSUJrOb9JFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUVpQhYu; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUVpQhYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCj1V4Nz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70AC4A48A12;
	Sat, 15 Mar 2025 10:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30993C4CEEE;
	Sat, 15 Mar 2025 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036382;
	bh=Ocgkmwh32rBMKgy+zdGqEw65Xp0hQcjH99SnZLPTggw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUVpQhYuj8R5lbEwOh0aZKM4Y8Acv7xnv2sqN2YDbmHsBGQIRnSAadSmccWuUhLGT
	 B2zQQZNue12j7UVtiRIi3lBxv1XbGOrom+jZtkUzpJ2+deEiBODnn7W3QWKla3ceU1
	 GYV2/Na069BoOyrGstiOuC3wdYv0xUlIrPMg4kxEmnsRbUgLtVYe48rag7mxP2M5eB
	 axYdBBMZ0oVU9NtoXi+62zLwYFuKGxqZImpznW8I8d5jaTR1tEElytVzvke4ayUNlA
	 9dx74E971/xKPOLa+6rI3klRMrHQPi5ClKFesOM0BwTJhHjvhdSfgE8FtssAe++72I
	 tgEKi0ZB6SDtQ==
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
Subject: [PATCH 5/6] mips: drop GENERIC_IOMAP wrapper
Date: Sat, 15 Mar 2025 11:59:06 +0100
Message-Id: <20250315105907.1275012-6-arnd@kernel.org>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

All PIO on MIPS platforms is memory mapped, so there is no benefit in
the lib/iomap.c wrappers that switch between inb/outb and readb/writeb
style accessses.

In fact, the '#define PIO_RESERVED 0' setting completely disables
the GENERIC_IOMAP functionality, and the '#define PIO_OFFSET
mips_io_port_base' setting is based on a misunderstanding of what the
offset is meant to do.

MIPS started using GENERIC_IOMAP in 2018 with commit b962aeb02205 ("MIPS:
Use GENERIC_IOMAP") replacing a simple custom implementation of the same
interfaces, but at the time the asm-generic/io.h version was not usable
yet. Since the header is now always included, it's now possible to go
back to the even simpler version.

Use the normal GENERIC_PCI_IOMAP functionality for all mips platforms
without the hacky GENERIC_IOMAP, and provide a custom pci_iounmap()
for the CONFIG_PCI_DRIVERS_LEGACY case to ensure the I/O port base never
gets unmapped.

The readsl() prototype needs an extra 'const' keyword to make it
compatible with the generic ioread32_rep() alias.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig          |  2 +-
 arch/mips/include/asm/io.h | 21 ++++++++-------------
 arch/mips/lib/iomap-pci.c  |  9 +++++++++
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1924f2d83932..2a2120a6d852 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -38,7 +38,6 @@ config MIPS
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_IOMAP
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_ISA_DMA if EISA
@@ -47,6 +46,7 @@ config MIPS
 	select GENERIC_LIB_CMPDI2
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK if !CAVIUM_OCTEON_SOC
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_IDLE_POLL_SETUP
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 0bddb568af7c..1fe56d1870a6 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -66,17 +66,6 @@ static inline void set_io_port_base(unsigned long base)
 	mips_io_port_base = base;
 }
 
-/*
- * Provide the necessary definitions for generic iomap. We make use of
- * mips_io_port_base for iomap(), but we don't reserve any low addresses for
- * use with I/O ports.
- */
-
-#define HAVE_ARCH_PIO_SIZE
-#define PIO_OFFSET	mips_io_port_base
-#define PIO_MASK	IO_SPACE_LIMIT
-#define PIO_RESERVED	0x0UL
-
 /*
  * Enforce in-order execution of data I/O.  In the MIPS architecture
  * these are equivalent to corresponding platform-specific memory
@@ -397,8 +386,8 @@ static inline void writes##bwlq(volatile void __iomem *mem,		\
 	}								\
 }									\
 									\
-static inline void reads##bwlq(volatile void __iomem *mem, void *addr,	\
-			       unsigned int count)			\
+static inline void reads##bwlq(const volatile void __iomem *mem,	\
+			       void *addr, unsigned int count)		\
 {									\
 	volatile type *__addr = addr;					\
 									\
@@ -555,6 +544,12 @@ extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
 
 void __ioread64_copy(void *to, const void __iomem *from, size_t count);
 
+#ifdef CONFIG_PCI_DRIVERS_LEGACY
+struct pci_dev;
+void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
+#define pci_iounmap pci_iounmap
+#endif
+
 #include <asm-generic/io.h>
 
 static inline void *isa_bus_to_virt(unsigned long address)
diff --git a/arch/mips/lib/iomap-pci.c b/arch/mips/lib/iomap-pci.c
index a9cb28813f0b..2f82c776c6d0 100644
--- a/arch/mips/lib/iomap-pci.c
+++ b/arch/mips/lib/iomap-pci.c
@@ -43,4 +43,13 @@ void __iomem *__pci_ioport_map(struct pci_dev *dev,
 	return (void __iomem *) (ctrl->io_map_base + port);
 }
 
+void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
+{
+	struct pci_controller *ctrl = dev->bus->sysdata;
+	void __iomem *base = (void __iomem *)ctrl->io_map_base;
+
+	if (addr < base || addr > (base + resource_size(ctrl->io_resource)))
+		iounmap(addr);
+}
+
 #endif /* CONFIG_PCI_DRIVERS_LEGACY */
-- 
2.39.5


