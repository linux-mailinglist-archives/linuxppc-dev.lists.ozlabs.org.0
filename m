Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1222C72A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:58:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrPr6440zDqPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqWC61yVzF0ff
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YX7ZOrIk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqWC0q9Vz9sTC; Fri, 24 Jul 2020 23:17:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqWB049Kz9sTR; Fri, 24 Jul 2020 23:17:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596662;
 bh=OHfIfxoamo4EVc/wZe3AT6UNrn7ohW9JeCF/x0D5Xs0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YX7ZOrIkcT6w0WUvT4MgSERz0wElZZG+A6myB0w2f26ouABhY9lpFD8O04ETLR1ob
 uUobLmGz1PWdn6ukzkZVsRrd0fh1kMk/4RZNUCgyMsZ6VbHQoi666cpOHFzySGc8y+
 lUSOvnW/NpzfGcx1LcItC3F5iwOna8CjZGgE5EAjeoJ7SNKOQ6FRW3EoEtdSkwJ3pR
 2pfwGFk50FwxIcjdkt6Xr92gXNQZIRJlrTA3ljATGoatEyrOMq/11cAQzEhTu9WYk4
 j97ZqR95ZwubM9RYHnExGRRxSz2jpFAuIEtGRVjdx8kjg2iWrcxKaA8o+atieCKkFh
 RNqlufjBaR7Gg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 6/9] powerpc/32s: Remove TAUException wart in traps.c
Date: Fri, 24 Jul 2020 23:17:25 +1000
Message-Id: <20200724131728.1643966-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All 32 and 64-bit builds that don't have CONFIG_TAU_INT enabled (all
of them), get a definition of TAUException() in traps.c.

On 64-bit it's completely useless, and just wastes ~120 bytes of text.
On 32-bit it allows the kernel to link because head_32.S calls it
unconditionally.

Instead follow the example of altivec_assist_exception(), and if
CONFIG_TAU_INT is not enabled just point it at unknown_exception using
the preprocessor.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

Can we just remove TAU_INT entirely? It's in zero defconfigs and
doesn't sound like something anyone really wants to enable:

  However, on some cpus it appears that the TAU interrupt hardware
  is buggy and can cause a situation which would lead unexplained hard
  lockups.

  Unless you are extending the TAU driver, or enjoy kernel/hardware
  debugging, leave this option off.
---
 arch/powerpc/kernel/head_32.S | 4 ++++
 arch/powerpc/kernel/traps.c   | 8 --------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 705c042309d8..dcfb7dceb6d6 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -671,6 +671,10 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 
 #ifndef CONFIG_ALTIVEC
 #define altivec_assist_exception	unknown_exception
+#endif
+
+#ifndef CONFIG_TAU_INT
+#define TAUException	unknown_exception
 #endif
 
 	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 97413a385720..d1ebe152f210 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2060,14 +2060,6 @@ void DebugException(struct pt_regs *regs, unsigned long debug_status)
 NOKPROBE_SYMBOL(DebugException);
 #endif /* CONFIG_PPC_ADV_DEBUG_REGS */
 
-#if !defined(CONFIG_TAU_INT)
-void TAUException(struct pt_regs *regs)
-{
-	printk("TAU trap at PC: %lx, MSR: %lx, vector=%lx    %s\n",
-	       regs->nip, regs->msr, regs->trap, print_tainted());
-}
-#endif /* CONFIG_INT_TAU */
-
 #ifdef CONFIG_ALTIVEC
 void altivec_assist_exception(struct pt_regs *regs)
 {
-- 
2.25.1

