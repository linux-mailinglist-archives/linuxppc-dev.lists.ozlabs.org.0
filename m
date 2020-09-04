Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E702E25D6F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 13:03:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjZXj2nJ2zDr9T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 21:03:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjZVl2JWszDr45
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 21:01:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BjZVf4YvpzB09bQ;
 Fri,  4 Sep 2020 13:01:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id p6qrsTlmFVgo; Fri,  4 Sep 2020 13:01:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BjZVf2pPlzB09bP;
 Fri,  4 Sep 2020 13:01:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A12548B81C;
 Fri,  4 Sep 2020 13:01:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oo9Efquu5ZWU; Fri,  4 Sep 2020 13:01:31 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 731BC8B81B;
 Fri,  4 Sep 2020 13:01:31 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E4778653FF; Fri,  4 Sep 2020 11:01:30 +0000 (UTC)
Message-Id: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc/uaccess: Switch __put_user_size_allowed() to
 __put_user_asm_goto()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  4 Sep 2020 11:01:30 +0000 (UTC)
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

__put_user_asm_goto() provides more flexibility to GCC and avoids using
a local variable to tell if the write succeeded or not.
GCC can then avoid implementing a cmp in the fast path.

See the difference for a small function like the PPC64 version of
save_general_regs() in arch/powerpc/kernel/signal_32.c:

Before the patch (unreachable nop removed):

0000000000000c10 <.save_general_regs>:
     c10:	39 20 00 2c 	li      r9,44
     c14:	39 40 00 00 	li      r10,0
     c18:	7d 29 03 a6 	mtctr   r9
     c1c:	38 c0 00 00 	li      r6,0
     c20:	48 00 00 14 	b       c34 <.save_general_regs+0x24>
     c30:	42 40 00 40 	bdz     c70 <.save_general_regs+0x60>
     c34:	28 2a 00 27 	cmpldi  r10,39
     c38:	7c c8 33 78 	mr      r8,r6
     c3c:	79 47 1f 24 	rldicr  r7,r10,3,60
     c40:	39 20 00 01 	li      r9,1
     c44:	41 82 00 0c 	beq     c50 <.save_general_regs+0x40>
     c48:	7d 23 38 2a 	ldx     r9,r3,r7
     c4c:	79 29 00 20 	clrldi  r9,r9,32
     c50:	91 24 00 00 	stw     r9,0(r4)
     c54:	2c 28 00 00 	cmpdi   r8,0
     c58:	39 4a 00 01 	addi    r10,r10,1
     c5c:	38 84 00 04 	addi    r4,r4,4
     c60:	41 82 ff d0 	beq     c30 <.save_general_regs+0x20>
     c64:	38 60 ff f2 	li      r3,-14
     c68:	4e 80 00 20 	blr
     c70:	38 60 00 00 	li      r3,0
     c74:	4e 80 00 20 	blr

0000000000000000 <.fixup>:
  cc:	39 00 ff f2 	li      r8,-14
  d0:	48 00 00 00 	b       d0 <.fixup+0xd0>
			d0: R_PPC64_REL24	.text+0xc54

After the patch:

0000000000001490 <.save_general_regs>:
    1490:	39 20 00 2c 	li      r9,44
    1494:	39 40 00 00 	li      r10,0
    1498:	7d 29 03 a6 	mtctr   r9
    149c:	60 00 00 00 	nop
    14a0:	28 2a 00 27 	cmpldi  r10,39
    14a4:	79 48 1f 24 	rldicr  r8,r10,3,60
    14a8:	39 20 00 01 	li      r9,1
    14ac:	41 82 00 0c 	beq     14b8 <.save_general_regs+0x28>
    14b0:	7d 23 40 2a 	ldx     r9,r3,r8
    14b4:	79 29 00 20 	clrldi  r9,r9,32
    14b8:	91 24 00 00 	stw     r9,0(r4)
    14bc:	39 4a 00 01 	addi    r10,r10,1
    14c0:	38 84 00 04 	addi    r4,r4,4
    14c4:	42 00 ff dc 	bdnz    14a0 <.save_general_regs+0x10>
    14c8:	38 60 00 00 	li      r3,0
    14cc:	4e 80 00 20 	blr
    14d0:	38 60 ff f2 	li      r3,-14
    14d4:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a5cfe867fbdc..96d1c144f92b 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -189,14 +189,14 @@ extern long __put_user_bad(void);
 
 #define __put_user_size_allowed(x, ptr, size, retval)		\
 do {								\
+	__label__ __pu_failed;					\
+								\
 	retval = 0;						\
-	switch (size) {						\
-	  case 1: __put_user_asm(x, ptr, retval, "stb"); break;	\
-	  case 2: __put_user_asm(x, ptr, retval, "sth"); break;	\
-	  case 4: __put_user_asm(x, ptr, retval, "stw"); break;	\
-	  case 8: __put_user_asm2(x, ptr, retval); break;	\
-	  default: __put_user_bad();				\
-	}							\
+	__put_user_size_goto(x, ptr, size, __pu_failed);	\
+	break;							\
+								\
+__pu_failed:							\
+	retval = -EFAULT;					\
 } while (0)
 
 #define __put_user_size(x, ptr, size, retval)			\
-- 
2.25.0

