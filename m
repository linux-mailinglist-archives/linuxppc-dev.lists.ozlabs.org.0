Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF39CDD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H8Tv1NsgzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 21:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vWgmUTT0"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H8S557zJzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 21:10:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46H8Rt6ZbHz9txrS;
 Mon, 26 Aug 2019 13:10:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vWgmUTT0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id twjE7ihpu2Mt; Mon, 26 Aug 2019 13:10:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46H8Rt5Xp9z9txrL;
 Mon, 26 Aug 2019 13:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566817818; bh=qqSVb+TCi8AfpXpbY++o3dhraON0mTZPXSD6278Vkhg=;
 h=From:Subject:To:Cc:Date:From;
 b=vWgmUTT0GU8qpB03jXyDroaGhL8sjJSI9lJXeIueAMU9/5X1i+SdqvrsL+lEl3QAF
 HqD1VlXag90UFudErDFKDcrFmlW55vvsmyVJbMFlJsl260xk+mzqxb0RrPYOovlNTB
 vKMa2GNhJ1JeSxLYe9M5bqiN2LaMr9r+FBriU2r4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3D278B7DF;
 Mon, 26 Aug 2019 13:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oFm37vKRWa4U; Mon, 26 Aug 2019 13:10:23 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85C4F8B7DE;
 Mon, 26 Aug 2019 13:10:23 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2868D672C3; Mon, 26 Aug 2019 11:10:23 +0000 (UTC)
Message-Id: <cdaf4bbbb64c288a077845846f04b12683f8875a.1566817807.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/prom: convert PROM_BUG() to standard trap
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 11:10:23 +0000 (UTC)
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

Prior to commit 1bd98d7fbaf5 ("ppc64: Update BUG handling based on
ppc32"), BUG() family was using BUG_ILLEGAL_INSTRUCTION which
was an invalid instruction opcode to trap into program check
exception.

That commit converted them to using standard trap instructions,
but prom/prom_init and their PROM_BUG() macro were left over.
head_64.S and exception-64s.S were left aside as well.

Convert them to using the standard BUG infrastructure.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/bug.h       | 8 --------
 arch/powerpc/kernel/exceptions-64s.S | 3 ++-
 arch/powerpc/kernel/head_64.S        | 6 ++++--
 arch/powerpc/kernel/prom_init.c      | 2 +-
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index fed7e6241349..f47e6ff6554d 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -5,14 +5,6 @@
 
 #include <asm/asm-compat.h>
 
-/*
- * Define an illegal instr to trap on the bug.
- * We don't use 0 because that marks the end of a function
- * in the ELF ABI.  That's "Boo Boo" in case you wonder...
- */
-#define BUG_OPCODE .long 0x00b00b00  /* For asm */
-#define BUG_ILLEGAL_INSTR "0x00b00b00" /* For BUG macro */
-
 #ifdef CONFIG_BUG
 
 #ifdef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ba3cc2ef8ab..dded4672579d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1467,7 +1467,8 @@ EXC_COMMON_BEGIN(fp_unavailable_common)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
-	BUG_OPCODE
+0:	trap
+	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 1:
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 91d297e696dd..9a0dd79a2480 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -182,7 +182,8 @@ __secondary_hold:
 	isync
 	bctr
 #else
-	BUG_OPCODE
+0:	trap
+	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 #endif
 CLOSE_FIXED_SECTION(first_256B)
 
@@ -998,7 +999,8 @@ start_here_common:
 	bl	start_kernel
 
 	/* Not reached */
-	BUG_OPCODE
+	trap
+	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 
 /*
  * We put a few things here that have to be page-aligned.
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 514707ef6779..f2b63b4e1943 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -94,7 +94,7 @@ static int of_workarounds __prombss;
 #define PROM_BUG() do {						\
         prom_printf("kernel BUG at %s line 0x%x!\n",		\
 		    __FILE__, __LINE__);			\
-        __asm__ __volatile__(".long " BUG_ILLEGAL_INSTR);	\
+	__builtin_trap();					\
 } while (0)
 
 #ifdef DEBUG_PROM
-- 
2.13.3

