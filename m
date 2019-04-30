Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4852F98E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:09:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thgf2CT8zDqW0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:09:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Rzy3c1fu"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0r6T20zDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0l5Kp1z9vD3C;
 Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Rzy3c1fu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ac3cEZdpOyBc; Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0l47CZz9vD30;
 Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627943; bh=f5YsfLpbvdLn0XXnWjAxlpwajHYoV8o20+zw0Y+DHhE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Rzy3c1fuyMeliG701+kZh2/wU2Pld85MshrAaJrocgtud//aGb7FzfaXv5k+hjQu8
 klPZmkCawLswYqyiI43gvVv5bCsjnep1L3rt6phZXr/N3r9BDouqVaO5qoMMYinWH2
 VCCwHcapqXs5pxVjxLYYJqxw0C1GH5r5X/KRHmcE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA6578B8DF;
 Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 546bxg9kouOL; Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C59DC8B8C2;
 Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8D180666F8; Tue, 30 Apr 2019 12:39:04 +0000 (UTC)
Message-Id: <26d4ef723e031925d9252390c7f09aec66f18b54.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 15/16] powerpc/32: don't do syscall stuff in
 transfer_to_handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:39:04 +0000 (UTC)
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

As syscalls are now handled via a fast entry path, syscall related
actions can be removed from the generic transfer_to_handler path.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index dc58fec51ed6..e65c3e70c648 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -217,7 +217,6 @@ transfer_to_handler_cont:
 	 */
 	tophys(r12, r1)
 	lwz	r12,_MSR(r12)
-	xor	r12,r10,r12
 	andi.	r12,r12,MSR_EE
 	bne	1f
 
@@ -258,9 +257,6 @@ reenable_mmu:
 	 * the rest is restored from the exception frame.
 	 */
 
-	/* Are we enabling or disabling interrupts ? */
-	andi.	r0,r10,MSR_EE
-
 	stwu	r1,-32(r1)
 	stw	r9,8(r1)
 	stw	r11,12(r1)
@@ -268,8 +264,6 @@ reenable_mmu:
 	stw	r4,20(r1)
 	stw	r5,24(r1)
 
-	bne-	0f
-
 	/* If we are disabling interrupts (normal case), simply log it with
 	 * lockdep
 	 */
@@ -287,19 +281,6 @@ reenable_mmu:
 	mtctr	r11
 	mtlr	r9
 	bctr				/* jump to handler */
-
-	/* If we are enabling interrupt, this is a syscall. They shouldn't
-	 * happen while interrupts are disabled, so let's do a warning here.
-	 */
-0:	trap
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-	bl	trace_hardirqs_on
-
-	/* Now enable for real */
-	mfmsr	r10
-	ori	r10,r10,MSR_EE
-	mtmsr	r10
-	b	2b
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
-- 
2.13.3

