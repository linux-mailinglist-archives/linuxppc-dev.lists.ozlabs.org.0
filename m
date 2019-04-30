Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E1F99E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:13:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thm626VqzDqC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:13:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="R/6PPSdm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0s5BvvzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0m65ppz9vD38;
 Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=R/6PPSdm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id beeXf01hbNiG; Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0m54ftz9vD30;
 Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627944; bh=nyn5PbqqhKTzRamqkQ3I4adO6bi1wUC9r3Z2MBImYHM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=R/6PPSdmoZ5NAyiTzibrVYDs+LWf6peMGsGja1FzLfUaXr0uR03458Ccu+LjW6l6L
 FiQRZShCWNqCOiW96vULutGUYPJMu/8pwwYPcdDRFLqOxAaYDy2bvE4wSWgfTqDE7p
 tvmD7dS/yKSGSf4WnLUULND++03zCwyoDYj2H7yQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF4D48B8E1;
 Tue, 30 Apr 2019 14:39:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LCQMn-uA0xdE; Tue, 30 Apr 2019 14:39:05 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC76E8B8DF;
 Tue, 30 Apr 2019 14:39:05 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 91C83666F8; Tue, 30 Apr 2019 12:39:05 +0000 (UTC)
Message-Id: <5e4c040b7c1f89b960bd5df2d7eb073bcd72c96d.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 16/16] powerpc/32: Don't add dummy frames when calling
 trace_hardirqs_on/off
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:39:05 +0000 (UTC)
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

No need to add dummy frames when calling trace_hardirqs_on or
trace_hardirqs_off. GCC properly handles empty stacks.

In addition, powerpc doesn't set CONFIG_FRAME_POINTER, therefore
__builtin_return_address(1..) returns NULL at all time. So the
dummy frames are definitely unneeded here.

In the meantime, avoid reading memory for loading r1 with a value
we already know.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index e65c3e70c648..235a01d34b6d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -243,12 +243,7 @@ transfer_to_handler_cont:
 
 reenable_mmu:
 	/*
-	 * The trace_hardirqs_off will use CALLER_ADDR0 and CALLER_ADDR1.
-	 * If from user mode there is only one stack frame on the stack, and
-	 * accessing CALLER_ADDR1 will cause oops. So we need create a dummy
-	 * stack frame to make trace_hardirqs_off happy.
-	 *
-	 * This is handy because we also need to save a bunch of GPRs,
+	 * We save a bunch of GPRs,
 	 * r3 can be different from GPR3(r1) at this point, r9 and r11
 	 * contains the old MSR and handler address respectively,
 	 * r4 & r5 can contain page fault arguments that need to be passed
@@ -950,18 +945,11 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
 	 */
 	andi.	r10,r9,MSR_EE
 	beq	1f
-	/*
-	 * Since the ftrace irqsoff latency trace checks CALLER_ADDR1,
-	 * which is the stack frame here, we need to force a stack frame
-	 * in case we came from user space.
-	 */
 	stwu	r1,-32(r1)
 	mflr	r0
 	stw	r0,4(r1)
-	stwu	r1,-32(r1)
 	bl	trace_hardirqs_on
-	lwz	r1,0(r1)
-	lwz	r1,0(r1)
+	addi	r1, r1, 32
 	lwz	r9,_MSR(r1)
 1:
 #endif /* CONFIG_TRACE_IRQFLAGS */
-- 
2.13.3

