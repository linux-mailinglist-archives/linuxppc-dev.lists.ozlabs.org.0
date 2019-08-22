Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBB99998
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:53:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrG32X4FzDr4L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SubWR7TI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DqqS5ShFzDrTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:34:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DqqM6Lmxz9v0dC;
 Thu, 22 Aug 2019 18:34:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SubWR7TI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dEgUR9WrCzhv; Thu, 22 Aug 2019 18:34:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DqqM5JbVz9v0d3;
 Thu, 22 Aug 2019 18:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566491647; bh=gGn5zKI12MfYcvKD0vSwYEdB1ZM6vfMWNiGVdpDB/J8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=SubWR7TIqg/PzZuoIcAHNxsxbfyY7qX3fbg2Ldg40vBeC6GUS0N6BdYLy2w6m7Qmi
 uQEnN+GtMM+PZwh3K8KpDLxYXk8QLMgaXnBu3ohz8i/PwCp0oqp5KbVE6QPrbaPw6/
 HwcEwZwwmoRQbHpE9mqxFG5+o7Zauncw5mUpFAig=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 719E58B84C;
 Thu, 22 Aug 2019 18:34:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ga2Ka04W_XTm; Thu, 22 Aug 2019 18:34:09 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C6A48B81D;
 Thu, 22 Aug 2019 18:34:09 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0D8AC6B730; Thu, 22 Aug 2019 16:34:09 +0000 (UTC)
Message-Id: <bef2a06c39c313a2c8b2ac76e802954228ddddfb.1566491310.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566491310.git.christophe.leroy@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 8/8] powerpc/vdso32: miscellaneous optimisations
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 16:34:09 +0000 (UTC)
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

Various optimisations by inverting branches and removing
redundant instructions.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/vdso32/datapage.S     |  3 +--
 arch/powerpc/kernel/vdso32/getcpu.S       |  6 +++---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 18 +++++++++---------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index d480d2d4a3fe..436b88c455d1 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -31,11 +31,10 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	mr	r4,r3
+	mr.	r4,r3
 	get_datapage	r3, r0
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP32
-	cmpli	cr0,r4,0
 	beqlr
 	li	r0,NR_syscalls
 	stw	r0,0(r4)
diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso32/getcpu.S
index bde226ad904d..ac1faa8a2bfd 100644
--- a/arch/powerpc/kernel/vdso32/getcpu.S
+++ b/arch/powerpc/kernel/vdso32/getcpu.S
@@ -31,10 +31,10 @@ V_FUNCTION_BEGIN(__kernel_getcpu)
 	rlwinm  r7,r5,16,31-15,31-0
 	beq	cr0,1f
 	stw	r6,0(r3)
-1:	beq	cr1,2f
-	stw	r7,0(r4)
-2:	crclr	cr0*4+so
+1:	crclr	cr0*4+so
 	li	r3,0			/* always success */
+	beqlr	cr1
+	stw	r7,0(r4)
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_getcpu)
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index c65f41c612f7..47aa44ab8bbb 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -35,10 +35,9 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 	mflr	r12
   .cfi_register lr,r12
 
-	mr	r10,r3			/* r10 saves tv */
+	mr.	r10,r3			/* r10 saves tv */
 	mr	r11,r4			/* r11 saves tz */
 	get_datapage	r9, r0
-	cmplwi	r10,0			/* check if tv is NULL */
 	beq	3f
 	LOAD_REG_IMMEDIATE(r7, 1000000)	/* load up USEC_PER_SEC */
 	bl	__do_get_tspec@local	/* get sec/usec from tb & kernel */
@@ -46,15 +45,16 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 	stw	r4,TVAL32_TV_USEC(r10)
 
 3:	cmplwi	r11,0			/* check if tz is NULL */
-	beq	1f
+	mtlr	r12
+	crclr	cr0*4+so
+	li	r3,0
+	beqlr
+
 	lwz	r4,CFG_TZ_MINUTEWEST(r9)/* fill tz */
 	lwz	r5,CFG_TZ_DSTTIME(r9)
 	stw	r4,TZONE_TZ_MINWEST(r11)
 	stw	r5,TZONE_TZ_DSTTIME(r11)
 
-1:	mtlr	r12
-	crclr	cr0*4+so
-	li	r3,0
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_gettimeofday)
@@ -248,10 +248,10 @@ V_FUNCTION_BEGIN(__kernel_time)
 	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
 
 	cmplwi	r11,0			/* check if t is NULL */
-	beq	2f
-	stw	r3,0(r11)		/* store result at *t */
-2:	mtlr	r12
+	mtlr	r12
 	crclr	cr0*4+so
+	beqlr
+	stw	r3,0(r11)		/* store result at *t */
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_time)
-- 
2.13.3

