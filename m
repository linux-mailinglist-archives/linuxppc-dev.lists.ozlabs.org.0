Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16170165D10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 13:00:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NY7Z5NvMzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 23:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NXxd6KwLzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ApAYQmKY; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48NXxd5cLCz9sR4; Thu, 20 Feb 2020 22:51:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48NXxd4S7Cz9sSD; Thu, 20 Feb 2020 22:51:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582199509;
 bh=h70tlCo/gMzI2w/SG41TQK9spTIeG2tVhulJDNjQ6sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ApAYQmKYQD8Vc6z9t0m3bJG8SOZQD29P+75l4xrbB2VwrTk3gkYWZI4BHtY5IlPwo
 E45S5nS9+e0MMCURXfDwfa5cD4bqFb9uuhgqXee3lOM0iw8HP49RrHiY9jJKivbRcZ
 59VhcvppNNZ4G3E4CjXh+Vvj/ZRMLjMUdITpzgnsEIIBguNctZVaB2Wigu/HXfiGH+
 bvSHiwy0DtC1tYOavg4MhsVZcpz6z6lvrT9KipjTykjJtAP8bVlREZdT4fMFCmLNYV
 wTgTNraGxpzOGNq4ZbdZ7RP+IWxz5xIABEPuBwOgtPHDZewibCsbeQGVXfmmW6njFn
 ifrVXeQ/X+WCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 4/5] powerpc/irq: use IS_ENABLED() in check_stack_overflow()
Date: Thu, 20 Feb 2020 22:51:40 +1100
Message-Id: <20200220115141.2707-4-mpe@ellerman.id.au>
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

Instead of #ifdef, use IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW).
This enable GCC to check for code validity even when the option
is not selected.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/98855694e9e8993673af08cc2e97e16e0cf50f4a.1579849665.git.christophe.leroy@c-s.fr
---
 arch/powerpc/kernel/irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index c7d6f5cdffdb..46d5852fb00a 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -599,9 +599,11 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 
 static inline void check_stack_overflow(void)
 {
-#ifdef CONFIG_DEBUG_STACKOVERFLOW
 	long sp;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW))
+		return;
+
 	sp = current_stack_pointer & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
@@ -609,7 +611,6 @@ static inline void check_stack_overflow(void)
 		pr_err("do_IRQ: stack overflow: %ld\n", sp);
 		dump_stack();
 	}
-#endif
 }
 
 void __do_irq(struct pt_regs *regs)
-- 
2.21.1

