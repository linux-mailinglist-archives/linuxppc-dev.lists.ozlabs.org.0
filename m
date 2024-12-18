Return-Path: <linuxppc-dev+bounces-4300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB269F6415
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF94Yzcz2xHl;
	Wed, 18 Dec 2024 21:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519341;
	cv=none; b=PBXYcjLbYJcbQ52Z/zlwpJmCyAjjPFHJrkOUKjhZ8r5rOO9a52vWI/c3U3lsefMaWp/dE7QZhCZGrFt1iWbHUpgbsHwGS2Gy075Beklqf8LljXC9GjKJ4N4wvZgGZ4a4z66KYjYNcsz+ogpIFNW4/a0z83J+MlFxQwHgEixCISTJSKoCkXOVqye+80XFuH4etR8xXJ3QW0rIvoL0qFWqQJXqyNNwFeZOaudcJ24dTGmqJCEzbfcRynfshucR8k4uvKa90/TQef3mt2EJVfqBBuGu+5wMe6E+XvWoyagPO+tbwhL7sHwDK6wNURze8FgJhs0YxM36TK+NBzK0Atg/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519341; c=relaxed/relaxed;
	bh=EtS9SWkZOAtjjC4xYpv4pu6/xI4u3pbCjSdaG1UQkG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hfa27NyZCW82Ss0Z5qGvyaAUIqZkutSJvYGzb1sdYjvLZeV7r0Gh9Szs+jrQHdTcjdjfCFqDp1LjeekWCuPI8LmcMdNBOonVC9RVjvj0n6zNjUWOdlmci9I/7SAQdhflc+MmpQINVEjZM3Sun2qryniedBtiLS5TjgiuRth2Fo8Z0d+yF4xKYCiF959CnX8azAEEPxMDy462CZhRTSWLZlZ+kmAyPo26pKhuFRkF7TV4bwgqL1+HjYBNft2FIIBQ4eFwv16Q9PT45YVIClOigPfoYHr+USHAPgnFbYkVR4fMeGs3od4c7NV5EVNTgkYJinQ1yVmWcdIkmup3YYUlBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pRsZHYjU; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pRsZHYjU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF56tl9z30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519331;
	bh=EtS9SWkZOAtjjC4xYpv4pu6/xI4u3pbCjSdaG1UQkG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRsZHYjULNOqwsBxNkaDmYyqAgHO/9NV6N37cTePuA7zuP+kZNzxRy6OrUadIsWQG
	 /xiDdyULoa35B/5oQ4N47tTyRDMD8cLKaZMfHxuPfmCd/KGonCKCkTnjyXJDoWTuDp
	 2hXGVGCHbTEKgT82ugivHz4RzQnk6W4GbjMQBu3E5FQs7we1mJJ0faFeBiq/6d2gFt
	 +1CsOS2gixBICSfze50a3awT5rlYTJsAQAFEMyQPDMWVA+vuDjOqaforAZC9BtqlAT
	 oWrv38E/kg4P/ac0YuZu/KxWloCM22uZj3x7MGtBb1Z0alsgX1xFfTbkzgvvkwuQrG
	 zEtDd9g4k1Ddw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDz1fJsz4xfG;
	Wed, 18 Dec 2024 21:55:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 10/25] powerpc/io: Remove PPC_INDIRECT_MMIO
Date: Wed, 18 Dec 2024 21:54:58 +1100
Message-ID: <20241218105523.416573-10-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The Cell blade support was the last user of PPC_INDIRECT_MMIO, so it can
now be removed.

PPC_INDIRECT_PIO is still used by Power8 powernv, so it needs to remain.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

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
2.47.1


