Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3877F803
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 15:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRR8g0l17z3cTG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 23:45:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRR8818Rwz2ydN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 23:44:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRR7x5bZRzB0Sh;
	Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FousFlCk6thr; Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRR7x4yfgzB0Sg;
	Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A6B2A8B76C;
	Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5gO1jEp3d6SR; Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A0208B763;
	Thu, 17 Aug 2023 15:44:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HDibVq433875
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 15:44:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HDiYBe433828;
	Thu, 17 Aug 2023 15:44:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/4xx: Remove pika_dtm_[un]register_shutdown() to fix no previous prototype
Date: Thu, 17 Aug 2023 15:44:26 +0200
Message-ID: <830923f0e0375a14609204246d302c7476a8f948.1692279855.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692279865; l=3351; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Sbyk6OxfIJ6WJXDgRx9nz8WultA2O/aRcm7QwUEwtak=; b=AnI1p6Zia0OY67ubHT1k6Hs9VRBTsgbCT6Z1jctBs/hWRBywlgggbXxivSa3Ma2NRElgHXEOS Nm8/Ew30YKEAfTsThHJKP+az1JBdpHihIVsa1w6Py1rLfnyaQMaruqv
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

ppc4xx_defconfig with W=1 results in:

  CC      arch/powerpc/platforms/44x/warp.o
arch/powerpc/platforms/44x/warp.c:369:5: error: no previous prototype for 'pika_dtm_register_shutdown' [-Werror=missing-prototypes]
  369 | int pika_dtm_register_shutdown(void (*func)(void *arg), void *arg)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/44x/warp.c:374:5: error: no previous prototype for 'pika_dtm_unregister_shutdown' [-Werror=missing-prototypes]
  374 | int pika_dtm_unregister_shutdown(void (*func)(void *arg), void *arg)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

The functions were added by commit 4ebef31fa6e0 ("[POWERPC] PIKA Warp:
Update platform code to support Rev B boards")

Those functions are not used localy and allthough their symbols are
exported they are not declared in any header file so they can't be used.

Remove them, then remove the associated list as it will now remain empty
hence becomes useless.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/44x/warp.c | 55 -------------------------------
 1 file changed, 55 deletions(-)

diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index bfeb9bdc3258..bf0188dcb918 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -83,45 +83,8 @@ static int __init warp_post_info(void)
 
 #ifdef CONFIG_SENSORS_AD7414
 
-static LIST_HEAD(dtm_shutdown_list);
 static void __iomem *dtm_fpga;
 
-struct dtm_shutdown {
-	struct list_head list;
-	void (*func)(void *arg);
-	void *arg;
-};
-
-int pika_dtm_register_shutdown(void (*func)(void *arg), void *arg)
-{
-	struct dtm_shutdown *shutdown;
-
-	shutdown = kmalloc(sizeof(struct dtm_shutdown), GFP_KERNEL);
-	if (shutdown == NULL)
-		return -ENOMEM;
-
-	shutdown->func = func;
-	shutdown->arg = arg;
-
-	list_add(&shutdown->list, &dtm_shutdown_list);
-
-	return 0;
-}
-
-int pika_dtm_unregister_shutdown(void (*func)(void *arg), void *arg)
-{
-	struct dtm_shutdown *shutdown;
-
-	list_for_each_entry(shutdown, &dtm_shutdown_list, list)
-		if (shutdown->func == func && shutdown->arg == arg) {
-			list_del(&shutdown->list);
-			kfree(shutdown);
-			return 0;
-		}
-
-	return -EINVAL;
-}
-
 #define WARP_GREEN_LED	0
 #define WARP_RED_LED	1
 
@@ -153,17 +116,12 @@ static struct platform_device warp_gpio_leds = {
 
 static irqreturn_t temp_isr(int irq, void *context)
 {
-	struct dtm_shutdown *shutdown;
 	int value = 1;
 
 	local_irq_disable();
 
 	gpiod_set_value(warp_gpio_led_pins[WARP_GREEN_LED].gpiod, 0);
 
-	/* Run through the shutdown list. */
-	list_for_each_entry(shutdown, &dtm_shutdown_list, list)
-		shutdown->func(shutdown->arg);
-
 	printk(KERN_EMERG "\n\nCritical Temperature Shutdown\n\n");
 
 	while (1) {
@@ -366,19 +324,6 @@ machine_late_initcall(warp, pika_dtm_start);
 
 #else /* !CONFIG_SENSORS_AD7414 */
 
-int pika_dtm_register_shutdown(void (*func)(void *arg), void *arg)
-{
-	return 0;
-}
-
-int pika_dtm_unregister_shutdown(void (*func)(void *arg), void *arg)
-{
-	return 0;
-}
-
 machine_late_initcall(warp, warp_post_info);
 
 #endif
-
-EXPORT_SYMBOL(pika_dtm_register_shutdown);
-EXPORT_SYMBOL(pika_dtm_unregister_shutdown);
-- 
2.41.0

