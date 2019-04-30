Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C5F92E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:46:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44th994983zDqRD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KHaAJM/B"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0b25r3zDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:38:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0V1kCTz9vD34;
 Tue, 30 Apr 2019 14:38:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KHaAJM/B; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V42lv4lB54r6; Tue, 30 Apr 2019 14:38:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0V0hwDz9vD30;
 Tue, 30 Apr 2019 14:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627930; bh=oZo26ga/N5W1sRlZ0takIa9iByo0b9ucIXy3EOdsTD0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=KHaAJM/Bdnb0m9FjgQ/tJ0FsxQew7/rnD4BxoO4doKbBYfWULxsWeu09YUZxT+sgZ
 K4l9BSdZfCjnAOo/utin+R6QkGprrrfQMghPUfd8mM7CdzfPZywzoF1BPb2mCs9eww
 jv2V1NIhJn0q+z5Z5OnZSpzaaZ6BBA7K4XIj1skc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 717DA8B8DF;
 Tue, 30 Apr 2019 14:38:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zZGlvv43sQTX; Tue, 30 Apr 2019 14:38:51 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BDC88B8C2;
 Tue, 30 Apr 2019 14:38:51 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 27C20666F8; Tue, 30 Apr 2019 12:38:51 +0000 (UTC)
Message-Id: <d1626649502f7cbbbb3a2b04397c6c7a0ca1d592.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 02/16] powerpc/32: move LOAD_MSR_KERNEL() into head_32.h
 and use it
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:38:51 +0000 (UTC)
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

As preparation for using head_32.h for head_40x.S, move
LOAD_MSR_KERNEL() there and use it to load r10 with MSR_KERNEL value.

In the mean time, this patch modifies it so that it takes into account
the size of the passed value to determine if 'li' can be used or if
'lis/ori' is needed instead of using the size of MSR_KERNEL. This is
done by using gas macro.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S |  9 +--------
 arch/powerpc/kernel/head_32.h  | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 2f3d159c11d7..d0cea3deb86c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -38,14 +38,7 @@
 #include <asm/barrier.h>
 #include <asm/kup.h>
 
-/*
- * MSR_KERNEL is > 0x10000 on 4xx/Book-E since it include MSR_CE.
- */
-#if MSR_KERNEL >= 0x10000
-#define LOAD_MSR_KERNEL(r, x)	lis r,(x)@h; ori r,r,(x)@l
-#else
-#define LOAD_MSR_KERNEL(r, x)	li r,(x)
-#endif
+#include "head_32.h"
 
 /*
  * Align to 4k in order to ensure that all functions modyfing srr0/srr1
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 7456e2a45acc..cf3d00844597 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -5,6 +5,19 @@
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 
 /*
+ * MSR_KERNEL is > 0x8000 on 4xx/Book-E since it include MSR_CE.
+ */
+.macro __LOAD_MSR_KERNEL r, x
+.if \x >= 0x8000
+	lis \r, (\x)@h
+	ori \r, \r, (\x)@l
+.else
+	li \r, (\x)
+.endif
+.endm
+#define LOAD_MSR_KERNEL(r, x) __LOAD_MSR_KERNEL r, x
+
+/*
  * Exception entry code.  This code runs with address translation
  * turned off, i.e. using physical addresses.
  * We assume sprg3 has the physical address of the current
@@ -89,7 +102,7 @@
 #define EXC_XFER_TEMPLATE(n, hdlr, trap, copyee, tfer, ret)	\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
-	li	r10,MSR_KERNEL;					\
+	LOAD_MSR_KERNEL(r10, MSR_KERNEL);			\
 	copyee(r10, r9);					\
 	bl	tfer;						\
 i##n:								\
-- 
2.13.3

