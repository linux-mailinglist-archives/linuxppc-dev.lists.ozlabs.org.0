Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E8338E21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:03:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmFg6jJFz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:03:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlzZ0jWHz3dNQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzV4l9mz9ttBL;
 Fri, 12 Mar 2021 13:50:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WwJpq2d7kuoV; Fri, 12 Mar 2021 13:50:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzV2svlz9ttDF;
 Fri, 12 Mar 2021 13:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C4FD8B814;
 Fri, 12 Mar 2021 13:50:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q9wfiDq-pXG6; Fri, 12 Mar 2021 13:50:47 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E2E258B764;
 Fri, 12 Mar 2021 13:50:46 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B5F75675C9; Fri, 12 Mar 2021 12:50:46 +0000 (UTC)
Message-Id: <b5e29ca0e557c11340415a13fe8b107189d315e1.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 36/41] powerpc/32: Only use prepare_transfer_to_handler
 function on book3s/32 and e500
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:46 +0000 (UTC)
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

Only book3s/32 and e500 have significative work to do in
prepare_transfer_to_handler.

Other 32 bit have nothing to do at all.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S   | 6 ++----
 arch/powerpc/kernel/head_32.h    | 2 ++
 arch/powerpc/kernel/head_booke.h | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index b9a2935efec1..44d0eddf8738 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -48,6 +48,7 @@
  */
 	.align	12
 
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
 	andi.	r12,r9,MSR_PR
@@ -61,15 +62,12 @@ prepare_transfer_to_handler:
 	/* if from kernel, check interrupted DOZE/NAP mode */
 2:
 	kuap_save_and_lock r11, r12, r9, r5, r6
-#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	lwz	r12,TI_LOCAL_FLAGS(r2)
 	mtcrf	0x01,r12
 	bt-	31-TLF_NAPPING,4f
 	bt-	31-TLF_SLEEPING,7f
-#endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 	blr
 
-#if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 4:	rlwinm	r12,r12,0,~_TLF_NAPPING
 	stw	r12,TI_LOCAL_FLAGS(r2)
 	b	power_save_ppc32_restore
@@ -82,8 +80,8 @@ prepare_transfer_to_handler:
 	kuap_restore r11, r2, r3, r4, r5
 	lwz	r2, GPR2(r11)
 	b	fast_exception_return
-#endif
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
+#endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 
 	.globl	transfer_to_syscall
 transfer_to_syscall:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 80e45c800496..c018fcdf9157 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -132,7 +132,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 .endm
 
 .macro prepare_transfer_to_handler
+#ifdef CONFIG_PPC_BOOK3S_32
 	bl	prepare_transfer_to_handler
+#endif
 .endm
 
 .macro SYSCALL_ENTRY trapno
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 7f3dd5fae51d..cb96ae002af6 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -104,7 +104,9 @@ END_BTB_FLUSH_SECTION
 .endm
 
 .macro prepare_transfer_to_handler
+#ifdef CONFIG_E500
 	bl	prepare_transfer_to_handler
+#endif
 .endm
 
 .macro SYSCALL_ENTRY trapno intno srr1
-- 
2.25.0

