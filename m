Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5CE8500
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:03:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472RxB1q2RzF219
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:03:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="UHuCmRqE"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472RjM4WClzF1RV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 20:53:11 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 472RjH01pKz9tyhr;
 Tue, 29 Oct 2019 10:53:07 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UHuCmRqE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KPQphUf7OKjx; Tue, 29 Oct 2019 10:53:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 472RjG5sQkz9tygy;
 Tue, 29 Oct 2019 10:53:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572342786; bh=UIHQXP6V1jWugQMbEinSuLqC2er8Mq/UwaqIPYmrK0I=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=UHuCmRqEsK/Fpq2Ecimvp1z0Kg8MJAeoBkH0iQJHFyw6HY6ZsAbV7ZMj+nN0pSWzX
 r6jH9EJsvX3Num7zPxCKnETT6FrzT0EYs0C9/bu39qLcpwNw2wtoXofIjnv0bHlLZX
 cKr6uLMdj99gp6uRuJbzw+Ho4TTlxQGbK893zDF8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D85658B84E;
 Tue, 29 Oct 2019 10:53:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AfAwE8OqeEvD; Tue, 29 Oct 2019 10:53:07 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 950FD8B84C;
 Tue, 29 Oct 2019 10:53:07 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 5FC326B6FD; Tue, 29 Oct 2019 09:53:07 +0000 (UTC)
Message-Id: <4644ccc9b4da78639ae9424db878c48711abf05a.1572342582.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1572342582.git.christophe.leroy@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/8] powerpc/vdso32: Add support for
 CLOCK_{REALTIME/MONOTONIC}_COARSE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Oct 2019 09:53:07 +0000 (UTC)
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

This is copied and adapted from commit 5c929885f1bb ("powerpc/vdso64:
Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
from Santosh Sivaraj <santosh@fossix.org>

Benchmark from vdsotest-all:
clock-gettime-realtime: syscall: 3601 nsec/call
clock-gettime-realtime:    libc: 1072 nsec/call
clock-gettime-realtime:    vdso: 931 nsec/call
clock-gettime-monotonic: syscall: 4034 nsec/call
clock-gettime-monotonic:    libc: 1213 nsec/call
clock-gettime-monotonic:    vdso: 1076 nsec/call
clock-gettime-realtime-coarse: syscall: 2722 nsec/call
clock-gettime-realtime-coarse:    libc: 805 nsec/call
clock-gettime-realtime-coarse:    vdso: 668 nsec/call
clock-gettime-monotonic-coarse: syscall: 2949 nsec/call
clock-gettime-monotonic-coarse:    libc: 882 nsec/call
clock-gettime-monotonic-coarse:    vdso: 745 nsec/call

Additional test passed with:
	vdsotest -d 30 clock-gettime-monotonic-coarse verify

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Cc: Santosh Sivaraj <santosh@fossix.org>
Link: https://github.com/linuxppc/issues/issues/41
---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 64 +++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index becd9f8767ed..decd263c16e0 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -71,7 +71,13 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	cmpli	cr0,r3,CLOCK_REALTIME
 	cmpli	cr1,r3,CLOCK_MONOTONIC
 	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
-	bne	cr0,99f
+
+	cmpli	cr5,r3,CLOCK_REALTIME_COARSE
+	cmpli	cr6,r3,CLOCK_MONOTONIC_COARSE
+	cror	cr5*4+eq,cr5*4+eq,cr6*4+eq
+
+	cror	cr0*4+eq,cr0*4+eq,cr5*4+eq
+	bne	cr0, .Lgettime_fallback
 
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
@@ -80,8 +86,10 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mr	r9,r3			/* datapage ptr in r9 */
 	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
 	ori	r7,r7,NSEC_PER_SEC@l
-50:	bl	__do_get_tspec@local	/* get sec/nsec from tb & kernel */
-	bne	cr1,80f			/* not monotonic -> all done */
+	beq	cr5, .Lcoarse_clocks
+.Lprecise_clocks:
+	bl	__do_get_tspec@local	/* get sec/nsec from tb & kernel */
+	bne	cr1, .Lfinish		/* not monotonic -> all done */
 
 	/*
 	 * CLOCK_MONOTONIC
@@ -105,12 +113,53 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	add	r9,r9,r0
 	lwz	r0,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
         cmpl    cr0,r8,r0		/* check if updated */
-	bne-	50b
+	bne-	.Lprecise_clocks
+	b	.Lfinish_monotonic
+
+	/*
+	 * For coarse clocks we get data directly from the vdso data page, so
+	 * we don't need to call __do_get_tspec, but we still need to do the
+	 * counter trick.
+	 */
+.Lcoarse_clocks:
+	lwz	r8,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
+	andi.	r0,r8,1                 /* pending update ? loop */
+	bne-	.Lcoarse_clocks
+	add	r9,r9,r0		/* r0 is already 0 */
+
+	/*
+	 * CLOCK_REALTIME_COARSE, below values are needed for MONOTONIC_COARSE
+	 * too
+	 */
+	lwz	r3,STAMP_XTIME+TSPC32_TV_SEC(r9)
+	lwz	r4,STAMP_XTIME+TSPC32_TV_NSEC(r9)
+	bne	cr6,1f
+
+	/* CLOCK_MONOTONIC_COARSE */
+	lwz	r5,(WTOM_CLOCK_SEC+LOPART)(r9)
+	lwz	r6,WTOM_CLOCK_NSEC(r9)
+
+	/* check if counter has updated */
+	or	r0,r6,r5
+1:	or	r0,r0,r3
+	or	r0,r0,r4
+	xor	r0,r0,r0
+	add	r3,r3,r0
+	lwz	r0,CFG_TB_UPDATE_COUNT+LOPART(r9)
+	cmpl	cr0,r0,r8               /* check if updated */
+	bne-	.Lcoarse_clocks
+
+	/* Counter has not updated, so continue calculating proper values for
+	 * sec and nsec if monotonic coarse, or just return with the proper
+	 * values for realtime.
+	 */
+	bne	cr6, .Lfinish
 
 	/* Calculate and store result. Note that this mimics the C code,
 	 * which may cause funny results if nsec goes negative... is that
 	 * possible at all ?
 	 */
+.Lfinish_monotonic:
 	add	r3,r3,r5
 	add	r4,r4,r6
 	cmpw	cr0,r4,r7
@@ -118,11 +167,12 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	blt	1f
 	subf	r4,r7,r4
 	addi	r3,r3,1
-1:	bge	cr1,80f
+1:	bge	cr1, .Lfinish
 	addi	r3,r3,-1
 	add	r4,r4,r7
 
-80:	stw	r3,TSPC32_TV_SEC(r11)
+.Lfinish:
+	stw	r3,TSPC32_TV_SEC(r11)
 	stw	r4,TSPC32_TV_NSEC(r11)
 
 	mtlr	r12
@@ -133,7 +183,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	/*
 	 * syscall fallback
 	 */
-99:
+.Lgettime_fallback:
 	li	r0,__NR_clock_gettime
   .cfi_restore lr
 	sc
-- 
2.13.3

