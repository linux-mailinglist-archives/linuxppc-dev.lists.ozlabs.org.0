Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB7199BA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:32:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFHN2KwZzDqwf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:32:48 +1100 (AEDT)
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
 header.s=mail header.b=cSz0OuMk; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDdx0fQ0zDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:03:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sDdr3f43z9twdY;
 Tue, 31 Mar 2020 18:03:44 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cSz0OuMk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IkFnd-s5gizt; Tue, 31 Mar 2020 18:03:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sDdr2ccrz9twdT;
 Tue, 31 Mar 2020 18:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585670624; bh=Rs1DUpF7/W36Dme2CHWMdiXRHyz2j679025fiw7k9yM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cSz0OuMkl2cbegWdSTzrLhODouZC9EIFDoEeOZra5ZBQSbaooveIrxmz4x/xxLmlN
 siHSKF5Ory/qLZ7CXyj60CPgJ3SwhUjy8RKuKYY6Sh2X3zcEB3/wKEluDspgd3k6rM
 O1U45/rt6PoHhobm3m/AadU9o5Xt7Obieesu6SMA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E21978B868;
 Tue, 31 Mar 2020 18:03:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aG0TAoQEIA_2; Tue, 31 Mar 2020 18:03:45 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 919118B752;
 Tue, 31 Mar 2020 18:03:45 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 814BC656AC; Tue, 31 Mar 2020 16:03:45 +0000 (UTC)
Message-Id: <f61ac599855e674ebb592464d0ea32a3ba9c6644.1585670437.git.christophe.leroy@c-s.fr>
In-Reply-To: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 10/12] powerpc/entry32: Blacklist exception entry points
 for kprobe.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 31 Mar 2020 16:03:45 +0000 (UTC)
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

kprobe does not handle events happening in real mode.

As exception entry points are running with MMU disabled,
blacklist them.

The handling of TLF_NAPPING and TLF_SLEEPING is moved before the
CONFIG_TRACE_IRQFLAGS which contains 'reenable_mmu' because from there
kprobe will be possible as the kernel will run with MMU enabled.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
v2: Moved TLF_NAPPING and TLF_SLEEPING handling
---
 arch/powerpc/kernel/entry_32.S | 37 ++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 94f78c03cb79..215aa3a6d4f7 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -51,6 +51,7 @@ mcheck_transfer_to_handler:
 	mfspr	r0,SPRN_DSRR1
 	stw	r0,_DSRR1(r11)
 	/* fall through */
+_ASM_NOKPROBE_SYMBOL(mcheck_transfer_to_handler)
 
 	.globl	debug_transfer_to_handler
 debug_transfer_to_handler:
@@ -59,6 +60,7 @@ debug_transfer_to_handler:
 	mfspr	r0,SPRN_CSRR1
 	stw	r0,_CSRR1(r11)
 	/* fall through */
+_ASM_NOKPROBE_SYMBOL(debug_transfer_to_handler)
 
 	.globl	crit_transfer_to_handler
 crit_transfer_to_handler:
@@ -94,6 +96,7 @@ crit_transfer_to_handler:
 	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
 	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
+_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #endif
 
 #ifdef CONFIG_40x
@@ -115,6 +118,7 @@ crit_transfer_to_handler:
 	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
 	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
+_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #endif
 
 /*
@@ -127,6 +131,7 @@ crit_transfer_to_handler:
 	.globl	transfer_to_handler_full
 transfer_to_handler_full:
 	SAVE_NVGPRS(r11)
+_ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
 	/* fall through */
 
 	.globl	transfer_to_handler
@@ -227,6 +232,23 @@ transfer_to_handler_cont:
 	SYNC
 	RFI				/* jump to handler, enable MMU */
 
+#if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
+4:	rlwinm	r12,r12,0,~_TLF_NAPPING
+	stw	r12,TI_LOCAL_FLAGS(r2)
+	b	power_save_ppc32_restore
+
+7:	rlwinm	r12,r12,0,~_TLF_SLEEPING
+	stw	r12,TI_LOCAL_FLAGS(r2)
+	lwz	r9,_MSR(r11)		/* if sleeping, clear MSR.EE */
+	rlwinm	r9,r9,0,~MSR_EE
+	lwz	r12,_LINK(r11)		/* and return to address in LR */
+	kuap_restore r11, r2, r3, r4, r5
+	lwz	r2, GPR2(r11)
+	b	fast_exception_return
+#endif
+_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
+_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
+
 #ifdef CONFIG_TRACE_IRQFLAGS
 1:	/* MSR is changing, re-enable MMU so we can notify lockdep. We need to
 	 * keep interrupts disabled at this point otherwise we might risk
@@ -272,21 +294,6 @@ reenable_mmu:
 	bctr				/* jump to handler */
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
-#if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
-4:	rlwinm	r12,r12,0,~_TLF_NAPPING
-	stw	r12,TI_LOCAL_FLAGS(r2)
-	b	power_save_ppc32_restore
-
-7:	rlwinm	r12,r12,0,~_TLF_SLEEPING
-	stw	r12,TI_LOCAL_FLAGS(r2)
-	lwz	r9,_MSR(r11)		/* if sleeping, clear MSR.EE */
-	rlwinm	r9,r9,0,~MSR_EE
-	lwz	r12,_LINK(r11)		/* and return to address in LR */
-	kuap_restore r11, r2, r3, r4, r5
-	lwz	r2, GPR2(r11)
-	b	fast_exception_return
-#endif
-
 #ifndef CONFIG_VMAP_STACK
 /*
  * On kernel stack overflow, load up an initial stack pointer
-- 
2.25.0

