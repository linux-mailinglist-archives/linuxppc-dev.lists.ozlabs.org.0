Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB69332561
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:22:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvVP0mbcz3g4s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvD11dpQz3d80
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:10:09 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCx3X4yz9tyjJ;
 Tue,  9 Mar 2021 13:10:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tOMXkEjxxwdR; Tue,  9 Mar 2021 13:10:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCx1BYdz9tyjH;
 Tue,  9 Mar 2021 13:10:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF9288B805;
 Tue,  9 Mar 2021 13:10:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N6Q04Ho6wv6N; Tue,  9 Mar 2021 13:10:05 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A7318B802;
 Tue,  9 Mar 2021 13:10:05 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EB78D67555; Tue,  9 Mar 2021 12:10:04 +0000 (UTC)
Message-Id: <e5c8c1a6689f96807d929744f09662e05d023800.1615291474.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 38/43] powerpc/32: Only use prepare_transfer_to_handler
 function on book3s/32 and e500
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:10:04 +0000 (UTC)
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
index 5cfa10816261..9c333e6db5fa 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -48,6 +48,7 @@
  */
 	.align	12
 
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
 	andi.	r0,r9,MSR_PR
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
@@ -80,8 +78,8 @@ prepare_transfer_to_handler:
 	rlwinm	r9,r9,0,~MSR_EE
 	stw	r9,_MSR(r11)
 	b	fast_exception_return
-#endif
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
+#endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 
 	.globl	transfer_to_syscall
 transfer_to_syscall:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 267479072495..ca303762d8cc 100644
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
index 4d583fbef0b6..a2565023d2d0 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -92,7 +92,9 @@ END_BTB_FLUSH_SECTION
 .endm
 
 .macro prepare_transfer_to_handler
+#ifdef CONFIG_E500
 	bl	prepare_transfer_to_handler
+#endif
 .endm
 
 .macro SYSCALL_ENTRY trapno intno srr1
-- 
2.25.0

