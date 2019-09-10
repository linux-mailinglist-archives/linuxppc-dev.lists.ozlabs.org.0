Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D36AE6F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:30:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SKWX0xNRzDrBl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mehlS9yO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SKDg6BpCzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 19:17:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SKDY1QFRz9txWD;
 Tue, 10 Sep 2019 11:17:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mehlS9yO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CJDhCwFp9eEg; Tue, 10 Sep 2019 11:17:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SKDY0NzGz9txW2;
 Tue, 10 Sep 2019 11:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568107037; bh=mTnSd5K48HUvkTFKOuCKJIWuBpZFeLQZSv1zWTZ0KFQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=mehlS9yOkzdzZGbhUI3YXYnb0EZmc5cw/zlnMff2KRNVjwsQ7JjxjXlRaoBOyg5bj
 lHNHrOK6JtRcNSF3il6suaMq1AQNN0QJve94ejDjU9gqb7yI/sZnZGT/etO5zd+xOP
 NRWAE2qaJTl5TfbN6/JvM293Iv6wGTMXBehGo1kc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D6FE38B880;
 Tue, 10 Sep 2019 11:17:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R3WPsqFaJEFb; Tue, 10 Sep 2019 11:17:15 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E7218B899;
 Tue, 10 Sep 2019 11:16:31 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4D4106B739; Tue, 10 Sep 2019 09:16:31 +0000 (UTC)
Message-Id: <1d8d2a762115ca6c5700a33a1d782a975c886a4a.1568106758.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1568106758.git.christophe.leroy@c-s.fr>
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 12/15] powerpc/8xx: split breakpoint exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Tue, 10 Sep 2019 09:16:31 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Breakpoint exception is big.

Split it to support future growth on exception prolog.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 1e718e47fe3c..225e242ce1c5 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -490,14 +490,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
  * support of breakpoints and such.  Someday I will get around to
  * using them.
  */
-	. = 0x1c00
-DataBreakpoint:
-	EXCEPTION_PROLOG_0
-	mfspr	r11, SPRN_SRR0
-	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
-	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
-	beq-	cr1, 11f
-	beq-	cr7, 11f
+do_databreakpoint:
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -505,7 +498,15 @@ DataBreakpoint:
 	stw	r4,_DAR(r11)
 	mfspr	r5,SPRN_DSISR
 	EXC_XFER_STD(0x1c00, do_break)
-11:
+
+	. = 0x1c00
+DataBreakpoint:
+	EXCEPTION_PROLOG_0
+	mfspr	r11, SPRN_SRR0
+	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
+	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
+	cror	4*cr1+eq, 4*cr1+eq, 4*cr7+eq
+	bne	cr1, do_databreakpoint
 	mtcr	r10
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	mfspr	r11, SPRN_SPRG_SCRATCH1
-- 
2.13.3

