Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E47E8508
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:05:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472RzR4CCNzF24c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="um8gmOZv"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472RjP383YzF1RV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 20:53:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 472RjK09wqz9tynh;
 Tue, 29 Oct 2019 10:53:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=um8gmOZv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LM_92Agcvcx0; Tue, 29 Oct 2019 10:53:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 472RjJ6Bvpz9tygy;
 Tue, 29 Oct 2019 10:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572342788; bh=N+uhF8c4ECNo6xEQ72XQwCRncDBpG6xv4rvsvbrtlfM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=um8gmOZv5mQkPHoKCAI+xAPEr1IhuEzkGaBYlAIIQq1Y/Xtm4OonORB3BK6YtKDZu
 IFSdy1akc10UjocqfIsVUUoQ4z6CMq0BfYF5V/tupA0Ak8J0rRnPqewlQovIf11tdc
 PdNMVVdQa4THCUcizfQnSbhMMK1xIRSLqErAGPOE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECD1A8B755;
 Tue, 29 Oct 2019 10:53:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xQ2iBKZhFQh4; Tue, 29 Oct 2019 10:53:09 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A00A38B84E;
 Tue, 29 Oct 2019 10:53:09 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 6BE376B6FD; Tue, 29 Oct 2019 09:53:09 +0000 (UTC)
Message-Id: <9c9fe32df8633e6ba8e670274dc3eef82a1b5a65.1572342582.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1572342582.git.christophe.leroy@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 4/8] powerpc/vdso32: inline __get_datapage()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Oct 2019 09:53:09 +0000 (UTC)
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

__get_datapage() is only a few instructions to retrieve the
address of the page where the kernel stores data to the VDSO.

By inlining this function into its users, a bl/blr pair and
a mflr/mtlr pair is avoided, plus a few reg moves.

The improvement is noticeable (about 55 nsec/call on an 8xx)

vdsotest before the patch:
gettimeofday:    vdso: 731 nsec/call
clock-gettime-realtime-coarse:    vdso: 668 nsec/call
clock-gettime-monotonic-coarse:    vdso: 745 nsec/call

vdsotest after the patch:
gettimeofday:    vdso: 677 nsec/call
clock-gettime-realtime-coarse:    vdso: 613 nsec/call
clock-gettime-monotonic-coarse:    vdso: 690 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v3: define get_datapage macro in asm/vdso_datapage.h
---
 arch/powerpc/include/asm/vdso_datapage.h  | 10 ++++++++++
 arch/powerpc/kernel/vdso32/cacheflush.S   |  9 ++++-----
 arch/powerpc/kernel/vdso32/datapage.S     | 28 +++-------------------------
 arch/powerpc/kernel/vdso32/gettimeofday.S | 12 +++++-------
 4 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 2ccb938d8544..da3d2de817f6 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -116,6 +116,16 @@ struct vdso_data {
 
 extern struct vdso_data *vdso_data;
 
+#else /* __ASSEMBLY__ */
+
+.macro get_datapage ptr, tmp
+	bcl	20, 31, .+4
+	mflr	\ptr
+	addi	\ptr, \ptr, __kernel_datapage_offset - (.-4)
+	lwz	\tmp, 0(\ptr)
+	add	\ptr, \tmp, \ptr
+.endm
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/vdso32/cacheflush.S
index 7f882e7b9f43..d178ec8c279d 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
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
-	bl	__get_datapage@local
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
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 6c7401bd284e..1095d818f94a 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
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
-	bl	__get_datapage@local
+	get_datapage	r3, r0
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP32
 	cmpli	cr0,r4,0
@@ -75,7 +53,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	bl	__get_datapage@local
+	get_datapage	r3, r0
 	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
 	lwz	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index 355b537d327a..9867c7b9a25a 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -9,6 +9,7 @@
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
 #include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 
@@ -35,8 +36,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 
 	mr	r10,r3			/* r10 saves tv */
 	mr	r11,r4			/* r11 saves tz */
-	bl	__get_datapage@local	/* get data page */
-	mr	r9, r3			/* datapage ptr in r9 */
+	get_datapage	r9, r0
 	cmplwi	r10,0			/* check if tv is NULL */
 	beq	3f
 	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
@@ -82,8 +82,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
 	mr	r11,r4			/* r11 saves tp */
-	bl	__get_datapage@local	/* get data page */
-	mr	r9,r3			/* datapage ptr in r9 */
+	get_datapage	r9, r0
 	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
 	ori	r7,r7,NSEC_PER_SEC@l
 	beq	cr5, .Lcoarse_clocks
@@ -208,7 +207,7 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 
 	mflr	r12
   .cfi_register lr,r12
-	bl	__get_datapage@local	/* get data page */
+	get_datapage	r3, r0
 	lwz	r5, CLOCK_HRTIMER_RES(r3)
 	mtlr	r12
 	li	r3,0
@@ -242,8 +241,7 @@ V_FUNCTION_BEGIN(__kernel_time)
   .cfi_register lr,r12
 
 	mr	r11,r3			/* r11 holds t */
-	bl	__get_datapage@local
-	mr	r9, r3			/* datapage ptr in r9 */
+	get_datapage	r9, r0
 
 	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
 
-- 
2.13.3

