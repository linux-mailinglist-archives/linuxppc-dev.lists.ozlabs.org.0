Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC31C5AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:09:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Bh11sZWzDqKy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KgNoGhS5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453Bbh6LgqzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 19:05:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453Bbc3fJZz9v0Yf;
 Tue, 14 May 2019 11:05:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KgNoGhS5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ql2CZfdz1N6K; Tue, 14 May 2019 11:05:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453Bbc2crbz9v0Yb;
 Tue, 14 May 2019 11:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557824716; bh=6rd5Gd+7Ji3pxkGeUUt0ZGqg9Wz3VtWy++0D79Z+AWI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=KgNoGhS5hawXMa/kL7fPnh82oQsJm2Cyq3NBuWJYV3VyWCTextzhEG1O6kow/bTDd
 3iKFgzP866mIxjxgoZvXfY5c30VxhNRuopqjfsiJlbtd6tJ/1lTr34UTyHV5fb4OjN
 GaBKIjrkftae7CFXnFvJGomNpifLap5hLKUdw1Xo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 701B98B8BF;
 Tue, 14 May 2019 11:05:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NtDUpuKhwm6N; Tue, 14 May 2019 11:05:17 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 209D18B7C1;
 Tue, 14 May 2019 11:05:17 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DA77F6742D; Tue, 14 May 2019 09:05:16 +0000 (UTC)
Message-Id: <d6f628ffdeb9c7863da722a8f6ef2949e57bb360.1557824379.git.christophe.leroy@c-s.fr>
In-Reply-To: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/4] powerpc/64: reuse PPC32 static inline flush_dcache_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue, 14 May 2019 09:05:16 +0000 (UTC)
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

This patch drops the assembly PPC64 version of flush_dcache_range()
and re-uses the PPC32 static inline version.

With GCC 8.1, the following code is generated:

void flush_test(unsigned long start, unsigned long stop)
{
	flush_dcache_range(start, stop);
}

0000000000000130 <.flush_test>:
 130:	3d 22 00 00 	addis   r9,r2,0
			132: R_PPC64_TOC16_HA	.data+0x8
 134:	81 09 00 00 	lwz     r8,0(r9)
			136: R_PPC64_TOC16_LO	.data+0x8
 138:	3d 22 00 00 	addis   r9,r2,0
			13a: R_PPC64_TOC16_HA	.data+0xc
 13c:	80 e9 00 00 	lwz     r7,0(r9)
			13e: R_PPC64_TOC16_LO	.data+0xc
 140:	7d 48 00 d0 	neg     r10,r8
 144:	7d 43 18 38 	and     r3,r10,r3
 148:	7c 00 04 ac 	hwsync
 14c:	4c 00 01 2c 	isync
 150:	39 28 ff ff 	addi    r9,r8,-1
 154:	7c 89 22 14 	add     r4,r9,r4
 158:	7c 83 20 50 	subf    r4,r3,r4
 15c:	7c 89 3c 37 	srd.    r9,r4,r7
 160:	41 82 00 1c 	beq     17c <.flush_test+0x4c>
 164:	7d 29 03 a6 	mtctr   r9
 168:	60 00 00 00 	nop
 16c:	60 00 00 00 	nop
 170:	7c 00 18 ac 	dcbf    0,r3
 174:	7c 63 42 14 	add     r3,r3,r8
 178:	42 00 ff f8 	bdnz    170 <.flush_test+0x40>
 17c:	7c 00 04 ac 	hwsync
 180:	4c 00 01 2c 	isync
 184:	4e 80 00 20 	blr
 188:	60 00 00 00 	nop
 18c:	60 00 00 00 	nop

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cache.h      | 10 ++++++++++
 arch/powerpc/include/asm/cacheflush.h | 14 ++++++++------
 arch/powerpc/kernel/misc_64.S         | 29 -----------------------------
 3 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 0009a0a82e86..45e3137ccd71 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -54,6 +54,16 @@ struct ppc64_caches {
 };
 
 extern struct ppc64_caches ppc64_caches;
+
+static inline u32 l1_cache_shift(void)
+{
+	return ppc64_caches.l1d.log_block_size;
+}
+
+static inline u32 l1_cache_bytes(void)
+{
+	return ppc64_caches.l1d.block_size;
+}
 #else
 static inline u32 l1_cache_shift(void)
 {
diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index d405f18441cd..3cd7ce3dec8b 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -57,7 +57,6 @@ static inline void __flush_dcache_icache_phys(unsigned long physaddr)
 }
 #endif
 
-#ifdef CONFIG_PPC32
 /*
  * Write any modified data cache blocks out to memory and invalidate them.
  * Does not invalidate the corresponding instruction cache blocks.
@@ -70,9 +69,17 @@ static inline void flush_dcache_range(unsigned long start, unsigned long stop)
 	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
 	unsigned long i;
 
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		mb();	/* sync */
+		isync();
+	}
+
 	for (i = 0; i < size >> shift; i++, addr += bytes)
 		dcbf(addr);
 	mb();	/* sync */
+
+	if (IS_ENABLED(CONFIG_PPC64))
+		isync();
 }
 
 /*
@@ -112,11 +119,6 @@ static inline void invalidate_dcache_range(unsigned long start,
 	mb();	/* sync */
 }
 
-#endif /* CONFIG_PPC32 */
-#ifdef CONFIG_PPC64
-extern void flush_dcache_range(unsigned long start, unsigned long stop);
-#endif
-
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
 	do { \
 		memcpy(dst, src, len); \
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index a4fd536efb44..1b0a42c50ef1 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -115,35 +115,6 @@ _ASM_NOKPROBE_SYMBOL(flush_icache_range)
 EXPORT_SYMBOL(flush_icache_range)
 
 /*
- * Like above, but only do the D-cache.
- *
- * flush_dcache_range(unsigned long start, unsigned long stop)
- *
- *    flush all bytes from start to stop-1 inclusive
- */
-
-_GLOBAL_TOC(flush_dcache_range)
- 	ld	r10,PPC64_CACHES@toc(r2)
-	lwz	r7,DCACHEL1BLOCKSIZE(r10)	/* Get dcache block size */
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5		/* ensure we get enough */
-	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)/* Get log-2 of dcache block size */
-	srw.	r8,r8,r9		/* compute line count */
-	beqlr				/* nothing to do? */
-	sync
-	isync
-	mtctr	r8
-0:	dcbf	0,r6
-	add	r6,r6,r7
-	bdnz	0b
-	sync
-	isync
-	blr
-EXPORT_SYMBOL(flush_dcache_range)
-
-/*
  * Flush a particular page from the data cache to RAM.
  * Note: this is necessary because the instruction cache does *not*
  * snoop from the data cache.
-- 
2.13.3

