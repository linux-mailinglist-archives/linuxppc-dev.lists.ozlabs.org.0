Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4B19ED2B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 19:55:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wLtS2qgRzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:55:28 +1000 (AEST)
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
 header.s=mail header.b=IJFPpQFU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wLf71bGCzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 03:44:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wLf035zcz9ty3f;
 Sun,  5 Apr 2020 19:44:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IJFPpQFU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1MK9f946t24S; Sun,  5 Apr 2020 19:44:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wLf023YTz9ty2y;
 Sun,  5 Apr 2020 19:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586108680; bh=wmZy7ipfscIdKuzydVM5rBpCDOVuqjeYOysQduJjYcs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=IJFPpQFU+aOmUtiVHgTX5pitR1oK34Ps7+HYGwPQhoijTpqDpfaKHzH0Cfz4fqr9w
 a8x2j2T+Dx/PlefLffpOxFCZFQsv/KG3zQ0G9LUVhlpdJCHoYdknryb7QuiPKvcxon
 6K9fmsafJAQ/X+VihdLlxr760QfF28loTvBSyHyI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D6E788B783;
 Sun,  5 Apr 2020 19:44:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qSAzoxxQQDtM; Sun,  5 Apr 2020 19:44:43 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CF178B774;
 Sun,  5 Apr 2020 19:44:43 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6EFFE6571C; Sun,  5 Apr 2020 17:44:43 +0000 (UTC)
Message-Id: <ad31d58a040fce9259c8550b769d1f862a5401a3.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 08/13] powerpc/syscall: Save r3 in regs->orig_r3
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Sun,  5 Apr 2020 17:44:43 +0000 (UTC)
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

Save r3 in regs->orig_r3 in system_call_exception()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_64.S | 1 -
 arch/powerpc/kernel/syscall.c  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 63f0a4414618..5ccb65f75712 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -114,7 +114,6 @@ END_BTB_FLUSH_SECTION
 	std	r10,_LINK(r1)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
-	std	r3,ORIG_GPR3(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 4674cfd2916d..986489ea9fb4 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -27,6 +27,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	unsigned long ti_flags;
 	syscall_fn f;
 
+	regs->orig_gpr3 = r3;
+
 #ifdef CONFIG_PPC64
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
-- 
2.25.0

