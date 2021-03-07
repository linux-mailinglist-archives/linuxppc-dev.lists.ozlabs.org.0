Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4350C32FEB3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 06:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtV636B2Bz3dCt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 16:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=HqHsPJvr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--maskray.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3pgfeyackdbkbzh9gzn5dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--maskray.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HqHsPJvr; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtV5b1chJz30M9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 16:14:41 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b127so8290344ybc.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Mar 2021 21:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=WJiB9dl71l/TjVCBFVP2J9zHhd24ZHwnIvXPdaQCFZY=;
 b=HqHsPJvrkUj5j04KeFl9vZy3iGpnxQOY3ziwzKL3IXZ31Tgju2LCRkQeqvQ0lmiXyi
 lRCQVJzgI2mLiUT5hYgXafkjlvbEQD3svPn1Z+mbUQkwcg8wj6k/sYiknIaIFpI92lWw
 zsEHMMWre7s2yCgGu2OLxnxtbYSQl63id5YTrualccELHkB+zDavmUQ3edsMYRBhmuwL
 a6R23RxggRFes6ZgDk5wO4XpU1RetJOMjOexuLM0dO8Ll6bTx8E5ljEcRMOM/axn5LKI
 1HAKnwDIOnOlFY26dfD3w6mTo/4fapDOKJswHcmT3EsUZWF9DXw9NKt4e+3ZW7/7y0Wg
 TTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=WJiB9dl71l/TjVCBFVP2J9zHhd24ZHwnIvXPdaQCFZY=;
 b=kxoBNW02mAuMFxFaPvYSp5Q1kTHyNxqnOZkEKFAuXkXM/PJBzeSNTbQg0W3VCWDHIO
 Bp+21jnA9+X6FT9g9WD6qo0QaNR8skPlcZxmaf5kkTJ997XAixoXk2SNZutewYj0iLgN
 sJUcphMbQOe31uaemmZ25SsIwLdEL37J9HRId60MJr8AJUEFc9MNDP/VviqmmDQLZj7v
 nAMw9fNBJhf9LHtR9Oxdgu/0Wo+wxeIEeqoWiklSA7VmRuBEGxiiDW1Uw7XPA6eJFAGc
 y3T3T3aTmhG4hTE5WbnV+fZGa5X/GoqDoySem5sHZlPbaGo+FN7iWBJqqWzPe3s9EQ5m
 rzlQ==
X-Gm-Message-State: AOAM531sPObE9CgSAHulN2dxBvrdugNJuyqsx1xCDk4+Ce+IZDJCSs2x
 nUViWcGm+maOK+0kB5UX1jL+7uva0GG5
X-Google-Smtp-Source: ABdhPJzs26sD6VqREDeu5WrFROEjBQ9ktES24L7dgdDRKwum6qooTvs5F8n41hy0wHH+NLPNXhhPKOUB5unL
X-Received: from maskray1.svl.corp.google.com
 ([2620:15c:2ce:0:5cbf:1a9f:3f48:ea77])
 (user=maskray job=sendgmr) by 2002:a25:38d6:: with SMTP id
 f205mr25328159yba.448.1615094076144; Sat, 06 Mar 2021 21:14:36 -0800 (PST)
Date: Sat,  6 Mar 2021 21:14:33 -0800
Message-Id: <20210307051433.2756645-1-maskray@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] Replace __toc_start + 0x8000 with .TOC.
From: Fangrui Song <maskray@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TOC relocations are like GOT relocations on other architectures.
However, unlike other architectures, GNU ld's ppc64 port defines .TOC.
relative to the .got output section instead of the linker synthesized
.got input section. LLD defines .TOC. as the .got input section plus
0x8000. When CONFIG_PPC_OF_BOOT_TRAMPOLINE=y,
arch/powerpc/kernel/prom_init.o is built, and LLD computed .TOC. can be
different from __toc_start defined by the linker script.

Simplify kernel_toc_addr with asm label .TOC. so that we can get rid of
__toc_start.

With this change, powernv_defconfig with CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
is bootable with LLD. There is still an untriaged issue with Alexey's
configuration.

Link: https://github.com/ClangBuiltLinux/linux/issues/1318
Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/powerpc/boot/crt0.S            |  2 +-
 arch/powerpc/boot/zImage.lds.S      |  1 -
 arch/powerpc/include/asm/sections.h | 10 ++--------
 arch/powerpc/kernel/head_64.S       |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S   |  1 -
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 1d83966f5ef6..e45907fe468f 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -28,7 +28,7 @@ p_etext:	.8byte	_etext
 p_bss_start:	.8byte	__bss_start
 p_end:		.8byte	_end
 
-p_toc:		.8byte	__toc_start + 0x8000 - p_base
+p_toc:		.8byte	.TOC. - p_base
 p_dyn:		.8byte	__dynamic_start - p_base
 p_rela:		.8byte	__rela_dyn_start - p_base
 p_prom:		.8byte	0
diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index d6f072865627..32cf7816292f 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -39,7 +39,6 @@ SECTIONS
   . = ALIGN(256);
   .got :
   {
-    __toc_start = .;
     *(.got)
     *(.toc)
   }
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 324d7b298ec3..bd22ca0b5eca 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -48,14 +48,8 @@ static inline int in_kernel_text(unsigned long addr)
 
 static inline unsigned long kernel_toc_addr(void)
 {
-	/* Defined by the linker, see vmlinux.lds.S */
-	extern unsigned long __toc_start;
-
-	/*
-	 * The TOC register (r2) points 32kB into the TOC, so that 64kB of
-	 * the TOC can be addressed using a single machine instruction.
-	 */
-	return (unsigned long)(&__toc_start) + 0x8000UL;
+	extern unsigned long toc asm(".TOC.");
+	return (unsigned long)(&toc);
 }
 
 static inline int overlaps_interrupt_vector_text(unsigned long start,
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..9542d03b2efe 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -899,7 +899,7 @@ _GLOBAL(relative_toc)
 	blr
 
 .balign 8
-p_toc:	.8byte	__toc_start + 0x8000 - 0b
+p_toc:	.8byte	.TOC. - 0b
 
 /*
  * This is where the main kernel code starts.
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 72fa3c00229a..c28f4e5bae3f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -328,7 +328,6 @@ SECTIONS
 
 	. = ALIGN(256);
 	.got : AT(ADDR(.got) - LOAD_OFFSET) {
-		__toc_start = .;
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
 		arch/powerpc/kernel/prom_init.o*(.toc .got)
-- 
2.30.1.766.gb4fecdf3b7-goog

