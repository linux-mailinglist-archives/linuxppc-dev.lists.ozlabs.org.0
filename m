Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AC150E10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 17:50:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDN14PmCzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 03:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=UjiGo/TP; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDJx186kzDq6B
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 03:47:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48BDJm0L6Zz9vBnS;
 Mon,  3 Feb 2020 17:47:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UjiGo/TP; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DOO-4TdMqxFC; Mon,  3 Feb 2020 17:47:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48BDJl6Rqrz9vBnH;
 Mon,  3 Feb 2020 17:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580748455; bh=vvTMn3v7C5AvjARDFgAcHr2XgNLNjS1AjFV1Ob4WJ98=;
 h=From:Subject:To:Cc:Date:From;
 b=UjiGo/TPZTh8ApBh3br6yA3ywoAEdftFa0DhDduKyAwKYh/1mB/zzThLvJ/WPSooX
 H8itmeaoa4MIoxtcmx0Lhracs3VK1psJXfFrNb/JM21QjL/KRPH3B2zQeOTX8pXzBW
 aZLCp3R1hO/O28fcWTPluFXbyHI5dKo9jLvVIff8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 657798B7B5;
 Mon,  3 Feb 2020 17:47:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2YQbN13zgr-R; Mon,  3 Feb 2020 17:47:40 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 61D658B7AC;
 Mon,  3 Feb 2020 17:47:38 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E721665299; Mon,  3 Feb 2020 16:47:37 +0000 (UTC)
Message-Id: <12f4f4f0ff89aeab3b937fc96c84fb35e1b2517e.1580748445.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: Slenderize _tlbia() for powerpc 603/603e
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  3 Feb 2020 16:47:37 +0000 (UTC)
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

_tlbia() is a function used only on 603/603e core, ie on CPUs which
don't have a hash table.

_tlbia() uses the tlbia macro which implements a loop of 1024 tlbie.

On the 603/603e core, flushing the entire TLB requires no more than
32 tlbie.

Replace tlbia by a loop of 32 tlbie.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/book3s32/hash_low.S | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index c11b0a005196..a5039ad10429 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -696,18 +696,21 @@ _GLOBAL(_tlbia)
 	bne-	10b
 	stwcx.	r8,0,r9
 	bne-	10b
+#endif /* CONFIG_SMP */
+	li	r5, 32
+	lis	r4, KERNELBASE@h
+	mtctr	r5
 	sync
-	tlbia
+0:	tlbie	r4
+	addi	r4, r4, 0x1000
+	bdnz	0b
 	sync
+#ifdef CONFIG_SMP
 	TLBSYNC
 	li	r0,0
 	stw	r0,0(r9)		/* clear mmu_hash_lock */
 	mtmsr	r10
 	SYNC_601
 	isync
-#else /* CONFIG_SMP */
-	sync
-	tlbia
-	sync
 #endif /* CONFIG_SMP */
 	blr
-- 
2.25.0

