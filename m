Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67710E6B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:12:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHt00TMMzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:12:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Sia7jOpo"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHXN6JWVzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 18:57:40 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHX951dRz9txt4;
 Mon,  2 Dec 2019 08:57:29 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Sia7jOpo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id c4MQg7JGYr_R; Mon,  2 Dec 2019 08:57:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHX941Jhz9txsp;
 Mon,  2 Dec 2019 08:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575273449; bh=0MmKxahs9w5s0ptN3HXvddrZpf6vMx3guYv2r24v18w=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Sia7jOpo9VTeV69W4STD+tXHRGgE18B/8gmvhtDe2Lt0q42GppSfU5mQaNNuWpHgz
 Q9VZI/1uRUxFaZONUgKQI6XKd6eW1CnNjndnBrgQmDPCGgS+QXZhpAx48TmPuc/gHp
 PBkrLCWVH4X//N1W/FlcI86bME7lmKbp4GuUh3jE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 295FF8B79B;
 Mon,  2 Dec 2019 08:57:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ynv3H3G0hmCL; Mon,  2 Dec 2019 08:57:34 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E328B79A;
 Mon,  2 Dec 2019 08:57:34 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0385463600; Mon,  2 Dec 2019 07:57:33 +0000 (UTC)
Message-Id: <37f94e47c91070b7606fb3ec3fe6fd2302a475a0.1575273217.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1575273217.git.christophe.leroy@c-s.fr>
References: <cover.1575273217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 7/8] powerpc/vdso32: implement clock_getres entirely
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  2 Dec 2019 07:57:33 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
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
index 0013197d89a6..90e53d432f2e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -413,7 +413,10 @@ int main(void)
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
index 9aafacea9c4a..20ae38f3a5a3 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -196,17 +196,20 @@ V_FUNCTION_END(__kernel_clock_gettime)
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
@@ -215,11 +218,11 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
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

