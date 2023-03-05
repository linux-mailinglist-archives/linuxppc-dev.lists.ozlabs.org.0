Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3B6AB0F2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 15:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3YN530Lz3fSc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 01:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGKKddNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGKKddNy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV39T3snZz3f8R
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:54:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE6C360B08;
	Sun,  5 Mar 2023 13:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98122C433EF;
	Sun,  5 Mar 2023 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024475;
	bh=pb+Q+GYcGcQPsWmuIlyMyWhdCQgHurrZN8P/5LmXYD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGKKddNyJTQ6TXeRWm7TjQmGDIpacUqFxphJ93D2csgmUO0e5ahgvsSk49ld/bSsj
	 G2FY1DYz4RnkXJvDqYv4NqlNMqY0HsieUtBmE0bPT0dxCcq2eYttHmTs1G+icS43Dh
	 4AO7qM2z6VThpNfdq6akNrJ/7kFaGdKD6Bh1bjY7gSIwmRqMLtY4GkjJyCOdSJK8iV
	 SwSk3Mg3lSh35G7XcQOhvNvv/Nq+YvZMwMZpoU8ViduHC0uRPbsBoBUg+yhIysJTkB
	 7bvdxH5u8yyN2mZcQ7pOe/Oi51pUpZiwnqI47ym+UWBsY0BbaAjCo1FUYU8FYJesPv
	 rgPaUNsvUm+Wg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 3/8] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
Date: Sun,  5 Mar 2023 08:54:20 -0500
Message-Id: <20230305135425.1793964-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135425.1793964-1-sashal@kernel.org>
References: <20230305135425.1793964-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit bab537805a10bdbf55b31324ba4a9599e0651e5e ]

NO_IRQ is a relic from the old days. It is not used anymore in core
functions. By the way, function irq_of_parse_and_map() returns value 0
on error.

In some drivers, NO_IRQ is erroneously used to check the return of
irq_of_parse_and_map().

It is not a real bug today because the only architectures using the
drivers being fixed by this patch define NO_IRQ as 0, but there are
architectures which define NO_IRQ as -1. If one day those
architectures start using the non fixed drivers, there will be a
problem.

Long time ago Linus advocated for not using NO_IRQ, see
https://lore.kernel.org/all/Pine.LNX.4.64.0511211150040.13959@g5.osdl.org

He re-iterated the same view recently in
https://lore.kernel.org/all/CAHk-=wg2Pkb9kbfbstbB91AJA2SF6cySbsgHG-iQMq56j3VTcA@mail.gmail.com

So test !irq instead of tesing irq == NO_IRQ.

All other usage of NO_IRQ for powerpc were removed in previous cycles so
the time has come to remove NO_IRQ completely for powerpc.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/4b8d4f96140af01dec3a3330924dda8b2451c316.1674476798.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/irq.h    | 3 ---
 arch/powerpc/platforms/44x/fsp2.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 4f983ca4030a4..4d5e68e6d3b6d 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -17,9 +17,6 @@
 
 extern atomic_t ppc_n_lost_interrupts;
 
-/* This number is used when no interrupt has been assigned */
-#define NO_IRQ			(0)
-
 /* Total number of virq in the platform */
 #define NR_IRQS		CONFIG_NR_IRQS
 
diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index 823397c802def..f8bbe05d9ef29 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -205,7 +205,7 @@ static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
 
 	for_each_compatible_node(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
-		if (irq == NO_IRQ) {
+		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
 			of_node_put(np);
-- 
2.39.2

