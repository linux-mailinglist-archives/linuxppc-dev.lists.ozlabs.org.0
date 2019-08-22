Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD399995
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrD16MQxzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="m4WJfXGn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DqqS5Sg3zDrTn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:34:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DqqL5lNlz9v0dB;
 Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=m4WJfXGn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bQQg-wQqxWHp; Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DqqL4jdtz9v0d3;
 Thu, 22 Aug 2019 18:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566491646; bh=5X4xGPq76Yjs7iqAd5pIOR5w/Qi99LQNgtHRn1BqbPg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=m4WJfXGnCYOnXEsH6yQ2OkoHFt/vhNA7xyucFeH3S+Gqzz/hPDSj2EhMoVl38SuIg
 4S0hnbgqlHmL2rCqkQTrZwz5SLDDOR4A3yFC7cIjUZh525ATdEmGeeeeKifQomG1GM
 Qadac7Et7hr+7EgLdhmgeF2va2K3mK3Unply/VEA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FE018B84C;
 Thu, 22 Aug 2019 18:34:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2p-c5YU_99yN; Thu, 22 Aug 2019 18:34:08 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31C628B81D;
 Thu, 22 Aug 2019 18:34:08 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 048116B730; Thu, 22 Aug 2019 16:34:08 +0000 (UTC)
Message-Id: <4f50625ad02d68cb7fe7aaf012a62038192b8bb3.1566491310.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566491310.git.christophe.leroy@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 7/8] powerpc/vdso32: implement clock_getres entirely
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 16:34:08 +0000 (UTC)
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

clock_getres returns hrtimer_res for all clocks but coarse ones
for which it returns KTIME_LOW_RES.

return EINVAL for unknown clocks.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/asm-offsets.c         |  3 +++
 arch/powerpc/kernel/vdso32/gettimeofday.S | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b6328a90cad7..dbfd3ddc85dc 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -417,7 +417,10 @@ int main(void)
 	DEFINE(CLOCK_MONOTONIC, CLOCK_MONOTONIC);
 	DEFINE(CLOCK_REALTIME_COARSE, CLOCK_REALTIME_COARSE);
 	DEFINE(CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC_COARSE);
+	DEFINE(CLOCK_MAX, CLOCK_TAI);
 	DEFINE(NSEC_PER_SEC, NSEC_PER_SEC);
+	DEFINE(EINVAL, EINVAL);
+	DEFINE(KTIME_LOW_RES, KTIME_LOW_RES);
 
 #ifdef CONFIG_BUG
 	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index 0f87be0ebf7e..c65f41c612f7 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -199,17 +199,20 @@ V_FUNCTION_END(__kernel_clock_gettime)
 V_FUNCTION_BEGIN(__kernel_clock_getres)
   .cfi_startproc
 	/* Check for supported clock IDs */
-	cmpwi	cr0,r3,CLOCK_REALTIME
-	cmpwi	cr1,r3,CLOCK_MONOTONIC
-	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
-	bne	cr0,99f
+	cmplwi	cr0, r3, CLOCK_MAX
+	cmpwi	cr1, r3, CLOCK_REALTIME_COARSE
+	cmpwi	cr7, r3, CLOCK_MONOTONIC_COARSE
+	bgt	cr0, 99f
+	LOAD_REG_IMMEDIATE(r5, KTIME_LOW_RES)
+	beq	cr1, 1f
+	beq	cr7, 1f
 
 	mflr	r12
   .cfi_register lr,r12
 	get_datapage	r3, r0
 	lwz	r5, CLOCK_HRTIMER_RES(r3)
 	mtlr	r12
-	li	r3,0
+1:	li	r3,0
 	cmpli	cr0,r4,0
 	crclr	cr0*4+so
 	beqlr
@@ -218,11 +221,11 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 	blr
 
 	/*
-	 * syscall fallback
+	 * invalid clock
 	 */
 99:
-	li	r0,__NR_clock_getres
-	sc
+	li	r3, EINVAL
+	crset	so
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_clock_getres)
-- 
2.13.3

