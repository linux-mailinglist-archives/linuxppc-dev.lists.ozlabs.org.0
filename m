Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E028E2C3A04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:23:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgsmt0FjZzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:23:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgsVm5hxSzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:10:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgsVf5f0Tz9tx2F;
 Wed, 25 Nov 2020 08:10:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vR-OnXzKk34P; Wed, 25 Nov 2020 08:10:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgsVf4WhYz9tyqP;
 Wed, 25 Nov 2020 08:10:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 810618B7C2;
 Wed, 25 Nov 2020 08:10:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id S9lQvPmiuIZR; Wed, 25 Nov 2020 08:10:51 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48E508B7B7;
 Wed, 25 Nov 2020 08:10:51 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 2AC9F668BA; Wed, 25 Nov 2020 07:10:51 +0000 (UTC)
Message-Id: <c0f16cf432d22fc80097264d94649460d3dd761d.1606285014.git.christophe.leroy@csgroup.eu>
In-Reply-To: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
References: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 6/8] powerpc/32: Simplify EXCEPTION_PROLOG_1 macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 25 Nov 2020 07:10:51 +0000 (UTC)
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

Make code more readable with a clear CONFIG_VMAP_STACK
section and a clear non CONFIG_VMAP_STACK section.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 7c767765071d..5e3393122d29 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -46,18 +46,16 @@
 	mfspr	r1,SPRN_SPRG_THREAD
 	lwz	r1,TASK_STACK-THREAD(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
+1:
+	mtcrf	0x7f, r1
+	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
 #else
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,TASK_STACK-THREAD(r11)
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-#endif
-1:
-	tophys_novmstack r11, r11
-#ifdef CONFIG_VMAP_STACK
-	mtcrf	0x7f, r1
-	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
+1:	tophys(r11, r11)
 #endif
 .endm
 
-- 
2.25.0

