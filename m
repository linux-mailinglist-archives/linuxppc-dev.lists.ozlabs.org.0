Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE16338DD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxm5Q5ngHz3g2p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxlz962TDz3d3y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dxlz63tm4z9ttBc;
 Fri, 12 Mar 2021 13:50:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DFEgaaHV_a-2; Fri, 12 Mar 2021 13:50:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dxlz635j2z9ttBL;
 Fri, 12 Mar 2021 13:50:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F67C8B814;
 Fri, 12 Mar 2021 13:50:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fqm7nvcWPKoC; Fri, 12 Mar 2021 13:50:27 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CADD8B812;
 Fri, 12 Mar 2021 13:50:27 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0564A675C9; Fri, 12 Mar 2021 12:50:27 +0000 (UTC)
Message-Id: <cf80056f5b946572ad98aea9d915dd25b23beda6.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 17/41] powerpc/32: Add vmap_stack_overflow label inside the
 macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:27 +0000 (UTC)
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

For consistency, add in the macro the label used by exception prolog
to branch to stack overflow processing.

While at it, enclose the macro in #ifdef CONFIG_VMAP_STACK on the 8xx
as already done on book3s/32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        | 3 ++-
 arch/powerpc/kernel/head_8xx.S       | 3 ++-
 arch/powerpc/kernel/head_book3s_32.S | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 15c6fc7cbbf5..d97ec94b34da 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -52,7 +52,7 @@
 1:
 #ifdef CONFIG_VMAP_STACK
 	mtcrf	0x3f, r1
-	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
+	bt	32 - THREAD_ALIGN_SHIFT, vmap_stack_overflow
 #endif
 .endm
 
@@ -196,6 +196,7 @@
 			  ret_from_except)
 
 .macro vmap_stack_overflow_exception
+vmap_stack_overflow:
 #ifdef CONFIG_SMP
 	mfspr	r1, SPRN_SPRG_THREAD
 	lwz	r1, TASK_CPU - THREAD(r1)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index cdbfa9d41353..b63445c55f4d 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -338,8 +338,9 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
-stack_overflow:
+#ifdef CONFIG_VMAP_STACK
 	vmap_stack_overflow_exception
+#endif
 
 /* On the MPC8xx, these next four traps are used for development
  * support of breakpoints and such.  Someday I will get around to
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 1cf7bd5d5ec1..79a7715fadde 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -732,7 +732,6 @@ fast_hash_page_return:
 #endif /* CONFIG_PPC_BOOK3S_604 */
 
 #ifdef CONFIG_VMAP_STACK
-stack_overflow:
 	vmap_stack_overflow_exception
 #endif
 
-- 
2.25.0

