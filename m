Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B29452B8DE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 09:50:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcD0468SzzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 19:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcCxY6WX4zDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 19:47:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CcCxP0gbgz9txtW;
 Thu, 19 Nov 2020 09:47:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RSaFfZRmm4un; Thu, 19 Nov 2020 09:47:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CcCxN5C9nz9txtS;
 Thu, 19 Nov 2020 09:47:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3C08B78A;
 Thu, 19 Nov 2020 09:47:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U-DgrBLkV29z; Thu, 19 Nov 2020 09:47:53 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 230C68B802;
 Thu, 19 Nov 2020 09:47:53 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E8BFF6688B; Thu, 19 Nov 2020 08:47:52 +0000 (UTC)
Message-Id: <9a470c4d9a887ad32acea1d3b49f9aa1f342bb15.1605774918.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH for 4.4] powerpc/8xx: Always fault when _PAGE_ACCESSED is not
 set
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Date: Thu, 19 Nov 2020 08:47:52 +0000 (UTC)
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

[This is backport for 4.4 of 29daf869cbab69088fe1755d9dd224e99ba78b56]

The kernel expects pte_young() to work regardless of CONFIG_SWAP.

Make sure a minor fault is taken to set _PAGE_ACCESSED when it
is not already set, regardless of the selection of CONFIG_SWAP.

This adds at least 3 instructions to the TLB miss exception
handlers fast path. Following patch will reduce this overhead.

Also update the rotation instruction to the correct number of bits
to reflect all changes done to _PAGE_ACCESSED over time.

Fixes: d069cb4373fe ("powerpc/8xx: Don't touch ACCESSED when no SWAP.")
Fixes: 5f356497c384 ("powerpc/8xx: remove unused _PAGE_WRITETHRU")
Fixes: e0a8e0d90a9f ("powerpc/8xx: Handle PAGE_USER via APG bits")
Fixes: 5b2753fc3e8a ("powerpc/8xx: Implementation of PAGE_EXEC")
Fixes: a891c43b97d3 ("powerpc/8xx: Prepare handlers for _PAGE_HUGE for 512k pages.")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/af834e8a0f1fa97bfae65664950f0984a70c4750.1602492856.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/kernel/head_8xx.S | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 01e274e6907b..3d7512e72900 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -361,11 +361,9 @@ InstructionTLBMiss:
 	/* Load the MI_TWC with the attributes for this "segment." */
 	MTSPR_CPU6(SPRN_MI_TWC, r11, r3)	/* Set segment attributes */
 
-#ifdef CONFIG_SWAP
-	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
+	rlwinm	r11, r10, 32-11, _PAGE_PRESENT
 	and	r11, r11, r10
 	rlwimi	r10, r11, 0, _PAGE_PRESENT
-#endif
 	li	r11, RPN_PATTERN
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 20-23 and 28 must be clear.
@@ -436,11 +434,9 @@ DataStoreTLBMiss:
 	 * r11 = ((r10 & PRESENT) & ((r10 & ACCESSED) >> 5));
 	 * r10 = (r10 & ~PRESENT) | r11;
 	 */
-#ifdef CONFIG_SWAP
-	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
+	rlwinm	r11, r10, 32-11, _PAGE_PRESENT
 	and	r11, r11, r10
 	rlwimi	r10, r11, 0, _PAGE_PRESENT
-#endif
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 22 and 28 must be clear.
 	 * Software indicator bits 24, 25, 26, and 27 must be
-- 
2.25.0

