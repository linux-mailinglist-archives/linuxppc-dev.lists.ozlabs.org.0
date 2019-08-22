Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C43969998E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:49:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dr9N5HRrzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:49:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DrWCV0j4"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DqqS63x7zDrV2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:34:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DqqJ5zxfz9v0d8;
 Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DrWCV0j4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e168W99EZapQ; Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DqqJ4vtyz9v0d3;
 Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566491644; bh=fR+AWYhg9o2kTt90WywbhNpAk6dzkKReMMYjF2367WI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=DrWCV0j4gigv3GB01uMeAW+8aeCcs73VDNT3xMu6+rtPnYiVCIhMp6TV/AhM9KrpS
 WDyEshtwN0aLKPZaLKODTLds7F+lfSvyL8bMC9Tm3LuVnnduBkMiBdyMdH6Nf0Ygyy
 /NBeq3GT2Mt9KEgUNdOz7FA1JH+VHdnQRs4SiGLI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 628D78B84C;
 Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gdMggsL6Kg-L; Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 216538B81D;
 Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EC1116B730; Thu, 22 Aug 2019 16:34:05 +0000 (UTC)
Message-Id: <bc804701eff26b5be9a9993dbb27dc36dd8ea334.1566491310.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566491310.git.christophe.leroy@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 5/8] powerpc/vdso32: Don't read cache line size from the
 datapage on PPC32.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 16:34:05 +0000 (UTC)
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

On PPC32, the cache lines have a fixed size known at build time.

Don't read it from the datapage.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso_datapage.h |  4 ----
 arch/powerpc/kernel/asm-offsets.c        |  2 +-
 arch/powerpc/kernel/vdso.c               |  5 -----
 arch/powerpc/kernel/vdso32/cacheflush.S  | 23 +++++++++++++++++++++++
 4 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 2ccb938d8544..869df2f43400 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -106,10 +106,6 @@ struct vdso_data {
 	__u32 stamp_sec_fraction;	/* fractional seconds of stamp_xtime */
 	__u32 hrtimer_res;		/* hrtimer resolution */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
-	__u32 dcache_block_size;	/* L1 d-cache block size     */
-	__u32 icache_block_size;	/* L1 i-cache block size     */
-	__u32 dcache_log_block_size;	/* L1 d-cache log block size */
-	__u32 icache_log_block_size;	/* L1 i-cache log block size */
 };
 
 #endif /* CONFIG_PPC64 */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 6279053967fd..b6328a90cad7 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -388,11 +388,11 @@ int main(void)
 	OFFSET(STAMP_XTIME, vdso_data, stamp_xtime);
 	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
 	OFFSET(CLOCK_HRTIMER_RES, vdso_data, hrtimer_res);
+#ifdef CONFIG_PPC64
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
 	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
 	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_data, icache_log_block_size);
 	OFFSET(CFG_DCACHE_LOGBLOCKSZ, vdso_data, dcache_log_block_size);
-#ifdef CONFIG_PPC64
 	OFFSET(CFG_SYSCALL_MAP64, vdso_data, syscall_map_64);
 	OFFSET(TVAL64_TV_SEC, timeval, tv_sec);
 	OFFSET(TVAL64_TV_USEC, timeval, tv_usec);
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index d60598113a9f..87d43e43e2e7 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -750,11 +750,6 @@ static int __init vdso_init(void)
 	 */
 	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
 	DBG("vdso64_kbase: %p, 0x%x pages\n", vdso64_kbase, vdso64_pages);
-#else
-	vdso_data->dcache_block_size = L1_CACHE_BYTES;
-	vdso_data->dcache_log_block_size = L1_CACHE_SHIFT;
-	vdso_data->icache_block_size = L1_CACHE_BYTES;
-	vdso_data->icache_log_block_size = L1_CACHE_SHIFT;
 #endif /* CONFIG_PPC64 */
 
 
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/vdso32/cacheflush.S
index e9453837e4ee..b9340a89984e 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
@@ -9,6 +9,7 @@
 #include <asm/ppc_asm.h>
 #include <asm/vdso.h>
 #include <asm/asm-offsets.h>
+#include <asm/cache.h>
 
 #include "datapage.h"
 
@@ -24,28 +25,44 @@
  */
 V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
+#ifdef CONFIG_PPC64
 	mflr	r12
   .cfi_register lr,r12
 	get_datapage	r10, r0
 	mtlr	r12
+#endif
 
+#ifdef CONFIG_PPC64
 	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
+#else
+	li	r5, L1_CACHE_BYTES - 1
+#endif
 	andc	r6,r3,r5		/* round low to line bdy */
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5		/* ensure we get enough */
+#ifdef CONFIG_PPC64
 	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
 	srw.	r8,r8,r9		/* compute line count */
+#else
+	srwi.	r8, r8, L1_CACHE_SHIFT
+	mr	r7, r6
+#endif
 	crclr	cr0*4+so
 	beqlr				/* nothing to do? */
 	mtctr	r8
 1:	dcbst	0,r6
+#ifdef CONFIG_PPC64
 	add	r6,r6,r7
+#else
+	addi	r6, r6, L1_CACHE_BYTES
+#endif
 	bdnz	1b
 	sync
 
 /* Now invalidate the instruction cache */
 
+#ifdef CONFIG_PPC64
 	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
 	andc	r6,r3,r5		/* round low to line bdy */
@@ -55,9 +72,15 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 	srw.	r8,r8,r9		/* compute line count */
 	crclr	cr0*4+so
 	beqlr				/* nothing to do? */
+#endif
 	mtctr	r8
+#ifdef CONFIG_PPC64
 2:	icbi	0,r6
 	add	r6,r6,r7
+#else
+2:	icbi	0, r7
+	addi	r7, r7, L1_CACHE_BYTES
+#endif
 	bdnz	2b
 	isync
 	li	r3,0
-- 
2.13.3

