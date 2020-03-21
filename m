Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 378DC18DF7B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 11:38:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kxvV3bcpzF0Rs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 21:38:46 +1100 (AEDT)
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
 header.s=mail header.b=WvlWrorl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kxsy4Z0wzDrqQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 21:37:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48kxst1vZdz9v26c;
 Sat, 21 Mar 2020 11:37:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WvlWrorl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dV6ZTpKe0rJh; Sat, 21 Mar 2020 11:37:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48kxst0j1Mz9v26D;
 Sat, 21 Mar 2020 11:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584787042; bh=8dNFekUvF26E/zA1FpkQASGFZrLQ7xw2bJ/GI3qh8iI=;
 h=From:Subject:To:Cc:Date:From;
 b=WvlWrorlU+XIPJ9tLAHV0CI4dnTs9hnGB2sYjUE/W9bIQZm0jkCGnau6ejoiTRaOI
 K8z2yiyMCKYjCfC1WeeKP2R+WbqsWRQZpn28TyHpEVJFW3Gija9CgYT/spm3yitRig
 cmbjF4ciUZo8cez30CSI5SJgXJlhz1H/DYOEpwzE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2571E8B774;
 Sat, 21 Mar 2020 11:37:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zOeJedXCgpaI; Sat, 21 Mar 2020 11:37:18 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CC848B752;
 Sat, 21 Mar 2020 11:37:17 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2B5BB655CB; Sat, 21 Mar 2020 10:37:17 +0000 (UTC)
Message-Id: <5558d8c22ff0ed03cb5392798564dd203bd68501.1584787012.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/ptrace: Fix ptrace-hwbreak selftest failure
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 21 Mar 2020 10:37:17 +0000 (UTC)
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

Pieces of commit c3f68b0478e7 ("powerpc/watchpoint: Fix ptrace
code that muck around with address/len") disappeared with
commit 53387e67d003 ("powerpc/ptrace: split out ADV_DEBUG_REGS
related functions.").

Restore them.

Fixes: 53387e67d003 ("powerpc/ptrace: split out ADV_DEBUG_REGS related functions.")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index cf05fadba0d5..d4170932acb4 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -153,7 +153,7 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	if ((unsigned long)bp_info->addr >= TASK_SIZE)
 		return -EIO;
 
-	brk.address = bp_info->addr & ~7UL;
+	brk.address = bp_info->addr & ~HW_BREAKPOINT_ALIGN;
 	brk.type = HW_BRK_TYPE_TRANSLATE;
 	brk.len = DABR_MAX_LEN;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
@@ -161,10 +161,6 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
 		brk.type |= HW_BRK_TYPE_WRITE;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	/*
-	 * Check if the request is for 'range' breakpoints. We can
-	 * support it if range < 8 bytes.
-	 */
 	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
 		len = bp_info->addr2 - bp_info->addr;
 	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
@@ -177,7 +173,7 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 
 	/* Create a new breakpoint request if one doesn't exist already */
 	hw_breakpoint_init(&attr);
-	attr.bp_addr = (unsigned long)bp_info->addr & ~HW_BREAKPOINT_ALIGN;
+	attr.bp_addr = (unsigned long)bp_info->addr;
 	attr.bp_len = len;
 	arch_bp_generic_fields(brk.type, &attr.bp_type);
 
-- 
2.25.0

