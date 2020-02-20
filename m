Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED547165D33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 13:03:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NYCC0576zDqK9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 23:03:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NXxg0bFMzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qk6UDVK2; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48NXxf6MKSz9sR4; Thu, 20 Feb 2020 22:51:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48NXxf4qptz9sSH; Thu, 20 Feb 2020 22:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582199510;
 bh=+KZ5UNDD8klt0PNfIkxXpIjC4PXkIYNkPckrNNn5GXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qk6UDVK2AoE7k7ukk1YLMCz0/RsLhcwvociG6zVaR5VClj9ao3jWvbHn4NpMjOMsN
 2Nhqe5MwTrtPPgMEjFcDOZYdVjCpJaYvBx8y62rHdZ3Q1texYNcmkpN6kzRZuZ53+e
 ODI/ztYS3GKjZ3GylqleTYcnU4ldP20XcbwdUkNhHRM68RHtd9+TW4qDtrqmUCoWv9
 XCF3U1arj5DPmVnNiFOqMwankzodSYhzrnDdXUQh7JPpCNFWnjFMmfSQNB3DCN7/Ou
 76OZGUm5sNarZQFuvdCenuHveo/dtC7HPb1+O0CsGn37gqOxYM9YNGtUcBiSIvM8Ze
 8HcqBRY4Ud3AA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 5/5] powerpc/irq: Use current_stack_pointer in do_IRQ()
Date: Thu, 20 Feb 2020 22:51:41 +1100
Message-Id: <20200220115141.2707-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220115141.2707-1-mpe@ellerman.id.au>
References: <20200220115141.2707-1-mpe@ellerman.id.au>
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

From: Christophe Leroy <christophe.leroy@c-s.fr>

Until commit 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to
find the stack"), the current stack base address was obtained by
calling current_thread_info(). That inline function was simply masking
out the value of r1.

In that commit, it was changed to using current_stack_pointer() (since
renamed current_stack_frame()), which is a heavier function as it is
an outline assembly function which cannot be inlined and which reads
the content of the stack at 0(r1).

Convert to using current_stack_pointer for geting r1 and masking out
its value to obtain the base address of the stack pointer as before.

Fixes: 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to find the stack")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/a37e699e7ab897742c07b6838a08af33bc9217e3.1579849665.git.christophe.leroy@c-s.fr
---
 arch/powerpc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 46d5852fb00a..1bed18b7229e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -648,7 +648,7 @@ void do_IRQ(struct pt_regs *regs)
 	void *cursp, *irqsp, *sirqsp;
 
 	/* Switch to the irq stack to handle this */
-	cursp = (void *)(current_stack_frame() & ~(THREAD_SIZE - 1));
+	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
 	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
-- 
2.21.1

v3: s/get_sp()/current_stack_pointer/
