Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19337514C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 11:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbSV02ZKCz3bTm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 19:10:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbSTZ3tb9z300P
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 19:10:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FbSTQ2frfz9sTC;
 Thu,  6 May 2021 11:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84Jh_hPK5OFm; Thu,  6 May 2021 11:10:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FbSTQ1jkgz9sSD;
 Thu,  6 May 2021 11:10:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1748E8B7F1;
 Thu,  6 May 2021 11:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4nw4S1JpHMM8; Thu,  6 May 2021 11:10:02 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA4788B7EC;
 Thu,  6 May 2021 11:10:01 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 99FA564884; Thu,  6 May 2021 09:10:01 +0000 (UTC)
Message-Id: <13f7532f21df3196e8c78b4f82a9c8d5487aca35.1620292185.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Remove m8260_gorom()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 May 2021 09:10:01 +0000 (UTC)
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

Last user of m8260_gorom() was removed by
Commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
removed last user of m8260_gorom().

In fact m8260_gorom() was ported to arch/powerpc/ but the
platform using it died with arch/ppc/

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 36 ----------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index c1d2f0d1d6b2..74296708b35e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1204,42 +1204,6 @@ setup_usbgecko_bat:
 	blr
 #endif
 
-#ifdef CONFIG_8260
-/* Jump into the system reset for the rom.
- * We first disable the MMU, and then jump to the ROM reset address.
- *
- * r3 is the board info structure, r4 is the location for starting.
- * I use this for building a small kernel that can load other kernels,
- * rather than trying to write or rely on a rom monitor that can tftp load.
- */
-       .globl  m8260_gorom
-m8260_gorom:
-	mfmsr	r0
-	rlwinm	r0,r0,0,17,15	/* clear MSR_EE in r0 */
-	sync
-	mtmsr	r0
-	sync
-	mfspr	r11, SPRN_HID0
-	lis	r10, 0
-	ori	r10,r10,HID0_ICE|HID0_DCE
-	andc	r11, r11, r10
-	mtspr	SPRN_HID0, r11
-	isync
-	li	r5, MSR_ME|MSR_RI
-	lis	r6,2f@h
-	addis	r6,r6,-KERNELBASE@h
-	ori	r6,r6,2f@l
-	mtspr	SPRN_SRR0,r6
-	mtspr	SPRN_SRR1,r5
-	isync
-	sync
-	rfi
-2:
-	mtlr	r4
-	blr
-#endif
-
-
 /*
  * We put a few things here that have to be page-aligned.
  * This stuff goes at the beginning of the data segment,
-- 
2.25.0

