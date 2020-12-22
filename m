Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330042E0AF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:41:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0ctK2XGMzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:40:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cbz5Rc8zDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cbt6DPNz9v1w3;
 Tue, 22 Dec 2020 14:28:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dtpUDLkFgp3Y; Tue, 22 Dec 2020 14:28:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cbt3Ntyz9v1vl;
 Tue, 22 Dec 2020 14:28:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D4648B812;
 Tue, 22 Dec 2020 14:28:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q5n7FFkUfKck; Tue, 22 Dec 2020 14:28:27 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEAC68B81C;
 Tue, 22 Dec 2020 14:28:26 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9E5B366969; Tue, 22 Dec 2020 13:28:26 +0000 (UTC)
Message-Id: <34fde63f403eca009921fee44176f16a43a8d57d.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 04/15] powerpc/32s: Do DABR match out of handle_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:26 +0000 (UTC)
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

handle_page_fault() has some code dedicated to book3s/32 to
call do_break() when the DSI is a DABR match.

On other platforms, do_break() is handled separately.

Do the same for book3s/32, do it earlier in the process of DSI.

This change also avoid doing the test on ISI.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       | 15 ---------------
 arch/powerpc/kernel/head_book3s_32.S |  3 +++
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1c9b0ccc2172..238eacfda7b0 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -670,10 +670,6 @@ ppc_swapcontext:
 	.globl	handle_page_fault
 handle_page_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-#ifdef CONFIG_PPC_BOOK3S_32
-	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
-#endif
 	bl	do_page_fault
 	cmpwi	r3,0
 	beq+	ret_from_except
@@ -687,17 +683,6 @@ handle_page_fault:
 	bl	__bad_page_fault
 	b	ret_from_except_full
 
-#ifdef CONFIG_PPC_BOOK3S_32
-	/* We have a data breakpoint exception - handle it */
-handle_dabr_fault:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	clrrwi	r0,r0,1
-	stw	r0,_TRAP(r1)
-	bl      do_break
-	b	ret_from_except_full
-#endif
-
 /*
  * This routine switches between two different tasks.  The process
  * state of one is saved on its kernel stack.  Then the state
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index f6355fcca86a..15e6003fd3b8 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -697,7 +697,10 @@ handle_page_fault_tramp_1:
 	lwz	r5, _DSISR(r11)
 	/* fall through */
 handle_page_fault_tramp_2:
+	andis.	r0, r5, DSISR_DABRMATCH@h
+	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
+1:	EXC_XFER_STD(0x300, do_break)
 
 #ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_PPC_BOOK3S_604
-- 
2.25.0

