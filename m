Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED92B8DEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 09:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcD2H15gFzDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 19:52:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcCxY6S24zDqdw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 19:47:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CcCxN0LhHz9txtY;
 Thu, 19 Nov 2020 09:47:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wr6RtAVX3TBo; Thu, 19 Nov 2020 09:47:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CcCxM3vlyz9txtS;
 Thu, 19 Nov 2020 09:47:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 88B748B802;
 Thu, 19 Nov 2020 09:47:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U6wMiB3zBo2u; Thu, 19 Nov 2020 09:47:52 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 236778B78A;
 Thu, 19 Nov 2020 09:47:52 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E31C06688B; Thu, 19 Nov 2020 08:47:51 +0000 (UTC)
Message-Id: <02a1a06817a1967a12b4ff767e17cb1de892f732.1605774882.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH for 4.19] powerpc/8xx: Always fault when _PAGE_ACCESSED is not
 set
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Date: Thu, 19 Nov 2020 08:47:51 +0000 (UTC)
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

[This is backport for 4.19 of 29daf869cbab69088fe1755d9dd224e99ba78b56]

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
index 9fd2ff28b8ff..dc99258f2e8c 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -356,11 +356,9 @@ _ENTRY(ITLBMiss_cmp)
 	/* Load the MI_TWC with the attributes for this "segment." */
 	mtspr	SPRN_MI_TWC, r11	/* Set segment attributes */
 
-#ifdef CONFIG_SWAP
-	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
+	rlwinm	r11, r10, 32-7, _PAGE_PRESENT
 	and	r11, r11, r10
 	rlwimi	r10, r11, 0, _PAGE_PRESENT
-#endif
 	li	r11, RPN_PATTERN | 0x200
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 20 and 23 must be clear.
@@ -482,11 +480,9 @@ _ENTRY(DTLBMiss_jmp)
 	 * r11 = ((r10 & PRESENT) & ((r10 & ACCESSED) >> 5));
 	 * r10 = (r10 & ~PRESENT) | r11;
 	 */
-#ifdef CONFIG_SWAP
-	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
+	rlwinm	r11, r10, 32-7, _PAGE_PRESENT
 	and	r11, r11, r10
 	rlwimi	r10, r11, 0, _PAGE_PRESENT
-#endif
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 24, 25, 26, and 27 must be
 	 * set.  All other Linux PTE bits control the behavior
-- 
2.25.0

