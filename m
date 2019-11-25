Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9B108AB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 10:22:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M1lQ27l9zDqXP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 20:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="VjMJ9tJS"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M1jR0zW0zDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 20:20:42 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3405820815;
 Mon, 25 Nov 2019 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574673640;
 bh=Fi19fW3UhD43E5aIZQlfsjj+KTcMlIut7o2IX5hAt/o=;
 h=From:To:Cc:Subject:Date:From;
 b=VjMJ9tJSjOWz4YYNkS0/E7XVyaosLAile51bvOWFgFPu3X5dFsfGK0hdj1k0GPszc
 Eo+H3nmmgypAXP8Ij5Uqq6jbM/8+SumOGa7yttXUgWvPBUkimtTcIcQfx6RsPGN69I
 1GfyIODGb1LPIaS9nBUCzyG5rc6XhbDmRXg7LYdI=
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32: drop unused ISA_DMA_THRESHOLD
Date: Mon, 25 Nov 2019 11:20:33 +0200
Message-Id: <20191125092033.20014-1-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The ISA_DMA_THRESHOLD variable is set by several platforms but never
referenced.
Remove it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/include/asm/dma.h          | 3 +--
 arch/powerpc/kernel/setup_32.c          | 1 -
 arch/powerpc/platforms/44x/warp.c       | 3 ---
 arch/powerpc/platforms/52xx/efika.c     | 1 -
 arch/powerpc/platforms/amigaone/setup.c | 1 -
 arch/powerpc/platforms/chrp/setup.c     | 1 -
 arch/powerpc/platforms/powermac/setup.c | 1 -
 7 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/dma.h b/arch/powerpc/include/asm/dma.h
index 1b4f0254868f..6161a9596196 100644
--- a/arch/powerpc/include/asm/dma.h
+++ b/arch/powerpc/include/asm/dma.h
@@ -151,10 +151,9 @@
 #define DMA2_EXT_REG		0x4D6
 
 #ifndef __powerpc64__
-    /* in arch/ppc/kernel/setup.c -- Cort */
+    /* in arch/powerpc/kernel/setup_32.c -- Cort */
     extern unsigned int DMA_MODE_WRITE;
     extern unsigned int DMA_MODE_READ;
-    extern unsigned long ISA_DMA_THRESHOLD;
 #else
     #define DMA_MODE_READ	0x44	/* I/O to memory, no autoinit, increment, single mode */
     #define DMA_MODE_WRITE	0x48	/* memory to I/O, no autoinit, increment, single mode */
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index a7541edf0cdb..e019f450cf9a 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -57,7 +57,6 @@ EXPORT_SYMBOL_GPL(boot_cpuid_phys);
 int smp_hw_index[NR_CPUS];
 EXPORT_SYMBOL(smp_hw_index);
 
-unsigned long ISA_DMA_THRESHOLD;
 unsigned int DMA_MODE_READ;
 unsigned int DMA_MODE_WRITE;
 
diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index 6620b64e4963..665f18e37efb 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -43,9 +43,6 @@ static int __init warp_probe(void)
 	if (!of_machine_is_compatible("pika,warp"))
 		return 0;
 
-	/* For arch_dma_alloc */
-	ISA_DMA_THRESHOLD = ~0L;
-
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 61538869e88a..4514a6f7458a 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -205,7 +205,6 @@ static int __init efika_probe(void)
 	if (strcmp(model, "EFIKA5K2"))
 		return 0;
 
-	ISA_DMA_THRESHOLD = ~0L;
 	DMA_MODE_READ = 0x44;
 	DMA_MODE_WRITE = 0x48;
 
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index ea5e45e32683..f5d0bf999759 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -146,7 +146,6 @@ static int __init amigaone_probe(void)
 		 */
 		cur_cpu_spec->cpu_features &= ~CPU_FTR_NEED_COHERENT;
 
-		ISA_DMA_THRESHOLD = 0x00ffffff;
 		DMA_MODE_READ = 0x44;
 		DMA_MODE_WRITE = 0x48;
 
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index fcf6f2342ef4..590d292f47e6 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -573,7 +573,6 @@ static int __init chrp_probe(void)
  	if (strcmp(dtype, "chrp"))
 		return 0;
 
-	ISA_DMA_THRESHOLD = ~0L;
 	DMA_MODE_READ = 0x44;
 	DMA_MODE_WRITE = 0x48;
 
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index c6d5333729ed..95fb4feb6ccc 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -586,7 +586,6 @@ static int __init pmac_probe(void)
 
 #ifdef CONFIG_PPC32
 	/* isa_io_base gets set in pmac_pci_init */
-	ISA_DMA_THRESHOLD = ~0L;
 	DMA_MODE_READ = 1;
 	DMA_MODE_WRITE = 2;
 #endif /* CONFIG_PPC32 */
-- 
2.24.0

