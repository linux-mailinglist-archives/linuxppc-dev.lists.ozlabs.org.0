Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F38D01A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:53:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467lK56w8hzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Hi7fJNvM"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467lH73B6bzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:52:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467lH26fxCz9tyn5;
 Wed, 14 Aug 2019 11:51:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Hi7fJNvM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gbc1dtRvE0Zv; Wed, 14 Aug 2019 11:51:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467lH25WtWz9tyn3;
 Wed, 14 Aug 2019 11:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565776318; bh=aiDVM1gpTs0t8Rh2Dzwq7qzoObtOaz4J0RXI1KzQaco=;
 h=From:Subject:To:Cc:Date:From;
 b=Hi7fJNvMPr4r6t/C9eAxTFFr+yuFxXgfQkwqRhNQaCQvisy9r3xXZ4G4tWvjuKodR
 YcSFbdPdYtKWaYNnhB8/+uaiD99fhIOw6fS1Tsi16B7hL4tupqjOo2fmjp1Gm2T0U5
 Fd+l68WQzXF4OA0dX3YyWtmbJ+x4O76UySF+ry+0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CB638B7F2;
 Wed, 14 Aug 2019 11:51:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Su5vGXgGoMrG; Wed, 14 Aug 2019 11:51:59 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 07B1E8B761;
 Wed, 14 Aug 2019 11:51:58 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 921576B6B8; Wed, 14 Aug 2019 09:51:58 +0000 (UTC)
Message-Id: <b0bf1ef9840c13dad22c72ae0b7b2d56adf9a98f.1565776115.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/2] powerpc: rewrite LOAD_REG_IMMEDIATE() as an
 intelligent macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Wed, 14 Aug 2019 09:51:58 +0000 (UTC)
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

Today LOAD_REG_IMMEDIATE() is a basic #define which loads all
parts on a value into a register, including the parts that are NUL.

This means always 2 instructions on PPC32 and always 5 instructions
on PPC64. And those instructions cannot run in parallele as they are
updating the same register.

Ex: LOAD_REG_IMMEDIATE(r1,THREAD_SIZE) in head_64.S results in:

3c 20 00 00     lis     r1,0
60 21 00 00     ori     r1,r1,0
78 21 07 c6     rldicr  r1,r1,32,31
64 21 00 00     oris    r1,r1,0
60 21 40 00     ori     r1,r1,16384

Rewrite LOAD_REG_IMMEDIATE() with GAS macro in order to skip
the parts that are NUL.

Rename existing LOAD_REG_IMMEDIATE() as LOAD_REG_IMMEDIATE_SYM()
and use that one for loading value of symbols which are not known
at compile time.

Now LOAD_REG_IMMEDIATE(r1,THREAD_SIZE) in head_64.S results in:

38 20 40 00     li      r1,16384

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 v2: Fixed the test from (\x) & 0xffffffff to (\x) >= 0x80000000 || (\x) < -0x80000000 in __LOAD_REG_IMMEDIATE()

 arch/powerpc/include/asm/ppc_asm.h   | 42 +++++++++++++++++++++++++++++++-----
 arch/powerpc/kernel/exceptions-64e.S | 10 ++++-----
 arch/powerpc/kernel/head_64.S        |  2 +-
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index e0637730a8e7..bc1385b2f0aa 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -311,13 +311,43 @@ GLUE(.,name):
 	addis	reg,reg,(name - 0b)@ha;		\
 	addi	reg,reg,(name - 0b)@l;
 
-#ifdef __powerpc64__
-#ifdef HAVE_AS_ATHIGH
+#if defined(__powerpc64__) && defined(HAVE_AS_ATHIGH)
 #define __AS_ATHIGH high
 #else
 #define __AS_ATHIGH h
 #endif
-#define LOAD_REG_IMMEDIATE(reg,expr)		\
+
+.macro __LOAD_REG_IMMEDIATE_32 r, x
+	.if (\x) >= 0x8000 || (\x) < -0x8000
+		lis \r, (\x)@__AS_ATHIGH
+		.if (\x) & 0xffff != 0
+			ori \r, \r, (\x)@l
+		.endif
+	.else
+		li \r, (\x)@l
+	.endif
+.endm
+
+.macro __LOAD_REG_IMMEDIATE r, x
+	.if (\x) >= 0x80000000 || (\x) < -0x80000000
+		__LOAD_REG_IMMEDIATE_32 \r, (\x) >> 32
+		rldicr	\r, \r, 32, 31
+		.if (\x) & 0xffff0000 != 0
+			oris \r, \r, (\x)@__AS_ATHIGH
+		.endif
+		.if (\x) & 0xffff != 0
+			oris \r, \r, (\x)@l
+		.endif
+	.else
+		__LOAD_REG_IMMEDIATE_32 \r, \x
+	.endif
+.endm
+
+#ifdef __powerpc64__
+
+#define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE reg, expr
+
+#define LOAD_REG_IMMEDIATE_SYM(reg,expr)	\
 	lis     reg,(expr)@highest;		\
 	ori     reg,reg,(expr)@higher;	\
 	rldicr  reg,reg,32,31;		\
@@ -335,11 +365,13 @@ GLUE(.,name):
 
 #else /* 32-bit */
 
-#define LOAD_REG_IMMEDIATE(reg,expr)		\
+#define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE_32 reg, expr
+
+#define LOAD_REG_IMMEDIATE_SYM(reg,expr)		\
 	lis	reg,(expr)@ha;		\
 	addi	reg,reg,(expr)@l;
 
-#define LOAD_REG_ADDR(reg,name)		LOAD_REG_IMMEDIATE(reg, name)
+#define LOAD_REG_ADDR(reg,name)		LOAD_REG_IMMEDIATE_SYM(reg, name)
 
 #define LOAD_REG_ADDRBASE(reg, name)	lis	reg,name@ha
 #define ADDROFF(name)			name@l
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 1cfb3da4a84a..898aae6da167 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -751,8 +751,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
 #else
-	LOAD_REG_IMMEDIATE(r14,interrupt_base_book3e)
-	LOAD_REG_IMMEDIATE(r15,__end_interrupts)
+	LOAD_REG_IMMEDIATE_SYM(r14,interrupt_base_book3e)
+	LOAD_REG_IMMEDIATE_SYM(r15,__end_interrupts)
 #endif
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
@@ -821,8 +821,8 @@ kernel_dbg_exc:
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
 #else
-	LOAD_REG_IMMEDIATE(r14,interrupt_base_book3e)
-	LOAD_REG_IMMEDIATE(r15,__end_interrupts)
+	LOAD_REG_IMMEDIATE_SYM(r14,interrupt_base_book3e)
+	LOAD_REG_IMMEDIATE_SYM(r15,__end_interrupts)
 #endif
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
@@ -1449,7 +1449,7 @@ a2_tlbinit_code_start:
 a2_tlbinit_after_linear_map:
 
 	/* Now we branch the new virtual address mapped by this entry */
-	LOAD_REG_IMMEDIATE(r3,1f)
+	LOAD_REG_IMMEDIATE_SYM(r3,1f)
 	mtctr	r3
 	bctr
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 91d297e696dd..1fd44761e997 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -635,7 +635,7 @@ __after_prom_start:
 	sub	r5,r5,r11
 #else
 	/* just copy interrupts */
-	LOAD_REG_IMMEDIATE(r5, FIXED_SYMBOL_ABS_ADDR(__end_interrupts))
+	LOAD_REG_IMMEDIATE_SYM(r5, FIXED_SYMBOL_ABS_ADDR(__end_interrupts))
 #endif
 	b	5f
 3:
-- 
2.13.3

