Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B39AE8532
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:14:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472SBB6lqNzF2PY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="j7y9a+K9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472RjV1br1zF1RV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 20:53:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 472RjP0YmVz9tysn;
 Tue, 29 Oct 2019 10:53:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=j7y9a+K9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JZ3dxNw6HqIR; Tue, 29 Oct 2019 10:53:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 472RjN6bbxz9tysj;
 Tue, 29 Oct 2019 10:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572342792; bh=TCrhP+fHjEwhqhayxChxYVaqoEzg6qg5Ds3vR7E6918=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=j7y9a+K9udCNcXQEy5sKva9CDGUBEV8QZcWF5jpwFjT3vofCJ8ZuGviEiybi6XA+O
 MZ1lgfGglVYjGijuEUpxAb0ycQAVeqJgPmSvLMfVJrClkxC0uKxjWmvWY6MQo7W1LA
 8698yJxbb9fOLPIR+Qadcd25waCg1AQ0+dGuTHPU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3C208B84C;
 Tue, 29 Oct 2019 10:53:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zIiGWarGdYZl; Tue, 29 Oct 2019 10:53:13 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC7FD8B755;
 Tue, 29 Oct 2019 10:53:13 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 88A226B6FD; Tue, 29 Oct 2019 09:53:13 +0000 (UTC)
Message-Id: <7f80e4489a44b53962cf2c813e63038332fcf457.1572342582.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1572342582.git.christophe.leroy@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 8/8] powerpc/vdso32: miscellaneous optimisations
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Oct 2019 09:53:13 +0000 (UTC)
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
index 1095d818f94a..217bb630f8f9 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -30,11 +30,10 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
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
index 90b39af14383..ff5e214fec41 100644
--- a/arch/powerpc/kernel/vdso32/getcpu.S
+++ b/arch/powerpc/kernel/vdso32/getcpu.S
@@ -25,10 +25,10 @@ V_FUNCTION_BEGIN(__kernel_getcpu)
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
index 181e66a15fe2..bad0b39fa2a2 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -34,10 +34,9 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
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
@@ -45,15 +44,16 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
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
@@ -247,10 +247,10 @@ V_FUNCTION_BEGIN(__kernel_time)
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

