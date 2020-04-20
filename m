Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 160311B1267
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:00:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Xxh6M2tzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:00:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=StRkYVD8; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495XsZ5b25zDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 02:56:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495XsM433gz9txcv;
 Mon, 20 Apr 2020 18:56:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=StRkYVD8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aE0yrCkxqewy; Mon, 20 Apr 2020 18:56:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495XsM2thnz9txc3;
 Mon, 20 Apr 2020 18:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587401783; bh=sfGFxmiLk0piqyU/qQus80qwW8Tg3vU9asN8yDMG0JY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=StRkYVD8sSsJLKy5fFhhMd+4tgPYR1gxiq/EA24gDqmJx+yQYnmFTevQ5mXW2BgtN
 lADXOrleWiTzb8FdrULFVejL+y+ChPhwh4JVkgRk0OwrPeG4Rv85oBqRz2Q02uEO1h
 e59XG8pH+nayk4XJAt+ur9uWsBFV7D23+tLaRbbs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 328CF8B78D;
 Mon, 20 Apr 2020 18:56:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id onok15RgI6yq; Mon, 20 Apr 2020 18:56:29 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9AF78B784;
 Mon, 20 Apr 2020 18:56:28 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AF6E2657AE; Mon, 20 Apr 2020 16:56:28 +0000 (UTC)
Message-Id: <87b213094a2f34b35e7f2e61301c2409d3db4275.1587401492.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1587401492.git.christophe.leroy@c-s.fr>
References: <cover.1587401492.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v7 1/7] powerpc/vdso64: Switch from __get_datapage() to
 get_datapage inline macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com
Date: Mon, 20 Apr 2020 16:56:28 +0000 (UTC)
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On the same way as already done on PPC32, drop __get_datapage()
function and use get_datapage inline macro instead.

See commit ec0895f08f99 ("powerpc/vdso32: inline __get_datapage()")

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/vdso64/cacheflush.S   |  9 ++++----
 arch/powerpc/kernel/vdso64/datapage.S     | 28 +++--------------------
 arch/powerpc/kernel/vdso64/gettimeofday.S |  8 +++----
 3 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/vdso64/cacheflush.S
index 526f5ba2593e..cab14324242b 100644
--- a/arch/powerpc/kernel/vdso64/cacheflush.S
+++ b/arch/powerpc/kernel/vdso64/cacheflush.S
@@ -8,6 +8,7 @@
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
 #include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 
 	.text
@@ -24,14 +25,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	mr	r11,r3
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r10, r0
 	mtlr	r12
-	mr	r10,r3
 
 	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
-	andc	r6,r11,r5		/* round low to line bdy */
+	andc	r6,r3,r5		/* round low to line bdy */
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5		/* ensure we get enough */
 	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
@@ -48,7 +47,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 
 	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
-	andc	r6,r11,r5		/* round low to line bdy */
+	andc	r6,r3,r5		/* round low to line bdy */
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5
 	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
index dc84f5ae3802..067247d3efb9 100644
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ b/arch/powerpc/kernel/vdso64/datapage.S
@@ -10,35 +10,13 @@
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 #include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
 
 	.text
 .global	__kernel_datapage_offset;
 __kernel_datapage_offset:
 	.long	0
 
-V_FUNCTION_BEGIN(__get_datapage)
-  .cfi_startproc
-	/* We don't want that exposed or overridable as we want other objects
-	 * to be able to bl directly to here
-	 */
-	.protected __get_datapage
-	.hidden __get_datapage
-
-	mflr	r0
-  .cfi_register lr,r0
-
-	bcl	20,31,data_page_branch
-data_page_branch:
-	mflr	r3
-	mtlr	r0
-	addi	r3, r3, __kernel_datapage_offset-data_page_branch
-	lwz	r0,0(r3)
-  .cfi_restore lr
-	add	r3,r0,r3
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__get_datapage)
-
 /*
  * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
  *
@@ -53,7 +31,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mflr	r12
   .cfi_register lr,r12
 	mr	r4,r3
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP64
 	cmpldi	cr0,r4,0
@@ -75,7 +53,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
 	crclr	cr0*4+so
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 1c9a04703250..e54c4ce4d356 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -26,7 +26,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 
 	mr	r11,r3			/* r11 holds tv */
 	mr	r10,r4			/* r10 holds tz */
-	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
+	get_datapage	r3, r0
 	cmpldi	r11,0			/* check if tv is NULL */
 	beq	2f
 	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
@@ -71,7 +71,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
 	mr	r11,r4			/* r11 saves tp */
-	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
+	get_datapage	r3, r0
 	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
 	ori	r7,r7,NSEC_PER_SEC@l
 	beq	cr5,70f
@@ -188,7 +188,7 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 
 	mflr	r12
   .cfi_register lr,r12
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 	lwz	r5, CLOCK_HRTIMER_RES(r3)
 	mtlr	r12
 	li	r3,0
@@ -221,7 +221,7 @@ V_FUNCTION_BEGIN(__kernel_time)
   .cfi_register lr,r12
 
 	mr	r11,r3			/* r11 holds t */
-	bl	V_LOCAL_FUNC(__get_datapage)
+	get_datapage	r3, r0
 
 	ld	r4,STAMP_XTIME_SEC(r3)
 
-- 
2.25.0

