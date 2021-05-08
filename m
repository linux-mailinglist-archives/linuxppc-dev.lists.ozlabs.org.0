Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB073770DD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 11:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fchkt1tqxz3093
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 19:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FchkW4cSwz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:25:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FchkN58TWz9sbC;
 Sat,  8 May 2021 11:25:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhezB7fxWmgn; Sat,  8 May 2021 11:25:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FchkN4FGCz9sZs;
 Sat,  8 May 2021 11:25:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 736498B774;
 Sat,  8 May 2021 11:25:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DxA6PDEBwgZ9; Sat,  8 May 2021 11:25:32 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FB708B76B;
 Sat,  8 May 2021 11:25:32 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 0C01E64921; Sat,  8 May 2021 09:25:32 +0000 (UTC)
Message-Id: <cf0a050d124d4f426cdc7a74009d17b01d8d8969.1620465917.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/uaccess: Fix __get_user() with
 CONFIG_CC_HAS_ASM_GOTO_OUTPUT
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  8 May 2021 09:25:32 +0000 (UTC)
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

Building kernel mainline with GCC 11 leads to following failure
when starting 'init':

  init[1]: bad frame in sys_sigreturn: 7ff5a900 nip 001083cc lr 001083c4
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

This is an issue due to a segfault happening in
__unsafe_restore_general_regs() in a loop copying registers from user
to kernel:

  10:	7d 09 03 a6 	mtctr   r8
  14:	80 ca 00 00 	lwz     r6,0(r10)
  18:	80 ea 00 04 	lwz     r7,4(r10)
  1c:	90 c9 00 08 	stw     r6,8(r9)
  20:	90 e9 00 0c 	stw     r7,12(r9)
  24:	39 0a 00 08 	addi    r8,r10,8
  28:	39 29 00 08 	addi    r9,r9,8
  2c:	81 4a 00 08 	lwz     r10,8(r10)  <== r10 is clobbered here
  30:	81 6a 00 0c 	lwz     r11,12(r10)
  34:	91 49 00 08 	stw     r10,8(r9)
  38:	91 69 00 0c 	stw     r11,12(r9)
  3c:	39 48 00 08 	addi    r10,r8,8
  40:	39 29 00 08 	addi    r9,r9,8
  44:	42 00 ff d0 	bdnz    14 <__unsafe_restore_general_regs+0x14>

As shown above, this is due to r10 being re-used by GCC. This didn't
happen with CLANG.

This is fixed by tagging 'x' output as an earlyclobber operand in
__get_user_asm2_goto().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a09e4240c5b1..22c79ab40006 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -157,7 +157,7 @@ do {								\
 		"2:	lwz%X1 %L0, %L1\n"			\
 		EX_TABLE(1b, %l2)				\
 		EX_TABLE(2b, %l2)				\
-		: "=r" (x)					\
+		: "=&r" (x)					\
 		: "m" (*addr)					\
 		:						\
 		: label)
-- 
2.25.0

