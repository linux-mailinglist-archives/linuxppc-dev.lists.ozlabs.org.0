Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B42960AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 16:08:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH8NH65gxzDqd2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 01:08:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH8KN2rTYzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 01:05:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CH8K54y6wz9vBJk;
 Thu, 22 Oct 2020 16:05:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Kg6bZPMRYehR; Thu, 22 Oct 2020 16:05:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CH8K535WMz9vBJj;
 Thu, 22 Oct 2020 16:05:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 061C48B816;
 Thu, 22 Oct 2020 16:05:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k5jpwr9JFZVo; Thu, 22 Oct 2020 16:05:46 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A1DD8B805;
 Thu, 22 Oct 2020 16:05:46 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 246D76680D; Thu, 22 Oct 2020 14:05:46 +0000 (UTC)
Message-Id: <348c2d3f19ffcff8abe50d52513f989c4581d000.1603375524.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/bitops: Fix possible undefined behaviour with fls()
 and fls64()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jakub@redhat.com, segher@kernel.crashing.org
Date: Thu, 22 Oct 2020 14:05:46 +0000 (UTC)
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

fls() and fls64() are using __builtin_ctz() and _builtin_ctzll().
On powerpc, those builtins trivially use ctlzw and ctlzd power
instructions.

Allthough those instructions provide the expected result with
input argument 0, __builtin_ctz() and __builtin_ctzll() are
documented as undefined for value 0.

The easiest fix would be to use fls() and fls64() functions
defined in include/asm-generic/bitops/builtin-fls.h and
include/asm-generic/bitops/fls64.h, but GCC output is not optimal:

00000388 <testfls>:
 388:   2c 03 00 00     cmpwi   r3,0
 38c:   41 82 00 10     beq     39c <testfls+0x14>
 390:   7c 63 00 34     cntlzw  r3,r3
 394:   20 63 00 20     subfic  r3,r3,32
 398:   4e 80 00 20     blr
 39c:   38 60 00 00     li      r3,0
 3a0:   4e 80 00 20     blr

000003b0 <testfls64>:
 3b0:   2c 03 00 00     cmpwi   r3,0
 3b4:   40 82 00 1c     bne     3d0 <testfls64+0x20>
 3b8:   2f 84 00 00     cmpwi   cr7,r4,0
 3bc:   38 60 00 00     li      r3,0
 3c0:   4d 9e 00 20     beqlr   cr7
 3c4:   7c 83 00 34     cntlzw  r3,r4
 3c8:   20 63 00 20     subfic  r3,r3,32
 3cc:   4e 80 00 20     blr
 3d0:   7c 63 00 34     cntlzw  r3,r3
 3d4:   20 63 00 40     subfic  r3,r3,64
 3d8:   4e 80 00 20     blr

When the input of fls(x) is a constant, just check x for nullity and
return either 0 or __builtin_clz(x). Otherwise, use cntlzw instruction
directly.

For fls64() on PPC64, do the same but with __builtin_clzll() and
cntlzd instruction. On PPC32, lets take the generic fls64() which
will use our fls(). The result is as expected:

00000388 <testfls>:
 388:   7c 63 00 34     cntlzw  r3,r3
 38c:   20 63 00 20     subfic  r3,r3,32
 390:   4e 80 00 20     blr

000003a0 <testfls64>:
 3a0:   2c 03 00 00     cmpwi   r3,0
 3a4:   40 82 00 10     bne     3b4 <testfls64+0x14>
 3a8:   7c 83 00 34     cntlzw  r3,r4
 3ac:   20 63 00 20     subfic  r3,r3,32
 3b0:   4e 80 00 20     blr
 3b4:   7c 63 00 34     cntlzw  r3,r3
 3b8:   20 63 00 40     subfic  r3,r3,64
 3bc:   4e 80 00 20     blr

Fixes: 2fcff790dcb4 ("powerpc: Use builtin functions for fls()/__fls()/fls64()")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bitops.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 4a4d3afd5340..299ab33505a6 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -216,15 +216,34 @@ static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
  */
 static inline int fls(unsigned int x)
 {
-	return 32 - __builtin_clz(x);
+	int lz;
+
+	if (__builtin_constant_p(x))
+		return x ? 32 - __builtin_clz(x) : 0;
+	asm("cntlzw %0,%1" : "=r" (lz) : "r" (x));
+	return 32 - lz;
 }
 
 #include <asm-generic/bitops/builtin-__fls.h>
 
+/*
+ * 64-bit can do this using one cntlzd (count leading zeroes doubleword)
+ * instruction; for 32-bit we use the generic version, which does two
+ * 32-bit fls calls.
+ */
+#ifdef CONFIG_PPC64
 static inline int fls64(__u64 x)
 {
-	return 64 - __builtin_clzll(x);
+	int lz;
+
+	if (__builtin_constant_p(x))
+		return x ? 64 - __builtin_clzll(x) : 0;
+	asm("cntlzd %0,%1" : "=r" (lz) : "r" (x));
+	return 64 - lz;
 }
+#else
+#include <asm-generic/bitops/fls64.h>
+#endif
 
 #ifdef CONFIG_PPC64
 unsigned int __arch_hweight8(unsigned int w);
-- 
2.25.0

