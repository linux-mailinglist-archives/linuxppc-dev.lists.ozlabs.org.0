Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676D6CA418
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXDT3Qbpz3fvD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gbyhgTZg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gbyhgTZg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWxw1mhqz3fWv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:16:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4307B8118A;
	Mon, 27 Mar 2023 12:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6ACC4339B;
	Mon, 27 Mar 2023 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919376;
	bh=kZ0whxymVbLS460yE7omdNABwzoFPMXv5cC9T62VHxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbyhgTZgjGWI3oriwUtSiZyOWJ+ndxgmQzOH83pCswXdUkt6Lhnl1YglFRPAZXdyP
	 IQZ4ax+myG2pMYp2j+0j+I6+1nWVCf8bVkhjue0wkEVNf9sg9ONOcDm9F0V1JfRV79
	 iFS6tHngpUfRbCZ84cnblXSqWEAG0sD0d+pFLtnU7X6zJVekWzUKOYNWgqkwtiSrTl
	 pdTx/73pQmqmOkvaPTSZnlA1INFgJg6gytF+N1/ofFih7tP03nsskKQG4wdrnabV5a
	 GEn1PscP/E8YaRmJ2E2QXPRxpOnFB3LZOFWS2Bit7jKcQ+GedIyvBqHaEpG21wx91/
	 8nuPebpFkBNOw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/21] ARM: dma-mapping: bring back dmac_{clean,inv}_range
Date: Mon, 27 Mar 2023 14:13:12 +0200
Message-Id: <20230327121317.4081816-17-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Sime
 k <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

These were remove ages ago in commit 702b94bff3c5 ("ARM: dma-mapping:
remove dmac_clean_range and dmac_inv_range") in an effort to sanitize
the dma-mapping API.

Now this logic is getting moved into the generic dma-mapping
implementation in order to give architectures less control over
it, which requires reverting that earlier work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/cacheflush.h | 21 +++++++++++++++++++++
 arch/arm/include/asm/glue-cache.h |  4 ++++
 arch/arm/mm/cache-fa.S            |  4 ++--
 arch/arm/mm/cache-nop.S           |  6 ++++++
 arch/arm/mm/cache-v4.S            |  5 +++++
 arch/arm/mm/cache-v4wb.S          |  4 ++--
 arch/arm/mm/cache-v4wt.S          | 14 +++++++++++++-
 arch/arm/mm/cache-v6.S            |  4 ++--
 arch/arm/mm/cache-v7.S            |  6 ++++--
 arch/arm/mm/cache-v7m.S           |  4 ++--
 arch/arm/mm/proc-arm1020.S        |  4 ++--
 arch/arm/mm/proc-arm1020e.S       |  4 ++--
 arch/arm/mm/proc-arm1022.S        |  4 ++--
 arch/arm/mm/proc-arm1026.S        |  4 ++--
 arch/arm/mm/proc-arm920.S         |  4 ++--
 arch/arm/mm/proc-arm922.S         |  4 ++--
 arch/arm/mm/proc-arm925.S         |  4 ++--
 arch/arm/mm/proc-arm926.S         |  4 ++--
 arch/arm/mm/proc-arm940.S         |  4 ++--
 arch/arm/mm/proc-arm946.S         |  4 ++--
 arch/arm/mm/proc-feroceon.S       |  8 ++++----
 arch/arm/mm/proc-macros.S         |  2 ++
 arch/arm/mm/proc-mohawk.S         |  4 ++--
 arch/arm/mm/proc-xsc3.S           |  4 ++--
 arch/arm/mm/proc-xscale.S         |  6 ++++--
 25 files changed, 95 insertions(+), 41 deletions(-)

diff --git a/arch/arm/include/asm/cacheflush.h b/arch/arm/include/asm/cacheflush.h
index a094f964c869..04462bfe9130 100644
--- a/arch/arm/include/asm/cacheflush.h
+++ b/arch/arm/include/asm/cacheflush.h
@@ -91,6 +91,21 @@
  *	DMA Cache Coherency
  *	===================
  *
+ *	dma_inv_range(start, end)
+ *
+ *		Invalidate (discard) the specified virtual address range.
+ *		May not write back any entries.  If 'start' or 'end'
+ *		are not cache line aligned, those lines must be written
+ *		back.
+ *		- start  - virtual start address
+ *		- end    - virtual end address
+ *
+ *	dma_clean_range(start, end)
+ *
+ *		Clean (write back) the specified virtual address range.
+ *		- start  - virtual start address
+ *		- end    - virtual end address
+ *
  *	dma_flush_range(start, end)
  *
  *		Clean and invalidate the specified virtual address range.
@@ -112,6 +127,8 @@ struct cpu_cache_fns {
 	void (*dma_map_area)(const void *, size_t, int);
 	void (*dma_unmap_area)(const void *, size_t, int);
 
+	void (*dma_clean_range)(const void *, const void *);
+	void (*dma_inv_range)(const void *, const void *);
 	void (*dma_flush_range)(const void *, const void *);
 } __no_randomize_layout;
 
@@ -137,6 +154,8 @@ extern struct cpu_cache_fns cpu_cache;
  * is visible to DMA, or data written by DMA to system memory is
  * visible to the CPU.
  */
+#define dmac_clean_range		cpu_cache.dma_clean_range
+#define dmac_inv_range			cpu_cache.dma_inv_range
 #define dmac_flush_range		cpu_cache.dma_flush_range
 
 #else
@@ -156,6 +175,8 @@ extern void __cpuc_flush_dcache_area(void *, size_t);
  * is visible to DMA, or data written by DMA to system memory is
  * visible to the CPU.
  */
+extern void dmac_clean_range(const void *, const void *);
+extern void dmac_inv_range(const void *, const void *);
 extern void dmac_flush_range(const void *, const void *);
 
 #endif
diff --git a/arch/arm/include/asm/glue-cache.h b/arch/arm/include/asm/glue-cache.h
index 724f8dac1e5b..d8c93b483adf 100644
--- a/arch/arm/include/asm/glue-cache.h
+++ b/arch/arm/include/asm/glue-cache.h
@@ -139,6 +139,8 @@ static inline int nop_coherent_user_range(unsigned long a,
 		unsigned long b) { return 0; }
 static inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
 
+static inline void nop_dma_clean_range(const void *a, const void *b) { }
+static inline void nop_dma_inv_range(const void *a, const void *b) { }
 static inline void nop_dma_flush_range(const void *a, const void *b) { }
 
 static inline void nop_dma_map_area(const void *s, size_t l, int f) { }
@@ -155,6 +157,8 @@ static inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
 #define __cpuc_coherent_user_range	__glue(_CACHE,_coherent_user_range)
 #define __cpuc_flush_dcache_area	__glue(_CACHE,_flush_kern_dcache_area)
 
+#define dmac_clean_range		__glue(_CACHE,_dma_clean_range)
+#define dmac_inv_range			__glue(_CACHE,_dma_inv_range)
 #define dmac_flush_range		__glue(_CACHE,_dma_flush_range)
 #endif
 
diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index 3a464d1649b4..abc3d58948dd 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -166,7 +166,7 @@ ENTRY(fa_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-fa_dma_inv_range:
+ENTRY(fa_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c14, 1		@ clean & invalidate D entry
@@ -189,7 +189,7 @@ fa_dma_inv_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-fa_dma_clean_range:
+ENTRY(fa_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/cache-nop.S b/arch/arm/mm/cache-nop.S
index 72d939ef8798..a058544d6c2b 100644
--- a/arch/arm/mm/cache-nop.S
+++ b/arch/arm/mm/cache-nop.S
@@ -32,6 +32,12 @@ ENDPROC(nop_coherent_user_range)
 	.globl nop_flush_kern_dcache_area
 	.equ nop_flush_kern_dcache_area, nop_flush_icache_all
 
+	.globl nop_dma_clean_range
+	.equ nop_dma_clean_range, nop_flush_icache_all
+
+	.globl nop_dma_inv_range
+	.equ nop_dma_inv_range, nop_flush_icache_all
+
 	.globl nop_dma_flush_range
 	.equ nop_dma_flush_range, nop_flush_icache_all
 
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index e2b104876340..b747e591109c 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -103,17 +103,22 @@ ENTRY(v4_flush_kern_dcache_area)
 
 /*
  *	dma_flush_range(start, end)
+ *	dma_inv_range(start, end)
  *
  *	Clean and invalidate the specified virtual address range.
+ *	As only write-through caches are supported here, this is the
+ *	same as invalidate, while the clean operation does nothing.
  *
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
+ENTRY(v4_dma_inv_range)
 ENTRY(v4_dma_flush_range)
 #ifdef CONFIG_CPU_CP15
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c7, 0		@ flush ID cache
 #endif
+ENTRY(v4_dma_clean_range)
 	ret	lr
 
 /*
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 905ac2fa2b1e..55f609eae38d 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -183,7 +183,7 @@ ENTRY(v4wb_coherent_user_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-v4wb_dma_inv_range:
+ENTRY(v4wb_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -204,7 +204,7 @@ v4wb_dma_inv_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-v4wb_dma_clean_range:
+ENTRY(v4wb_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 652218752f88..1a88627ec09b 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -152,7 +152,7 @@ ENTRY(v4wt_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-v4wt_dma_inv_range:
+ENTRY(v4wt_dma_inv_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -171,6 +171,18 @@ v4wt_dma_inv_range:
 	.globl	v4wt_dma_flush_range
 	.equ	v4wt_dma_flush_range, v4wt_dma_inv_range
 
+/*
+ *	dma_clean_range(start, end)
+ *
+ *	Clean the specified virtual address range.
+ *	Empty implementation for writethrough caches.
+ *
+ *	- start  - virtual start address
+ *	- end	 - virtual end address
+ */
+	.globl	v4wt_dma_clean_range
+	.equ	v4wt_dma_clean_range, v4wt_dma_unmap_area
+
 /*
  *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 250c83bf7158..abae7ff5defc 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -200,7 +200,7 @@ ENTRY(v6_flush_kern_dcache_area)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v6_dma_inv_range:
+ENTRY(v6_dma_inv_range)
 #ifdef CONFIG_DMA_CACHE_RWFO
 	ldrb	r2, [r0]			@ read for ownership
 	strb	r2, [r0]			@ write for ownership
@@ -245,7 +245,7 @@ v6_dma_inv_range:
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v6_dma_clean_range:
+ENTRY(v6_dma_clean_range)
 	bic	r0, r0, #D_CACHE_LINE_SIZE - 1
 1:
 #ifdef CONFIG_DMA_CACHE_RWFO
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 127afe2096ba..b16a0d2a7cce 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -361,7 +361,7 @@ ENDPROC(v7_flush_kern_dcache_area)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v7_dma_inv_range:
+ENTRY(v7_dma_inv_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	tst	r0, r3
@@ -391,7 +391,7 @@ ENDPROC(v7_dma_inv_range)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v7_dma_clean_range:
+ENTRY(v7_dma_clean_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	bic	r0, r0, r3
@@ -477,6 +477,8 @@ ENDPROC(v7_dma_unmap_area)
 
 	globl_equ	b15_dma_map_area,		v7_dma_map_area
 	globl_equ	b15_dma_unmap_area,		v7_dma_unmap_area
+	globl_equ	b15_dma_clean_range,		v7_dma_clean_range
+	globl_equ	b15_dma_inv_range,		v7_dma_inv_range
 	globl_equ	b15_dma_flush_range,		v7_dma_flush_range
 
 	define_cache_functions b15
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index eb60b5e5e2ad..4fc6e0028e40 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -364,7 +364,7 @@ ENDPROC(v7m_flush_kern_dcache_area)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v7m_dma_inv_range:
+ENTRY(v7m_dma_inv_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	tst	r0, r3
@@ -390,7 +390,7 @@ ENDPROC(v7m_dma_inv_range)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-v7m_dma_clean_range:
+ENTRY(v7m_dma_clean_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	bic	r0, r0, r3
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 6837cf7a4812..0089e366f4e8 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -263,7 +263,7 @@ ENTRY(arm1020_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm1020_dma_inv_range:
+ENTRY(arm1020_dma_inv_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	tst	r0, #CACHE_DLINESIZE - 1
@@ -293,7 +293,7 @@ arm1020_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm1020_dma_clean_range:
+ENTRY(arm1020_dma_clean_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index df49b10250b8..c662e55a76fa 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -256,7 +256,7 @@ ENTRY(arm1020e_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm1020e_dma_inv_range:
+ENTRY(arm1020e_dma_inv_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	tst	r0, #CACHE_DLINESIZE - 1
@@ -282,7 +282,7 @@ arm1020e_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm1020e_dma_clean_range:
+ENTRY(arm1020e_dma_clean_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index e89ce467f672..e77328906bc5 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -256,7 +256,7 @@ ENTRY(arm1022_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm1022_dma_inv_range:
+ENTRY(arm1022_dma_inv_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	tst	r0, #CACHE_DLINESIZE - 1
@@ -282,7 +282,7 @@ arm1022_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm1022_dma_clean_range:
+ENTRY(arm1022_dma_clean_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 7fdd1a205e8e..a23f9fa28d07 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -250,7 +250,7 @@ ENTRY(arm1026_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm1026_dma_inv_range:
+ENTRY(arm1026_dma_inv_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	tst	r0, #CACHE_DLINESIZE - 1
@@ -276,7 +276,7 @@ arm1026_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm1026_dma_clean_range:
+ENTRY(arm1026_dma_clean_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index a234cd8ba5e6..4c918ab106f3 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -232,7 +232,7 @@ ENTRY(arm920_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm920_dma_inv_range:
+ENTRY(arm920_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -255,7 +255,7 @@ arm920_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm920_dma_clean_range:
+ENTRY(arm920_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 53c029dcfd83..6ac7bb7d94a4 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -234,7 +234,7 @@ ENTRY(arm922_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm922_dma_inv_range:
+ENTRY(arm922_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -257,7 +257,7 @@ arm922_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm922_dma_clean_range:
+ENTRY(arm922_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 0bfad62ea858..860f0074ff81 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -280,7 +280,7 @@ ENTRY(arm925_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm925_dma_inv_range:
+ENTRY(arm925_dma_inv_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	tst	r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -305,7 +305,7 @@ arm925_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm925_dma_clean_range:
+ENTRY(arm925_dma_clean_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 0487a2c3439b..519f62e023c5 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -243,7 +243,7 @@ ENTRY(arm926_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-arm926_dma_inv_range:
+ENTRY(arm926_dma_inv_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	tst	r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -268,7 +268,7 @@ arm926_dma_inv_range:
  *
  * (same as v4wb)
  */
-arm926_dma_clean_range:
+ENTRY(arm926_dma_clean_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index cf9bfcc825ca..14dda5c5ee4a 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -177,7 +177,7 @@ ENTRY(arm940_flush_kern_dcache_area)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-arm940_dma_inv_range:
+ENTRY(arm940_dma_inv_range)
 	mov	ip, #0
 	mov	r1, #(CACHE_DSEGMENTS - 1) << 4	@ 4 segments
 1:	orr	r3, r1, #(CACHE_DENTRIES - 1) << 26 @ 64 entries
@@ -198,7 +198,7 @@ arm940_dma_inv_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-arm940_dma_clean_range:
+ENTRY(arm940_dma_clean_range)
 ENTRY(cpu_arm940_dcache_clean_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 6fb3898ad1cd..91f62a7d334b 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -222,7 +222,7 @@ ENTRY(arm946_flush_kern_dcache_area)
  *	- end	- virtual end address
  * (same as arm926)
  */
-arm946_dma_inv_range:
+ENTRY(arm946_dma_inv_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	tst	r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -247,7 +247,7 @@ arm946_dma_inv_range:
  *
  * (same as arm926)
  */
-arm946_dma_clean_range:
+ENTRY(arm946_dma_clean_range)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 61ce82aca6f0..86122bad6d9b 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -271,7 +271,7 @@ ENTRY(feroceon_range_flush_kern_dcache_area)
  * (same as v4wb)
  */
 	.align	5
-feroceon_dma_inv_range:
+ENTRY(feroceon_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -285,7 +285,7 @@ feroceon_dma_inv_range:
 	ret	lr
 
 	.align	5
-feroceon_range_dma_inv_range:
+ENTRY(feroceon_range_dma_inv_range)
 	mrs	r2, cpsr
 	tst	r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -311,7 +311,7 @@ feroceon_range_dma_inv_range:
  * (same as v4wb)
  */
 	.align	5
-feroceon_dma_clean_range:
+ENTRY(feroceon_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -321,7 +321,7 @@ feroceon_dma_clean_range:
 	ret	lr
 
 	.align	5
-feroceon_range_dma_clean_range:
+ENTRY(feroceon_range_dma_clean_range)
 	mrs	r2, cpsr
 	cmp	r1, r0
 	subne	r1, r1, #1			@ top address is inclusive
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e43f6d716b4b..c1328955fd2a 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -334,6 +334,8 @@ ENTRY(\name\()_cache_fns)
 	.long	\name\()_flush_kern_dcache_area
 	.long	\name\()_dma_map_area
 	.long	\name\()_dma_unmap_area
+	.long	\name\()_dma_clean_range
+	.long	\name\()_dma_inv_range
 	.long	\name\()_dma_flush_range
 	.size	\name\()_cache_fns, . - \name\()_cache_fns
 .endm
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 1645ccaffe96..db3a2f00372a 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -216,7 +216,7 @@ ENTRY(mohawk_flush_kern_dcache_area)
  *
  * (same as v4wb)
  */
-mohawk_dma_inv_range:
+ENTRY(mohawk_dma_inv_range)
 	tst	r0, #CACHE_DLINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
 	tst	r1, #CACHE_DLINESIZE - 1
@@ -239,7 +239,7 @@ mohawk_dma_inv_range:
  *
  * (same as v4wb)
  */
-mohawk_dma_clean_range:
+ENTRY(mohawk_dma_clean_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index a17afe7e195a..6db611a945f3 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -263,7 +263,7 @@ ENTRY(xsc3_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-xsc3_dma_inv_range:
+ENTRY(xsc3_dma_inv_range)
 	tst	r0, #CACHELINESIZE - 1
 	bic	r0, r0, #CACHELINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean L1 D line
@@ -284,7 +284,7 @@ xsc3_dma_inv_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-xsc3_dma_clean_range:
+ENTRY(xsc3_dma_clean_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean L1 D line
 	add	r0, r0, #CACHELINESIZE
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index d82590aa71c0..291dec830714 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -323,7 +323,7 @@ ENTRY(xscale_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-xscale_dma_inv_range:
+ENTRY(xscale_dma_inv_range)
 	tst	r0, #CACHELINESIZE - 1
 	bic	r0, r0, #CACHELINESIZE - 1
 	mcrne	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -344,7 +344,7 @@ xscale_dma_inv_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-xscale_dma_clean_range:
+ENTRY(xscale_dma_clean_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHELINESIZE
@@ -445,6 +445,8 @@ ENDPROC(xscale_dma_unmap_area)
 	a0_alias coherent_kern_range
 	a0_alias coherent_user_range
 	a0_alias flush_kern_dcache_area
+	a0_alias dma_clean_range
+	a0_alias dma_inv_range
 	a0_alias dma_flush_range
 	a0_alias dma_unmap_area
 
-- 
2.39.2

