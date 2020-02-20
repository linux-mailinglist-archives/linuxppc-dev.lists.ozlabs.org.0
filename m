Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E0165D08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 12:58:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NY5F0ZYRzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 22:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NXxd0rTYzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f1aKv4c0; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48NXxc59CZz9sR4; Thu, 20 Feb 2020 22:51:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48NXxc4D2gz9sRm; Thu, 20 Feb 2020 22:51:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582199508;
 bh=xsNNtlV7KxA66FpWLHwmFXdgUQFYhOEfB6fa2VtDGDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f1aKv4c0f2IqMufxyDIMF6+FEgCxpUyKgJg4HKRHjdhsm/4O420J7ovHavSBaphe1
 JgUspdJtxRf0FNKAf0W1KCayxlh5NC7Gct4FtkH+b3uIdDFkImARqId5aONkOVJ+nz
 R2KcaRshpNq/PGMuzf1ejrHDdbXc5X1ekIHwODhHpXPC6OazgNd0xSzpKKpMJ7JDo0
 HpbtlPMhFvztSZMzkEjBSNNG4NMzfhhLGmEzc8MTt1AogKsG+PxzT4KRAU3Z2Oy7MV
 FoYfAagjcV8vBzeMgEqSouBgbobIuqBSmK30Tb42+acNWFmDKE55wf+ffvjE04CQGY
 hkIEHLO7Zsa0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 3/5] powerpc/irq: Use current_stack_pointer in
 check_stack_overflow()
Date: Thu, 20 Feb 2020 22:51:39 +1100
Message-Id: <20200220115141.2707-3-mpe@ellerman.id.au>
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

The purpose of check_stack_overflow() is to verify that the stack has
not overflowed.

To really know whether the stack pointer is still within boundaries,
the check must be done directly on the value of r1.

So use current_stack_pointer, which returns the current value of r1,
rather than current_stack_frame() which causes a frame to be created
and then returns that value.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr
---
 arch/powerpc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 02118c18434d..c7d6f5cdffdb 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -602,7 +602,7 @@ static inline void check_stack_overflow(void)
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
 	long sp;
 
-	sp = current_stack_frame() & (THREAD_SIZE-1);
+	sp = current_stack_pointer & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
 	if (unlikely(sp < 2048)) {
-- 
2.21.1

v3: s/get_sp()/current_stack_pointer/
