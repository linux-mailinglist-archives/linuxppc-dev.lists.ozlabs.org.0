Return-Path: <linuxppc-dev+bounces-8846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC6ABFC6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 19:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2dz65HFlz2xqG;
	Thu, 22 May 2025 03:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747849330;
	cv=none; b=WXvEQYhX9U60tCz9ePLt1Rn/l0pzfonHmHfRFBlIpi/4kS8GQEznqCnKME7ppFSo7GunEVTq4DPdPl45aznoOzkM1LkH750S4PiueknCQY/iyLCu9C6FR2X0SQyCc77eIIXLydltaj5oH5VS2OLbdma3vZxdf1dOf8m1dT+8Ak9MCZ5bodGMFjlhJN6XIl6K1TbC4ELZZwau0yGX5BjXSVkLPdHjgppqjcxBMoAw6yJTGpcADpzEqAkUhAL0k3Vrjpr0sJIfG3ch+BfK1GXc6MY4balee9Udwp+V55tI23+W8/GyvywzR9HaXDC5xhKts1Pxry2SgqryV42iGWRVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747849330; c=relaxed/relaxed;
	bh=z2RtpehMoltKaAyI33ch9sMq6uy/YngHP0qu0/KZx5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I88yEnRNzX8K+Z/DcdhXvX5u6XlBFQax6hCVpNH3psUawf/fJ1Xk9oc6TEUdNFiI8wUxzcgloL9ZRhYaP7svuxuHeFVVEJuBuQdTRENr/65p9vuVREemMpOx0CD+iXyOCLZbcQzz3mafUUDpImLiykupw+XO47UVCVgLFdT53jwupW0O1f0yFYRoSd6meOi0YTBjJ3RsqeGY7Q1x7FrP3uvTHhHzepN8jpKbZdIABmSGRzDSqKh0VBUHyV4bBOSO+5xgrwh/sPUMk6jtbXTleCUTy8kkiukkGBAyKPiGEyepsotnlN9AoihXKlvTSL6QJEQr8yWuaOE6fHVc0DVCTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XR59sJ91; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XR59sJ91;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2dz35khVz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 03:42:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747849328; x=1779385328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zILedU8aIBwOZV+2G1TrvBXeLPQ8UB3Yl8VhAYL566s=;
  b=XR59sJ91sQpEM3f2dKFvwrk8AXuqmDZTGBg71EwPOQ1EWs0kzwo9PBI1
   9LCHPZ6ZNOsgt8NEgVEnqwX26ozO4HO0Khn3pQwwUJU4srufaoVayN4R+
   lB0wXTDEIHhLi6B5CtM0qwYA+DLwgMSc62VbtbykXhRCurbr4ryJhGlvB
   TMV40a4RK7fhvCYb7eU/iouLlg/XvGZYkJwYhA+FO7KUKOq2lm5UKgnYt
   KY28mVlgpeuFw2Joxj5uaPH4E6egM+CC+UHEqHVOlbw2ceZQG4rl35qqX
   rOJ5RfTywNAsSEvaVKss4KKUBz+KoHKXAJPyTKa5XmA+4IPkSEbyPOI8F
   g==;
X-CSE-ConnectionGUID: 5rP281/CRTWtaSkL5jwHXA==
X-CSE-MsgGUID: KJQBLyXiTj+E0ltA+0cAsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61252122"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61252122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 10:42:04 -0700
X-CSE-ConnectionGUID: qNbmyK/7TbGW6UT8eUGwcg==
X-CSE-MsgGUID: ECERoRRvSN6yuz91U4AnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="171042032"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 10:41:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DC1DA368; Wed, 21 May 2025 20:41:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>
Subject: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
Date: Wed, 21 May 2025 20:41:52 +0300
Message-ID: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the commit 3d86739c6343 ("floppy: always use the track buffer")
the CROSS_64K() is not used by the driver, remove the leftovers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/alpha/include/asm/floppy.h    | 19 -------------------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ----
 arch/mips/include/asm/floppy.h     | 15 ---------------
 arch/parisc/include/asm/floppy.h   |  6 +-----
 arch/powerpc/include/asm/floppy.h  |  5 -----
 arch/sparc/include/asm/floppy_32.h |  3 ---
 arch/sparc/include/asm/floppy_64.h |  3 ---
 arch/x86/include/asm/floppy.h      |  5 +----
 9 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/arch/alpha/include/asm/floppy.h b/arch/alpha/include/asm/floppy.h
index 64b42d9591fc..5a6239e65097 100644
--- a/arch/alpha/include/asm/floppy.h
+++ b/arch/alpha/include/asm/floppy.h
@@ -90,25 +90,6 @@ static int FDC2 = -1;
 #define N_FDC 2
 #define N_DRIVE 8
 
-/*
- * Most Alphas have no problems with floppy DMA crossing 64k borders,
- * except for certain ones, like XL and RUFFIAN.
- *
- * However, the test is simple and fast, and this *is* floppy, after all,
- * so we do it for all platforms, just to make sure.
- *
- * This is advantageous in other circumstances as well, as in moving
- * about the PCI DMA windows and forcing the floppy to start doing
- * scatter-gather when it never had before, and there *is* a problem
- * on that platform... ;-}
- */
-
-static inline unsigned long CROSS_64KB(void *a, unsigned long s)
-{
-	unsigned long p = (unsigned long)a;
-	return ((p + s - 1) ^ p) & ~0xffffUL;
-}
-
 #define EXTRA_FLOPPY_PARAMS
 
 #endif /* __ASM_ALPHA_FLOPPY_H */
diff --git a/arch/arm/include/asm/floppy.h b/arch/arm/include/asm/floppy.h
index e1cb04ed5008..e579f77162e9 100644
--- a/arch/arm/include/asm/floppy.h
+++ b/arch/arm/include/asm/floppy.h
@@ -65,8 +65,6 @@ static unsigned char floppy_selects[4] = { 0x10, 0x21, 0x23, 0x33 };
 #define N_FDC 1
 #define N_DRIVE 4
 
-#define CROSS_64KB(a,s) (0)
-
 /*
  * This allows people to reverse the order of
  * fd0 and fd1, in case their hardware is
diff --git a/arch/m68k/include/asm/floppy.h b/arch/m68k/include/asm/floppy.h
index a4d0fea47c6b..dea98bbc0932 100644
--- a/arch/m68k/include/asm/floppy.h
+++ b/arch/m68k/include/asm/floppy.h
@@ -107,13 +107,9 @@ static void fd_free_irq(void)
 
 #define fd_free_dma()             /* nothing */
 
-/* No 64k boundary crossing problems on Q40 - no DMA at all */
-#define CROSS_64KB(a,s) (0)
-
 #define DMA_MODE_READ  0x44    /* i386 look-alike */
 #define DMA_MODE_WRITE 0x48
 
-
 static int m68k_floppy_init(void)
 {
   use_virtual_dma =1;
diff --git a/arch/mips/include/asm/floppy.h b/arch/mips/include/asm/floppy.h
index 021d09ae5670..44da2ff91f65 100644
--- a/arch/mips/include/asm/floppy.h
+++ b/arch/mips/include/asm/floppy.h
@@ -34,21 +34,6 @@ static inline void fd_cacheflush(char * addr, long size)
 #define N_FDC 1			/* do you *really* want a second controller? */
 #define N_DRIVE 8
 
-/*
- * The DMA channel used by the floppy controller cannot access data at
- * addresses >= 16MB
- *
- * Went back to the 1MB limit, as some people had problems with the floppy
- * driver otherwise. It doesn't matter much for performance anyway, as most
- * floppy accesses go through the track buffer.
- *
- * On MIPSes using vdma, this actually means that *all* transfers go thru
- * the * track buffer since 0x1000000 is always smaller than KSEG0/1.
- * Actually this needs to be a bit more complicated since the so much different
- * hardware available with MIPS CPUs ...
- */
-#define CROSS_64KB(a, s) ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64)
-
 #define EXTRA_FLOPPY_PARAMS
 
 #include <floppy.h>
diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index b318a7df52f6..df20dbef3ada 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -22,13 +22,9 @@
 #define _CROSS_64KB(a,s,vdma) \
 (!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
 
-#define CROSS_64KB(a,s) _CROSS_64KB(a,s,use_virtual_dma & 1)
-
-
 #define SW fd_routine[use_virtual_dma&1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
 
-
 #define fd_inb(base, reg)		readb((base) + (reg))
 #define fd_outb(value, base, reg)	writeb(value, (base) + (reg))
 
@@ -206,7 +202,7 @@ static int vdma_dma_setup(char *addr, unsigned long size, int mode, int io)
 static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 {
 #ifdef FLOPPY_SANITY_CHECK
-	if (CROSS_64KB(addr, size)) {
+	if (_CROSS_64KB(addr, size, use_virtual_dma & 1)) {
 		printk("DMA crossing 64-K boundary %p-%p\n", addr, addr+size);
 		return -1;
 	}
diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..048c0c5cdf30 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -203,11 +203,6 @@ static int FDC2 = -1;
 #define N_FDC 2			/* Don't change this! */
 #define N_DRIVE 8
 
-/*
- * The PowerPC has no problems with floppy DMA crossing 64k borders.
- */
-#define CROSS_64KB(a,s)	(0)
-
 #define EXTRA_FLOPPY_PARAMS
 
 #endif /* __KERNEL__ */
diff --git a/arch/sparc/include/asm/floppy_32.h b/arch/sparc/include/asm/floppy_32.h
index 836f6575aa1d..7251d1fed7a4 100644
--- a/arch/sparc/include/asm/floppy_32.h
+++ b/arch/sparc/include/asm/floppy_32.h
@@ -96,9 +96,6 @@ static struct sun_floppy_ops sun_fdops;
 #define N_FDC    1
 #define N_DRIVE  8
 
-/* No 64k boundary crossing problems on the Sparc. */
-#define CROSS_64KB(a,s) (0)
-
 /* Routines unique to each controller type on a Sun. */
 static void sun_set_dor(unsigned char value, int fdc_82077)
 {
diff --git a/arch/sparc/include/asm/floppy_64.h b/arch/sparc/include/asm/floppy_64.h
index b0f633ce3518..135f9a49b6ba 100644
--- a/arch/sparc/include/asm/floppy_64.h
+++ b/arch/sparc/include/asm/floppy_64.h
@@ -95,9 +95,6 @@ static int sun_floppy_types[2] = { 0, 0 };
 #define N_FDC    1
 #define N_DRIVE  8
 
-/* No 64k boundary crossing problems on the Sparc. */
-#define CROSS_64KB(a,s) (0)
-
 static unsigned char sun_82077_fd_inb(unsigned long base, unsigned int reg)
 {
 	udelay(5);
diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
index 6ec3fc969ad5..e76cb74bbed2 100644
--- a/arch/x86/include/asm/floppy.h
+++ b/arch/x86/include/asm/floppy.h
@@ -24,9 +24,6 @@
 	(!(vdma) &&							\
 	 ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
 
-#define CROSS_64KB(a, s) _CROSS_64KB(a, s, use_virtual_dma & 1)
-
-
 #define SW fd_routine[use_virtual_dma & 1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
 
@@ -206,7 +203,7 @@ static int vdma_dma_setup(char *addr, unsigned long size, int mode, int io)
 static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 {
 #ifdef FLOPPY_SANITY_CHECK
-	if (CROSS_64KB(addr, size)) {
+	if (_CROSS_64KB(addr, size, use_virtual_dma & 1)) {
 		printk("DMA crossing 64-K boundary %p-%p\n", addr, addr+size);
 		return -1;
 	}
-- 
2.47.2


