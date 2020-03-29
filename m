Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D9196C52
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 11:58:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qrdc0GhhzDq99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 20:58:44 +1100 (AEDT)
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
 header.s=mail header.b=Sf8zrvd4; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qrFQ5YyMzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 20:41:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qrFJ1NPwz9v0Cf;
 Sun, 29 Mar 2020 11:41:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Sf8zrvd4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bwRwM-iJzW9J; Sun, 29 Mar 2020 11:41:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qrFJ0NT4z9v0Bs;
 Sun, 29 Mar 2020 11:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585474868; bh=EAN9wu96hIOOs9Jxj5AMmN+BQRhi9IaXixrZRhz2y4s=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Sf8zrvd4GZj8YvZu6ZqZIJU7UDFOSrHwkP5vxG+IMQoNlAFG1++PYHXlgndT5WFZw
 JVCfTtpNjEq1nPOz5DwEBALdwLo0U8MbQkDVqXGMAF+H+HPueE8TUIwB0f+vvx0ycQ
 nehAbJs5KPdN0qUO8YxtAXCNuoOSVAEvq0bPFM/w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05D818B770;
 Sun, 29 Mar 2020 11:41:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lqb_UcoigZK2; Sun, 29 Mar 2020 11:41:10 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C70828B752;
 Sun, 29 Mar 2020 11:41:10 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 97ED565653; Sun, 29 Mar 2020 09:41:10 +0000 (UTC)
Message-Id: <aea027844b12fcbc29ea78d26c5848a6794d1688.1585474724.git.christophe.leroy@c-s.fr>
In-Reply-To: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 10/12] powerpc/entry32: Blacklist exception entry points for
 kprobe.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Sun, 29 Mar 2020 09:41:10 +0000 (UTC)
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

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 94f78c03cb79..9a1a45d6038a 100644
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
@@ -286,6 +291,8 @@ reenable_mmu:
 	lwz	r2, GPR2(r11)
 	b	fast_exception_return
 #endif
+_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
+_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 
 #ifndef CONFIG_VMAP_STACK
 /*
-- 
2.25.0

