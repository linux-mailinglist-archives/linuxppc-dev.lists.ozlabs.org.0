Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEF19FD5C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:42:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wztR1cK9zDqbw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:42:39 +1000 (AEST)
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
 header.s=mail header.b=MEse3+vj; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzJh1B1XzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:16:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzJd221lz9v0BM;
 Mon,  6 Apr 2020 20:16:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MEse3+vj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MO6WKEdwWqe7; Mon,  6 Apr 2020 20:16:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzJd0xg7z9v0BL;
 Mon,  6 Apr 2020 20:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586197009; bh=KhQRpPjql4iBmrVyMyR4fg1vYv3KiRovrf87iAwV4+8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=MEse3+vj4xGrUBLjSfa92tk0g5o3qFrVsZP2/LAHBdO5hcBYR7T6Ab7aKT3U2309P
 tvnJ5/O9ewcMOUUviOOjPue2O4pBo8CknwLOUuYi54I9DXr4S/la61B8YaX2pqLEDH
 dzxt4HUoAQOjNs5+ggU2R56ZISNTOtXNBq7vptqQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D20638B784;
 Mon,  6 Apr 2020 20:16:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zolvmdBxE9TE; Mon,  6 Apr 2020 20:16:48 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B5678B775;
 Mon,  6 Apr 2020 20:16:48 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 69DE7656E9; Mon,  6 Apr 2020 18:16:48 +0000 (UTC)
Message-Id: <99851590f78150820e1c21af7f6370d7b82830e9.1586196948.git.christophe.leroy@c-s.fr>
In-Reply-To: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
References: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 12/15] powerpc/syscall: Selectively check MSR_RI and
 MSR_PR on syscall entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  6 Apr 2020 18:16:48 +0000 (UTC)
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

In system_call_exception(), MSR_RI needs to also be checked on 8xx.
Only book3e doesn't have MSR_RI.

On PPC32, MSR_PR is checked in real mode to avoid clobbering the
stack, so no need to check and panic in system_call_exception().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index dfd7b28239b8..f9fca9985b0f 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -34,9 +34,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	trace_hardirqs_off(); /* finish reconciling */
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3E))
 		BUG_ON(!(regs->msr & MSR_RI));
-	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(IS_ENABLED(CONFIG_PPC64) && get_softe(regs) != IRQS_ENABLED);
 
-- 
2.25.0

