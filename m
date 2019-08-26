Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D5F9C9CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 09:05:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H31D2QWKzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:05:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BF2Wd3vW"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H2th3P2szDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 16:59:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46H2tV36fcz9vBLK;
 Mon, 26 Aug 2019 08:59:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BF2Wd3vW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id opuO-a8eCCRS; Mon, 26 Aug 2019 08:59:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46H2tV24bNz9vBLJ;
 Mon, 26 Aug 2019 08:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566802770; bh=8j5mwu9pWK20Qk1oNaDurAISpRT0outYGtUkNA7dR4k=;
 h=From:Subject:To:Cc:Date:From;
 b=BF2Wd3vWQzhrPPDonMt+g0Q/G87ECs0Rhh7ErEOA6zVBImOOAzRhLkI5PN4fiQJWI
 zc6VTVvbVbdxsC24JX6UnyiHrm7l/jGcHALyAXr/Kr0mSSWQHcQVMuDILygvzOU/aa
 9+KkaAHurSU5hykFmHu5ZSNNGO0hC6F79gQb/+8I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E464A8B7CE;
 Mon, 26 Aug 2019 08:59:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mFg2us_BdCCW; Mon, 26 Aug 2019 08:59:34 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB6AF8B7B9;
 Mon, 26 Aug 2019 08:59:34 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9DAB1672A8; Mon, 26 Aug 2019 06:59:34 +0000 (UTC)
Message-Id: <55c267ac6e0cd289970accfafbf9dda11a324c2e.1566802736.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/time: use feature fixup in __USE_RTC() instead of cpu
 feature.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 06:59:34 +0000 (UTC)
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

sched_clock(), used by printk(), calls __USE_RTC() to know
whether to use realtime clock or timebase.

__USE_RTC() uses cpu_has_feature() which is initialised by
machine_init(). Before machine_init(), __USE_RTC() returns true,
leading to a program check exception on CPUs not having realtime
clock.

In order to be able to use printk() earlier, use feature fixup.
Feature fixups are applies in early_init(), enabling the use of
printk() earlier.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/time.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 54f4ec1f9fab..3455cb54c333 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -42,7 +42,14 @@ struct div_result {
 /* Accessor functions for the timebase (RTC on 601) registers. */
 /* If one day CONFIG_POWER is added just define __USE_RTC as 1 */
 #ifdef CONFIG_PPC_BOOK3S_32
-#define __USE_RTC()	(cpu_has_feature(CPU_FTR_USE_RTC))
+static inline bool __USE_RTC(void)
+{
+	asm_volatile_goto(ASM_FTR_IFCLR("nop;", "b %1;", %0) ::
+			  "i" (CPU_FTR_USE_RTC) :: l_use_rtc);
+	return false;
+l_use_rtc:
+	return true;
+}
 #else
 #define __USE_RTC()	0
 #endif
-- 
2.13.3

