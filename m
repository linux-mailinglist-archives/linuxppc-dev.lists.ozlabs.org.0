Return-Path: <linuxppc-dev+bounces-3182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752B9C8B15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:52:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QQ5SV7z304H;
	Thu, 14 Nov 2024 23:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588686;
	cv=none; b=blRIFrT+b41AedugnO1jY2P4Xti3W702rtUSQp+rBQQkkI4Rmm3NdnCCFfkSkTw0yEKLUDck81doBgjmfQ/DXLCZquMQjVbvvX3j+mpKqS5rZ2nkIGS0MbCkx73+mhzqkZDMYaAO4egKHLE1/3G4/oJgWc6JF5fB8D7RpGUmsp0GNsLlWlcvoXpZXfyiTbs5/Iyl5sawR5KsX4xyqLWzq88OMSlonrxiB4Q30zAxBRWkQmVhOaC7sSgBLRM5h51MCdox+I5pg7LyYx7dQK0rNYmtNgvUKz/uoj0QP3VMgSkaPvOkfo7iYiOuWMSteBhK+qbcmgThdHK+UtEs5yf8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588686; c=relaxed/relaxed;
	bh=KNw9mp3a3oIXwNqDLpHVNtTGvOCQgwVdDAscbVGZevI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCZDNb0iaHB+ENg7VVVwf38ZCUNX5Gtnlm+W1QVpp9CKMZFPeK2bSF6aaWl8X1VSFHpI2pkbd0/uvDKQ7ykg2GTpbhGLiAZeJdpu+fMC7o6QgaLpisy1o5gTra/NMbSeNjnlkgtiyvVXAf/80mVbJusxPagyViP2c1WuL5qSxEddR1pXuqiBW13UjncXS1nO5VmhM5O2/xgfEna5Xa7Und0vRlRmnjVz/4bC/mhNq+gp7uMK0BeMGVULHOYZTw87q8U8I8nFt3byRVnbp1xlWYUWeVd40agLZfr1KvbQqr03KzeIw4S/jHH+Gqs4yrztGJbT7bZZ19JW+ku6e0bd5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ioLlK1DT; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ioLlK1DT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QN40Glz301n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588681;
	bh=KNw9mp3a3oIXwNqDLpHVNtTGvOCQgwVdDAscbVGZevI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ioLlK1DTpi7iAELxSsPvi6d/T/OipIm2QNlHta45suT+oxgbJJGzzZ4UoMjsxxdoc
	 hd7j0nyjD5C+DKMr8+vvlPLI/6ox3KKZLd2lAVQUL2tRECB66FZyCwdLAa0o0OyQav
	 SV6Qod91JJGEAKau2eVOSDiCgRvyliZ+uh01CRQxIwoEgBwgqvuZn+ye7hbf2baSwP
	 iZdxHPqWzhQlQESoOXmQAaSDWHg+pPXsllq+OxB842mCbXIns2cXT7SYOYRYXGVWfh
	 z6HS6PMr67RoRcw281pcz24VsF2pXcq3nBT1tcMK/FdWjSkW15IzCPTs7hBo4fQ67j
	 VtCpO/YqcfajA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QK4b0nz4xSX;
	Thu, 14 Nov 2024 23:51:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 10/20] powerpc/io: Remove PPC_INDIRECT_MMIO
Date: Thu, 14 Nov 2024 23:50:59 +1100
Message-ID: <20241114125111.599093-10-mpe@ellerman.id.au>
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

The Cell blade support was the last user of PPC_INDIRECT_MMIO, so it can
now be removed.

PPC_INDIRECT_PIO is still used by Power8 powernv, so it needs to remain.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/io.h  | 58 +++-------------------------------
 arch/powerpc/kernel/setup_64.c |  2 +-
 arch/powerpc/platforms/Kconfig |  3 --
 3 files changed, 6 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fd92ac450169..fcb4ecca30a4 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -65,8 +65,8 @@ extern resource_size_t isa_mem_base;
 extern bool isa_io_special;
 
 #ifdef CONFIG_PPC32
-#if defined(CONFIG_PPC_INDIRECT_PIO) || defined(CONFIG_PPC_INDIRECT_MMIO)
-#error CONFIG_PPC_INDIRECT_{PIO,MMIO} are not yet supported on 32 bits
+#ifdef CONFIG_PPC_INDIRECT_PIO
+#error CONFIG_PPC_INDIRECT_PIO is not yet supported on 32 bits
 #endif
 #endif
 
@@ -261,9 +261,9 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
  * for PowerPC is as close as possible to the x86 version of these, and thus
  * provides fairly heavy weight barriers for the non-raw versions
  *
- * In addition, they support a hook mechanism when CONFIG_PPC_INDIRECT_MMIO
- * or CONFIG_PPC_INDIRECT_PIO are set allowing the platform to provide its
- * own implementation of some or all of the accessors.
+ * In addition, they support a hook mechanism when CONFIG_PPC_INDIRECT_PIO
+ * is set allowing the platform to provide its own implementation of some
+ * of the accessors.
  */
 
 /*
@@ -277,51 +277,7 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
 /* Shortcut to the MMIO argument pointer */
 #define PCI_IO_ADDR	volatile void __iomem *
 
-/* Indirect IO address tokens:
- *
- * When CONFIG_PPC_INDIRECT_MMIO is set, the platform can provide hooks
- * on all MMIOs. (Note that this is all 64 bits only for now)
- *
- * To help platforms who may need to differentiate MMIO addresses in
- * their hooks, a bitfield is reserved for use by the platform near the
- * top of MMIO addresses (not PIO, those have to cope the hard way).
- *
- * The highest address in the kernel virtual space are:
- *
- *  d0003fffffffffff	# with Hash MMU
- *  c00fffffffffffff	# with Radix MMU
- *
- * The top 4 bits are reserved as the region ID on hash, leaving us 8 bits
- * that can be used for the field.
- *
- * The direct IO mapping operations will then mask off those bits
- * before doing the actual access, though that only happen when
- * CONFIG_PPC_INDIRECT_MMIO is set, thus be careful when you use that
- * mechanism
- *
- * For PIO, there is a separate CONFIG_PPC_INDIRECT_PIO which makes
- * all PIO functions call through a hook.
- */
-
-#ifdef CONFIG_PPC_INDIRECT_MMIO
-#define PCI_IO_IND_TOKEN_SHIFT	52
-#define PCI_IO_IND_TOKEN_MASK	(0xfful << PCI_IO_IND_TOKEN_SHIFT)
-#define PCI_FIX_ADDR(addr)						\
-	((PCI_IO_ADDR)(((unsigned long)(addr)) & ~PCI_IO_IND_TOKEN_MASK))
-#define PCI_GET_ADDR_TOKEN(addr)					\
-	(((unsigned long)(addr) & PCI_IO_IND_TOKEN_MASK) >> 		\
-		PCI_IO_IND_TOKEN_SHIFT)
-#define PCI_SET_ADDR_TOKEN(addr, token) 				\
-do {									\
-	unsigned long __a = (unsigned long)(addr);			\
-	__a &= ~PCI_IO_IND_TOKEN_MASK;					\
-	__a |= ((unsigned long)(token)) << PCI_IO_IND_TOKEN_SHIFT;	\
-	(addr) = (void __iomem *)__a;					\
-} while(0)
-#else
 #define PCI_FIX_ADDR(addr) (addr)
-#endif
-
 
 /*
  * Non ordered and non-swapping "raw" accessors
@@ -632,11 +588,7 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define DEF_PCI_HOOK_pio(x)	NULL
 #endif
 
-#ifdef CONFIG_PPC_INDIRECT_MMIO
-#define DEF_PCI_HOOK_mem(x)	x
-#else
 #define DEF_PCI_HOOK_mem(x)	NULL
-#endif
 
 /* Structure containing all the hooks */
 extern struct ppc_pci_io {
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e67f3048611f..7284c8021eeb 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -892,7 +892,7 @@ unsigned long memory_block_size_bytes(void)
 }
 #endif
 
-#if defined(CONFIG_PPC_INDIRECT_PIO) || defined(CONFIG_PPC_INDIRECT_MMIO)
+#ifdef CONFIG_PPC_INDIRECT_PIO
 struct ppc_pci_io ppc_pci_io;
 EXPORT_SYMBOL(ppc_pci_io);
 #endif
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index d11ade7cf7b3..b78c132d47ab 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -186,9 +186,6 @@ config PPC_INDIRECT_PIO
 	bool
 	select GENERIC_IOMAP
 
-config PPC_INDIRECT_MMIO
-	bool
-
 source "drivers/cpufreq/Kconfig"
 
 menu "CPUIdle driver"
-- 
2.47.0


