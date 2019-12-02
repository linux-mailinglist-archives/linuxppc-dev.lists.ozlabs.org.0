Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2310E6CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:17:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHyq2n14zDqJc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XZVl7Io7"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHXN6MVWzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 18:57:40 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHX74r7jz9txsq;
 Mon,  2 Dec 2019 08:57:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XZVl7Io7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jjgBe-GCs8b6; Mon,  2 Dec 2019 08:57:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHX73q13z9txsp;
 Mon,  2 Dec 2019 08:57:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575273447; bh=2DISVNeXcgsWhL21VEb4CkXGT+x8cPvV0oATp0J5wZE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XZVl7Io7oAgGm8OQqG/bPAFR9WT1FnHCCUg7CTOzpFmSHP4hbLJ1Q6cPVcTM8kjsU
 1+SSACmXM3Zb5XQLlvY/VC5H1VuLsl+YcNoyCiiVirCuxvckDY9Yk4/a32J3eYK9/6
 G/96bPoVjexNrkYZ6gxqDXb3lpsKqOb/zzOTzCxI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28BC38B79B;
 Mon,  2 Dec 2019 08:57:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TRgs7LG8Wt7N; Mon,  2 Dec 2019 08:57:32 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFFA28B79A;
 Mon,  2 Dec 2019 08:57:31 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EA40B63600; Mon,  2 Dec 2019 07:57:31 +0000 (UTC)
Message-Id: <dfa7b35e27e01964fcda84bf1ed8b2b31cf93826.1575273217.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1575273217.git.christophe.leroy@c-s.fr>
References: <cover.1575273217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 5/8] powerpc/vdso32: Don't read cache line size from the
 datapage on PPC32.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  2 Dec 2019 07:57:31 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
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
index ee5319a6f4e3..b9ef6cf50ea5 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -108,10 +108,6 @@ struct vdso_data {
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
index 3d47aec7becf..0013197d89a6 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -389,11 +389,11 @@ int main(void)
 	OFFSET(STAMP_XTIME_NSEC, vdso_data, stamp_xtime_nsec);
 	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
 	OFFSET(CLOCK_HRTIMER_RES, vdso_data, hrtimer_res);
+#ifdef CONFIG_PPC64
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
 	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
 	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_data, icache_log_block_size);
 	OFFSET(CFG_DCACHE_LOGBLOCKSZ, vdso_data, dcache_log_block_size);
-#ifdef CONFIG_PPC64
 	OFFSET(CFG_SYSCALL_MAP64, vdso_data, syscall_map_64);
 	OFFSET(TVAL64_TV_SEC, __kernel_old_timeval, tv_sec);
 	OFFSET(TVAL64_TV_USEC, __kernel_old_timeval, tv_usec);
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index eae9ddaecbcf..b9a108411c0d 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -728,11 +728,6 @@ static int __init vdso_init(void)
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
index d178ec8c279d..3440ddf21c8b 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
@@ -10,6 +10,7 @@
 #include <asm/vdso.h>
 #include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
+#include <asm/cache.h>
 
 	.text
 
@@ -23,28 +24,44 @@
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
@@ -54,9 +71,15 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
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

