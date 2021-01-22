Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F82FFFF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:16:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMZsp0hXQzDrfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 21:16:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZdX6GG3zDrdT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 21:05:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMZdS2cFyz9vBn0;
 Fri, 22 Jan 2021 11:05:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Uvstz5O-VqKz; Fri, 22 Jan 2021 11:05:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMZdS1LMlz9vBml;
 Fri, 22 Jan 2021 11:05:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 522C78B819;
 Fri, 22 Jan 2021 11:05:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kqi-MTqVXnsV; Fri, 22 Jan 2021 11:05:33 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 100D08B817;
 Fri, 22 Jan 2021 11:05:33 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DDFCD66AAE; Fri, 22 Jan 2021 10:05:32 +0000 (UTC)
Message-Id: <ab0b95490648e8d2fc79b15b7cdc6b3b12005fb1.1611309841.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611309841.git.christophe.leroy@csgroup.eu>
References: <cover.1611309841.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 09/14] powerpc/32: Preserve cr1 in exception prolog stack
 check
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 22 Jan 2021 10:05:32 +0000 (UTC)
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

THREAD_ALIGN_SHIFT = THREAD_SHIFT + 1 = PAGE_SHIFT + 1
Maximum PAGE_SHIFT is 18 for 256k pages so
THREAD_ALIGN_SHIFT is 19 at the maximum.

No need to clobber cr1, it can be preserved when moving r1
into CR when we check stack overflow.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        | 2 +-
 arch/powerpc/kernel/head_book3s_32.S | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 1f5e64c70ddb..a7087930a844 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -55,7 +55,7 @@
 	lwz	r1,TASK_STACK-THREAD(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 1:
-	mtcrf	0x7f, r1
+	mtcrf	0x3f, r1
 	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
 #else
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 281de00c2ea4..6543cb410a8d 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -278,12 +278,6 @@ MachineCheck:
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
-#ifdef CONFIG_VMAP_STACK
-	mfspr	r4, SPRN_SPRG_THREAD
-	tovirt(r4, r4)
-	lwz	r4, RTAS_SP(r4)
-	cmpwi	cr1, r4, 0
-#endif
 	beq	cr1, machine_check_tramp
 	twi	31, 0, 0
 #else
-- 
2.25.0

