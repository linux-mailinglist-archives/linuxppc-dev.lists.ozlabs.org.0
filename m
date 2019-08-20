Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52E963AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 17:04:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYx90ggnzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 01:04:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kGBZWl+J"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CYG30wCnzDr15
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:34:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CYFz3CfDz9vBmf;
 Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kGBZWl+J; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9hx3uDPH-qLC; Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CYFz1xgBz9vBmb;
 Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566311655; bh=xOUVOtxYdJqJ3lo0s/K+hdItwxr4U4urlUl4yvu2T/M=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=kGBZWl+JnleiXlG+LHURLi+OPtWDSRbVUSnzLjKQ1sbaN2GTpvnbF34ln/Ct/WiKe
 GXNstE4yxtQFd01gBhbjf1c9s96TuJYmzycCnsG2hYQ1pfrXS9D59Us5E//ZKZFCvT
 p/IA2oXJuxbZA/jXoqiJXtuRYYn/oQUesSruMMj8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A85DB8B7C9;
 Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4x1NYA1kjwKS; Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C9728B7D3;
 Tue, 20 Aug 2019 16:34:15 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C73756B735; Tue, 20 Aug 2019 14:34:14 +0000 (UTC)
Message-Id: <bad41ed02531bb0382420cbab50a0d7153b71767.1566311636.git.christophe.leroy@c-s.fr>
In-Reply-To: <d60ce8dd3a383c7adbfc322bf1d53d81724a6000.1566311636.git.christophe.leroy@c-s.fr>
References: <d60ce8dd3a383c7adbfc322bf1d53d81724a6000.1566311636.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 3/3] powerpc/64: optimise LOAD_REG_IMMEDIATE_SYM()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Tue, 20 Aug 2019 14:34:14 +0000 (UTC)
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

Optimise LOAD_REG_IMMEDIATE_SYM() using a temporary register to
parallelise operations.

It reduces the path from 5 to 3 instructions.

Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v3: new
v4: fixed the registers of lis/ori to match rldimi args (tmp is upper part, reg is lower part)
---
 arch/powerpc/include/asm/ppc_asm.h   | 12 ++++++------
 arch/powerpc/kernel/exceptions-64e.S | 22 +++++++++++++---------
 arch/powerpc/kernel/head_64.S        |  2 +-
 3 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 20a00209c965..dd3b191bdcea 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -347,12 +347,12 @@ GLUE(.,name):
 
 #define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE reg, expr
 
-#define LOAD_REG_IMMEDIATE_SYM(reg,expr)	\
-	lis     reg,(expr)@highest;		\
-	ori     reg,reg,(expr)@higher;	\
-	rldicr  reg,reg,32,31;		\
-	oris    reg,reg,(expr)@__AS_ATHIGH;	\
-	ori     reg,reg,(expr)@l;
+#define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
+	lis	tmp, (expr)@highest;		\
+	lis	reg, (expr)@__AS_ATHIGH;	\
+	ori	tmp, tmp, (expr)@higher;	\
+	ori	reg, reg, (expr)@l;		\
+	rldimi	reg, tmp, 32, 0
 
 #define LOAD_REG_ADDR(reg,name)			\
 	ld	reg,name@got(r2)
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 898aae6da167..829950b96d29 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -750,12 +750,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	ld	r15,PACATOC(r13)
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
-#else
-	LOAD_REG_IMMEDIATE_SYM(r14,interrupt_base_book3e)
-	LOAD_REG_IMMEDIATE_SYM(r15,__end_interrupts)
-#endif
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
+#else
+	LOAD_REG_IMMEDIATE_SYM(r14, r15, interrupt_base_book3e)
+	cmpld	cr0, r10, r14
+	LOAD_REG_IMMEDIATE_SYM(r14, r15, __end_interrupts)
+	cmpld	cr1, r10, r14
+#endif
 	blt+	cr0,1f
 	bge+	cr1,1f
 
@@ -820,12 +822,14 @@ kernel_dbg_exc:
 	ld	r15,PACATOC(r13)
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
-#else
-	LOAD_REG_IMMEDIATE_SYM(r14,interrupt_base_book3e)
-	LOAD_REG_IMMEDIATE_SYM(r15,__end_interrupts)
-#endif
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
+#else
+	LOAD_REG_IMMEDIATE_SYM(r14, r15, interrupt_base_book3e)
+	cmpld	cr0, r10, r14
+	LOAD_REG_IMMEDIATE_SYM(r14, r15,__end_interrupts)
+	cmpld	cr1, r10, r14
+#endif
 	blt+	cr0,1f
 	bge+	cr1,1f
 
@@ -1449,7 +1453,7 @@ a2_tlbinit_code_start:
 a2_tlbinit_after_linear_map:
 
 	/* Now we branch the new virtual address mapped by this entry */
-	LOAD_REG_IMMEDIATE_SYM(r3,1f)
+	LOAD_REG_IMMEDIATE_SYM(r3, r5, 1f)
 	mtctr	r3
 	bctr
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 1fd44761e997..0f2d61af47cc 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -635,7 +635,7 @@ __after_prom_start:
 	sub	r5,r5,r11
 #else
 	/* just copy interrupts */
-	LOAD_REG_IMMEDIATE_SYM(r5, FIXED_SYMBOL_ABS_ADDR(__end_interrupts))
+	LOAD_REG_IMMEDIATE_SYM(r5, r11, FIXED_SYMBOL_ABS_ADDR(__end_interrupts))
 #endif
 	b	5f
 3:
-- 
2.13.3

