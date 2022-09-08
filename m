Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA45B24E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmbw1kD3z3f87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:40:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmZ910Tzz3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:38:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYl66NLz9sm3;
	Thu,  8 Sep 2022 19:38:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arTPYqkDfREp; Thu,  8 Sep 2022 19:38:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYg1FzVz9sm1;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0911E8B763;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Hb4z-3A5s9yz; Thu,  8 Sep 2022 19:38:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B50F58B794;
	Thu,  8 Sep 2022 19:38:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcChR3449193
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcCA43449192;
	Thu, 8 Sep 2022 19:38:12 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 13/19] watchdog: booke_wdt: Replace PPC_FSL_BOOK3E by PPC_E500
Date: Thu,  8 Sep 2022 19:37:46 +0200
Message-Id: <015ac5217fd0f061e98df9cf98bce515855f2bc3.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=2391; s=20211009; h=from:subject:message-id; bh=0Xgzpn3N+NzhlW/qQXofOgnUzUV86dn573JJNprW5yM=; b=9yJqYJvAAVKydXq9+B7xsnSyVfjCOEC1QwwVXX4dqqNqNUpLq+e5g7qXP24ZcPSaYflZ4sgbUnL9 3Erc+E0vAZ/fuXhToSPmjWDOp75mSieksRhRyH2A0e4rHjSsVZ4/
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
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_FSL_BOOK3E is redundant with CONFIG_PPC_E500.

Replace it so that CONFIG_PPC_FSL_BOOK3E can be removed later.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/Kconfig     | 8 ++++----
 drivers/watchdog/booke_wdt.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9295492d24f7..b7c03c600567 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1935,10 +1935,10 @@ config BOOKE_WDT
 config BOOKE_WDT_DEFAULT_TIMEOUT
 	int "PowerPC Book-E Watchdog Timer Default Timeout"
 	depends on BOOKE_WDT
-	default 38 if PPC_FSL_BOOK3E
-	range 0 63 if PPC_FSL_BOOK3E
-	default 3 if !PPC_FSL_BOOK3E
-	range 0 3 if !PPC_FSL_BOOK3E
+	default 38 if PPC_E500
+	range 0 63 if PPC_E500
+	default 3 if !PPC_E500
+	range 0 3 if !PPC_E500
 	help
 	  Select the default watchdog timer period to be used by the PowerPC
 	  Book-E watchdog driver.  A watchdog "event" occurs when the bit
diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
index 75da5cd02615..932a03f4436a 100644
--- a/drivers/watchdog/booke_wdt.c
+++ b/drivers/watchdog/booke_wdt.c
@@ -27,7 +27,7 @@
  */
 
 
-#ifdef	CONFIG_PPC_FSL_BOOK3E
+#ifdef	CONFIG_PPC_E500
 #define WDTP(x)		((((x)&0x3)<<30)|(((x)&0x3c)<<15))
 #define WDTP_MASK	(WDTP(0x3f))
 #else
@@ -45,7 +45,7 @@ MODULE_PARM_DESC(nowayout,
 		"Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 
 /* For the specified period, determine the number of seconds
  * corresponding to the reset time.  There will be a watchdog
@@ -88,7 +88,7 @@ static unsigned int sec_to_period(unsigned int secs)
 
 #define MAX_WDT_TIMEOUT		period_to_sec(1)
 
-#else /* CONFIG_PPC_FSL_BOOK3E */
+#else /* CONFIG_PPC_E500 */
 
 static unsigned long long period_to_sec(unsigned int period)
 {
@@ -102,7 +102,7 @@ static unsigned int sec_to_period(unsigned int secs)
 
 #define MAX_WDT_TIMEOUT		3	/* from Kconfig */
 
-#endif /* !CONFIG_PPC_FSL_BOOK3E */
+#endif /* !CONFIG_PPC_E500 */
 
 static void __booke_wdt_set(void *data)
 {
-- 
2.37.1

