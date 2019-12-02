Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA7710E6A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:04:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHhV70dnzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="YYvg6cX3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHXG54RRzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 18:57:32 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHX43YFBz9txsw;
 Mon,  2 Dec 2019 08:57:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YYvg6cX3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id l-jbatJ-bfN7; Mon,  2 Dec 2019 08:57:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHX42VwWz9txsp;
 Mon,  2 Dec 2019 08:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575273444; bh=t2TcjAXQwbJ/ZxftLdVw7Flcwu9C9bWYKYR/K2stZ7w=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=YYvg6cX3v17pKP+gw15aBbixS2FYyKCKlNsICOHoVnZMvEhYQSEH35cc17EWmc5MR
 QMF+ecN1X3n+KyWYh2mFlZ0Nb6JG8u2QyJqgMrMqgIJ3yLRoQFI95kyi76BA0qNk1H
 tFEEB9AXCAjpmCsg1vsRG5UFO4+xJNl4+xIbB3pE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F08DC8B79B;
 Mon,  2 Dec 2019 08:57:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gAsUzDDXcpJY; Mon,  2 Dec 2019 08:57:28 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CAB788B79A;
 Mon,  2 Dec 2019 08:57:28 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C594163600; Mon,  2 Dec 2019 07:57:28 +0000 (UTC)
Message-Id: <d1d24a376e396540194eeb85a2efe481e92ade24.1575273217.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1575273217.git.christophe.leroy@c-s.fr>
References: <cover.1575273217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 2/8] powerpc/vdso32: Add support for
 CLOCK_{REALTIME/MONOTONIC}_COARSE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  2 Dec 2019 07:57:28 +0000 (UTC)
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
v4: Using STAMP_XTIME_SEC and STAMP_XTIMER_NSEC instead of STAMP_XTIME following merge of latest 2038 fixing series.
---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 64 +++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index c8e6902cb01b..7c1be86c1e90 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -69,7 +69,13 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
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
@@ -78,8 +84,10 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
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
@@ -103,12 +111,53 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
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
+	lwz	r3,STAMP_XTIME_SEC+LOPART(r9)
+	lwz	r4,STAMP_XTIME_NSEC+LOPART(r9)
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
@@ -116,11 +165,12 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
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
@@ -131,7 +181,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
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

