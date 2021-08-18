Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9478F3EFF7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqM3z3t5Fz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 18:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqM3Z0Jwwz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 18:47:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GqM3P68l9z9sVb;
 Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8s1-bV9JJ4yX; Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GqM3P57Fnz9sVX;
 Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 911538B7E6;
 Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qN7yykVfqkMP; Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56D0C8B7E5;
 Wed, 18 Aug 2021 10:47:29 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EC7E26694E; Wed, 18 Aug 2021 08:47:28 +0000 (UTC)
Message-Id: <c04cce578b97a76a9e69a096698b1d89f721768a.1629276437.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Remove unneccessary calculations in
 load_up_{fpu/altivec}
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 18 Aug 2021 08:47:28 +0000 (UTC)
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

No need to re-read SPRN_THREAD, we can calculate thread address
from current (r2).

And remove a reload of value 1 into r4 as r4 is already 1.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/fpu.S    | 3 +--
 arch/powerpc/kernel/vector.S | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 6010adcee16e..ba4afe3b5a9c 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -91,8 +91,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	isync
 	/* enable use of FP after return */
 #ifdef CONFIG_PPC32
-	mfspr	r5,SPRN_SPRG_THREAD	/* current task's THREAD (phys) */
-	tovirt(r5, r5)
+	addi	r5,r2,THREAD
 	lwz	r4,THREAD_FPEXC_MODE(r5)
 	ori	r9,r9,MSR_FP		/* enable FP for current */
 	or	r9,r9,r4
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index fc120fac1910..ba03eedfdcd8 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -65,9 +65,8 @@ _GLOBAL(load_up_altivec)
 1:
 	/* enable use of VMX after return */
 #ifdef CONFIG_PPC32
-	mfspr	r5,SPRN_SPRG_THREAD		/* current task's THREAD (phys) */
+	addi	r5,r2,THREAD
 	oris	r9,r9,MSR_VEC@h
-	tovirt(r5, r5)
 #else
 	ld	r4,PACACURRENT(r13)
 	addi	r5,r4,THREAD		/* Get THREAD */
@@ -81,7 +80,6 @@ _GLOBAL(load_up_altivec)
 	li	r4,1
 	stb	r4,THREAD_LOAD_VEC(r5)
 	addi	r6,r5,THREAD_VRSTATE
-	li	r4,1
 	li	r10,VRSTATE_VSCR
 	stw	r4,THREAD_USED_VR(r5)
 	lvx	v0,r10,r6
-- 
2.25.0

