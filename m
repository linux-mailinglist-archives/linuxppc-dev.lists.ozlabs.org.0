Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E9358888
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQHz5GH2z3bqn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFQ58mcz3bVG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFL3L24z9txf4;
 Thu,  8 Apr 2021 17:30:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id a1O7rQ9ikjG7; Thu,  8 Apr 2021 17:30:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFL2bzRz9txf2;
 Thu,  8 Apr 2021 17:30:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB5628B7D4;
 Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0-vyeLuL-FWw; Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3508B7D1;
 Thu,  8 Apr 2021 17:30:31 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 35627679BA; Thu,  8 Apr 2021 15:30:31 +0000 (UTC)
Message-Id: <23030822ea5cd0a122948b10226abe56602dc027.1617895813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 7/9] powerpc/mem: Help GCC realise __flush_dcache_icache()
 flushes single pages
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:31 +0000 (UTC)
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

'And' the given page address with PAGE_MASK to help GCC.

With the patch:

	00000024 <__flush_dcache_icache>:
	  24:	54 63 00 26 	rlwinm  r3,r3,0,0,19
	  28:	39 40 00 40 	li      r10,64
	  2c:	7c 69 1b 78 	mr      r9,r3
	  30:	7d 49 03 a6 	mtctr   r10
	  34:	7c 00 48 6c 	dcbst   0,r9
	  38:	39 29 00 20 	addi    r9,r9,32
	  3c:	7c 00 48 6c 	dcbst   0,r9
	  40:	39 29 00 20 	addi    r9,r9,32
	  44:	42 00 ff f0 	bdnz    34 <__flush_dcache_icache+0x10>
	  48:	7c 00 04 ac 	hwsync
	  4c:	39 20 00 40 	li      r9,64
	  50:	7d 29 03 a6 	mtctr   r9
	  54:	7c 00 1f ac 	icbi    0,r3
	  58:	38 63 00 20 	addi    r3,r3,32
	  5c:	7c 00 1f ac 	icbi    0,r3
	  60:	38 63 00 20 	addi    r3,r3,32
	  64:	42 00 ff f0 	bdnz    54 <__flush_dcache_icache+0x30>
	  68:	7c 00 04 ac 	hwsync
	  6c:	4c 00 01 2c 	isync
	  70:	4e 80 00 20 	blr

Without the patch:

	00000024 <__flush_dcache_icache>:
	  24:	54 6a 00 34 	rlwinm  r10,r3,0,0,26
	  28:	39 23 10 1f 	addi    r9,r3,4127
	  2c:	7d 2a 48 50 	subf    r9,r10,r9
	  30:	55 29 d9 7f 	rlwinm. r9,r9,27,5,31
	  34:	41 82 00 94 	beq     c8 <__flush_dcache_icache+0xa4>
	  38:	71 28 00 01 	andi.   r8,r9,1
	  3c:	38 c9 ff ff 	addi    r6,r9,-1
	  40:	7d 48 53 78 	mr      r8,r10
	  44:	7d 27 4b 78 	mr      r7,r9
	  48:	40 82 00 6c 	bne     b4 <__flush_dcache_icache+0x90>
	  4c:	54 e7 f8 7e 	rlwinm  r7,r7,31,1,31
	  50:	7c e9 03 a6 	mtctr   r7
	  54:	7c 00 40 6c 	dcbst   0,r8
	  58:	39 08 00 20 	addi    r8,r8,32
	  5c:	7c 00 40 6c 	dcbst   0,r8
	  60:	39 08 00 20 	addi    r8,r8,32
	  64:	42 00 ff f0 	bdnz    54 <__flush_dcache_icache+0x30>
	  68:	7c 00 04 ac 	hwsync
	  6c:	71 28 00 01 	andi.   r8,r9,1
	  70:	39 09 ff ff 	addi    r8,r9,-1
	  74:	40 82 00 2c 	bne     a0 <__flush_dcache_icache+0x7c>
	  78:	55 29 f8 7e 	rlwinm  r9,r9,31,1,31
	  7c:	7d 29 03 a6 	mtctr   r9
	  80:	7c 00 57 ac 	icbi    0,r10
	  84:	39 4a 00 20 	addi    r10,r10,32
	  88:	7c 00 57 ac 	icbi    0,r10
	  8c:	39 4a 00 20 	addi    r10,r10,32
	  90:	42 00 ff f0 	bdnz    80 <__flush_dcache_icache+0x5c>
	  94:	7c 00 04 ac 	hwsync
	  98:	4c 00 01 2c 	isync
	  9c:	4e 80 00 20 	blr
	  a0:	7c 00 57 ac 	icbi    0,r10
	  a4:	2c 08 00 00 	cmpwi   r8,0
	  a8:	39 4a 00 20 	addi    r10,r10,32
	  ac:	40 82 ff cc 	bne     78 <__flush_dcache_icache+0x54>
	  b0:	4b ff ff e4 	b       94 <__flush_dcache_icache+0x70>
	  b4:	7c 00 50 6c 	dcbst   0,r10
	  b8:	2c 06 00 00 	cmpwi   r6,0
	  bc:	39 0a 00 20 	addi    r8,r10,32
	  c0:	40 82 ff 8c 	bne     4c <__flush_dcache_icache+0x28>
	  c4:	4b ff ff a4 	b       68 <__flush_dcache_icache+0x44>
	  c8:	7c 00 04 ac 	hwsync
	  cc:	7c 00 04 ac 	hwsync
	  d0:	4c 00 01 2c 	isync
	  d4:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/cacheflush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 2d92cb6bc423..abeef69ed4e4 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -145,7 +145,7 @@ EXPORT_SYMBOL(flush_dcache_page);
  */
 static void __flush_dcache_icache(void *p)
 {
-	unsigned long addr = (unsigned long)p;
+	unsigned long addr = (unsigned long)p & PAGE_MASK;
 
 	clean_dcache_range(addr, addr + PAGE_SIZE);
 
-- 
2.25.0

