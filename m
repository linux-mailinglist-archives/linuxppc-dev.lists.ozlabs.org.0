Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB3129857
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:36:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNkS3fyyzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:36:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sHXfRysl"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVL1NwFzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:18 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNV96yzQz9vJyt;
 Mon, 23 Dec 2019 16:26:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sHXfRysl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L8wKDvhVT9WF; Mon, 23 Dec 2019 16:26:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNV95tz6z9vJyn;
 Mon, 23 Dec 2019 16:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114769; bh=/A5nHGIX1n3gwM0sFa6XeCQneVLd9/XPssrSN7a7g8I=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=sHXfRysliIex+d9/Owu7dVjupZ7ryZ4/iam1CzsrVLiPJ3QWUWPNKNxH2tlzAx0T7
 2mJv4J994amOHthnEbpWAe6aPUuiJEyWrLCLMG9NGhtWSXZbPDkdCpaK7fb2+10M5I
 KcCNi4EXt6+o4eROPWPD2kOCTHPAUZ0u1QNvWOH0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0165D8B7AB;
 Mon, 23 Dec 2019 16:26:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mfRKu-QhdIrE; Mon, 23 Dec 2019 16:26:14 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3EC28B7A1;
 Mon, 23 Dec 2019 16:26:14 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DE545637D8; Mon, 23 Dec 2019 15:26:14 +0000 (UTC)
Message-Id: <98430a9b57d4888610fd245337422434376e22fb.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 4/8] powerpc/irq: move set_irq_regs() closer to
 irq_enter/exit()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:14 +0000 (UTC)
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

set_irq_regs() is called by do_IRQ() while irq_enter() and irq_exit()
are called by __do_irq().

Move set_irq_regs() in __do_irq()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/irq.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 410accba865d..28414c6665cc 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -647,6 +647,7 @@ static inline void call_do_irq(struct pt_regs *regs, void *sp)
 
 void __do_irq(struct pt_regs *regs)
 {
+	struct pt_regs *old_regs = set_irq_regs(regs);
 	unsigned int irq;
 
 	irq_enter();
@@ -672,11 +673,11 @@ void __do_irq(struct pt_regs *regs)
 	trace_irq_exit(regs);
 
 	irq_exit();
+	set_irq_regs(old_regs);
 }
 
 void do_IRQ(struct pt_regs *regs)
 {
-	struct pt_regs *old_regs = set_irq_regs(regs);
 	void *cursp, *irqsp, *sirqsp;
 
 	/* Switch to the irq stack to handle this */
@@ -686,16 +687,11 @@ void do_IRQ(struct pt_regs *regs)
 
 	check_stack_overflow();
 
-	/* Already there ? */
-	if (unlikely(cursp == irqsp || cursp == sirqsp)) {
+	/* Already there ? Otherwise switch stack and call */
+	if (unlikely(cursp == irqsp || cursp == sirqsp))
 		__do_irq(regs);
-		set_irq_regs(old_regs);
-		return;
-	}
-	/* Switch stack and call */
-	call_do_irq(regs, irqsp);
-
-	set_irq_regs(old_regs);
+	else
+		call_do_irq(regs, irqsp);
 }
 
 void __init init_IRQ(void)
-- 
2.13.3

