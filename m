Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A79C4F6274
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSMw2yXBz3bbB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 00:59:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rcE2qxf3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSLk0cdSz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 00:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rcE2qxf3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYSLj6gT3z4xYM;
 Thu,  7 Apr 2022 00:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649257102;
 bh=kYnGT+rEo7osPCeMABd3VqTCciw3F0P7WmktdHS1b+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rcE2qxf349SRP6R2sGmeennX0K9bzO5/f1CsMh4A6TK402S7v0lnDTlDecJcIUrVS
 PkwnwBYDnRgtNuGWIy75cbDuNk0XnSWJqYzG3eJPT3Mr0T4UCQmMbtpXq48AxPN2PZ
 Imeg7XavLx/kISihn2XDhpFx/IVvKGlWELEzIkkuhXqdptWxLvGS7a8QAOVLYJMH0q
 JR/Mm/T6YslMPTZiy87B7HyqsDRQZmZupFpLLfs2+QylF28Q0eo00LmHwlj5T3Ub3B
 cbJgox4HSKL1AdY4s5g9FrlEnnJMJA7Xmxci1Dg3hKduA8ZeRTXlP3Lib57c2RsYlo
 a1yXjHZ1S7n8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/6] powerpc/85xx: Fix virt_to_phys() off-by-one in
 smp_85xx_start_cpu()
Date: Thu,  7 Apr 2022 00:57:59 +1000
Message-Id: <20220406145802.538416-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406145802.538416-1-mpe@ellerman.id.au>
References: <20220406145802.538416-1-mpe@ellerman.id.au>
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
Cc: erhard_f@mailbox.org, wangkefeng.wang@huawei.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In smp_85xx_start_cpu() we are passed an address but we're unsure if
it's a real or virtual address, so there's a check to determine that.

The check has an off-by-one in that it tests if the address is greater
than high_memory, but high_memory is the first address of high memory,
so the check should be greater-or-equal.

It seems this has never been a problem in practice, but it also triggers
the DEBUG_VIRTUAL checks in __pa() which we would like to avoid. We can
fix both issues by converting high_memory - 1 to a physical address and
testing against that.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/85xx/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index a1c6a7827c8f..9c43cf32f4c9 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -208,7 +208,7 @@ static int smp_85xx_start_cpu(int cpu)
 	 * The bootpage and highmem can be accessed via ioremap(), but
 	 * we need to directly access the spinloop if its in lowmem.
 	 */
-	ioremappable = *cpu_rel_addr > virt_to_phys(high_memory);
+	ioremappable = *cpu_rel_addr > virt_to_phys(high_memory - 1);
 
 	/* Map the spin table */
 	if (ioremappable)
-- 
2.34.1

