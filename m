Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9C77F667
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPQy4VHdz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPQR2l7wz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:27:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRPQH3JTrz9wtX;
	Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgwxOGfKXmVl; Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRPQH2d82z9wsV;
	Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 571D48B76C;
	Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8-IGfLDVvTbu; Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 192DB8B763;
	Thu, 17 Aug 2023 14:27:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HCQq0n329744
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 14:26:52 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HCQkc9329733;
	Thu, 17 Aug 2023 14:26:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/8xx: Remove init_internal_rtc() to fix no previous prototype error
Date: Thu, 17 Aug 2023 14:26:45 +0200
Message-ID: <0aa1141e18a84d926e199093204b37ec993f0c87.1692275185.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692275204; l=2196; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=TOxDx12z/TGZafKDLRg+BU2FZSV7XBUmOHECQ+4c28k=; b=UTzebFk0M2gtEKaAW/lC4jL6Ix5dzIFrfwhC6U550fzSde5Wv8lazoa7oopchyRfdssNLBY4p nQsfuSzRvuEDq/wLQ0YooVlT9EGOg9qL9THicZ1z/kbcZTeGvu7wCNf
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A W=1 build of mpc885_ads_defconfig throws the following error:

  CC      arch/powerpc/platforms/8xx/m8xx_setup.o
arch/powerpc/platforms/8xx/m8xx_setup.c:41:1: error: no previous prototype for 'init_internal_rtc' [-Werror=missing-prototypes]
   41 | init_internal_rtc(void)
      | ^~~~~~~~~~~~~~~~~

init_internal_rtc() was introduced by commit df34403dcaac ("[POWERPC]
8xx: Add mpc885ads support and common mpc8xx files") as a weak
function but has never been defined and/or used outside m8xx_setup.c

As it is called only once there, just fold it into its caller and
remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/8xx/m8xx_setup.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index 3c5c4e08b6a9..2336b687bc96 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -36,17 +36,6 @@ static irqreturn_t timebase_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-/* per-board overridable init_internal_rtc() function. */
-void __init __attribute__ ((weak))
-init_internal_rtc(void)
-{
-	/* Disable the RTC one second and alarm interrupts. */
-	clrbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_SIE | RTCSC_ALE));
-
-	/* Enable the RTC */
-	setbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_RTF | RTCSC_RTE));
-}
-
 static int __init get_freq(char *name, unsigned long *val)
 {
 	struct device_node *cpu;
@@ -117,7 +106,11 @@ void __init mpc8xx_calibrate_decr(void)
 	out_be32(&mpc8xx_immr->im_sitk.sitk_rtcsck, KAPWR_KEY);
 	out_be32(&mpc8xx_immr->im_sitk.sitk_tbk, KAPWR_KEY);
 
-	init_internal_rtc();
+	/* Disable the RTC one second and alarm interrupts. */
+	clrbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_SIE | RTCSC_ALE));
+
+	/* Enable the RTC */
+	setbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_RTF | RTCSC_RTE));
 
 	/* Enabling the decrementer also enables the timebase interrupts
 	 * (or from the other point of view, to get decrementer interrupts
-- 
2.41.0

