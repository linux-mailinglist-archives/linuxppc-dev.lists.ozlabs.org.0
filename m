Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D21397DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 18:37:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xLPt279szDqGx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 04:37:22 +1100 (AEDT)
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
 header.s=mail header.b=smBvGj76; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKn25dMszDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 04:08:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xKmt35Q3z9v0Y1;
 Mon, 13 Jan 2020 18:08:46 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=smBvGj76; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yShFRHkN_wHb; Mon, 13 Jan 2020 18:08:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmt1vdMz9v0Xy;
 Mon, 13 Jan 2020 18:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578935326; bh=9JszdThPZcrKbLGagNxNFoOFX49AMCE1MJAxuQq15/c=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=smBvGj76nnUT7O2Nerwb6Dkjq6/LDayrszAQt4gYAGJB+rfKJvztU7Yk9aCxFTZM9
 YMw56Fdhnx91BJpdaXwcfImT1m2o4G7CLGwE1sCAphGj+SbPcBphYgtegj1EIJY5cm
 fTnCa3CWZa3EDb6DBUiihGDdLzpRHC+HBoneX+9c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6542F8B7C9;
 Mon, 13 Jan 2020 18:08:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F_EW3T2xMF7m; Mon, 13 Jan 2020 18:08:51 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 231D38B7BE;
 Mon, 13 Jan 2020 18:08:51 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id EBBBC64A1D; Mon, 13 Jan 2020 17:08:50 +0000 (UTC)
Message-Id: <980b880ed9a86342e05cee18e1b2ce66fbe92d4c.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 12/12] powerpc/vdso: provide
 __arch_is_hw_counter_valid()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 13 Jan 2020 17:08:50 +0000 (UTC)
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid a double verification of the hw_counter validity,
provide __arch_is_hw_counter_valid()

Before:
clock-gettime-realtime:    vdso: 1078 nsec/call

After:
clock-gettime-realtime:    vdso: 1064 nsec/call

The * shows the test of the clock type.
The > shows the additional test on the counter,
that goes away with this patch

Before:
 5e0:	81 25 00 04 	lwz     r9,4(r5)
*5e4:	2f 89 00 00 	cmpwi   cr7,r9,0
*5e8:	40 9e 01 3c 	bne     cr7,724 <__c_kernel_clock_gettime+0x17c>
 5ec:	94 21 ff e0 	stwu    r1,-32(r1)
 5f0:	93 61 00 0c 	stw     r27,12(r1)
 5f4:	93 81 00 10 	stw     r28,16(r1)
 5f8:	93 a1 00 14 	stw     r29,20(r1)
 5fc:	93 c1 00 18 	stw     r30,24(r1)
 600:	93 e1 00 1c 	stw     r31,28(r1)
 604:	7d 8d 42 e6 	mftbu   r12
 608:	7f ac 42 e6 	mftb    r29
 60c:	7c cd 42 e6 	mftbu   r6
 610:	7f 8c 30 40 	cmplw   cr7,r12,r6
 614:	40 9e ff f0 	bne     cr7,604 <__c_kernel_clock_gettime+0x5c>
>618:	2f 8c 00 00 	cmpwi   cr7,r12,0
 61c:	83 6b 00 28 	lwz     r27,40(r11)
 620:	83 8b 00 2c 	lwz     r28,44(r11)
 624:	81 45 00 08 	lwz     r10,8(r5)
 628:	80 e5 00 0c 	lwz     r7,12(r5)
>62c:	41 9c 00 b4 	blt     cr7,6e0 <__c_kernel_clock_gettime+0x138>
 630:	81 05 00 18 	lwz     r8,24(r5)
 634:	83 c5 00 1c 	lwz     r30,28(r5)
 638:	80 cb 00 24 	lwz     r6,36(r11)
 63c:	83 e5 00 00 	lwz     r31,0(r5)
 640:	7f 9f 00 40 	cmplw   cr7,r31,r0
 644:	40 9e 00 84 	bne     cr7,6c8 <__c_kernel_clock_gettime+0x120>

After:
 5e0:	81 25 00 04 	lwz     r9,4(r5)
*5e4:	2f 89 00 00 	cmpwi   cr7,r9,0
*5e8:	40 9e 01 88 	bne     cr7,770 <__c_kernel_clock_gettime+0x1c8>
 5ec:	94 21 ff e0 	stwu    r1,-32(r1)
 5f0:	93 61 00 0c 	stw     r27,12(r1)
 5f4:	93 81 00 10 	stw     r28,16(r1)
 5f8:	93 a1 00 14 	stw     r29,20(r1)
 5fc:	93 c1 00 18 	stw     r30,24(r1)
 600:	93 e1 00 1c 	stw     r31,28(r1)
 604:	7f cd 42 e6 	mftbu   r30
 608:	7f ac 42 e6 	mftb    r29
 60c:	7c cd 42 e6 	mftbu   r6
 610:	7f 9e 30 40 	cmplw   cr7,r30,r6
 614:	40 9e ff f0 	bne     cr7,604 <__c_kernel_clock_gettime+0x5c>
 618:	83 6b 00 28 	lwz     r27,40(r11)
 61c:	83 8b 00 2c 	lwz     r28,44(r11)
 620:	81 45 00 08 	lwz     r10,8(r5)
 624:	80 e5 00 0c 	lwz     r7,12(r5)
 628:	81 05 00 18 	lwz     r8,24(r5)
 62c:	83 e5 00 1c 	lwz     r31,28(r5)
 630:	80 cb 00 24 	lwz     r6,36(r11)
 634:	81 85 00 00 	lwz     r12,0(r5)
 638:	7f 8c 00 40 	cmplw   cr7,r12,r0
 63c:	40 9e 00 84 	bne     cr7,6c0 <__c_kernel_clock_gettime+0x118>

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index d1e702e0ea86..c5a24f31382e 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -69,15 +69,18 @@ int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 }
 #endif
 
-static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
+static __always_inline bool __arch_is_hw_counter_valid(s32 clock_mode)
 {
 	/*
 	 * clock_mode == 0 implies that vDSO are enabled otherwise
 	 * fallback on syscall.
 	 */
-	if (clock_mode != 0)
-		return U64_MAX;
+	return clock_mode == 0 ? true : false;
+}
+#define __arch_is_hw_counter_valid __arch_is_hw_counter_valid
 
+static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
+{
 	return get_tb();
 }
 
-- 
2.13.3

