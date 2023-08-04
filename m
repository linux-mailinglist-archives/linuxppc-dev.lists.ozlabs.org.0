Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C947701BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRXQ42Lwz3fFg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRSK0M5sz3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:31:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRw0pXwz9tG6;
	Fri,  4 Aug 2023 15:30:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HfZcoc1Bb-al; Fri,  4 Aug 2023 15:30:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRr2mVwz9tG7;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 593EA8B778;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TZ1mdcPbhWDF; Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A16EF8B776;
	Fri,  4 Aug 2023 15:30:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUeKN693353
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:40 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DUesE693352;
	Fri, 4 Aug 2023 15:30:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 08/10] net: fs_enet: Don't include fs_enet_pd.h when not needed
Date: Fri,  4 Aug 2023 15:30:18 +0200
Message-ID: <de62ad1261a801c4a8ae4238bd4842ff278d2ddf.1691155347.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155810; l=1659; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=wiYZJaVAd6C6hv7T6eDAPFilwlr4eeTyZnzPcByG1cc=; b=eTgm0DsrTNZLL3mMVSmqDyjjASK9lxEc4Y6ee2Pk6exwR+4PtVejVpYZtHpx19pE6Qdf2/5w/ 5GQKfqoT11LDfx2tTTvtL+jGLX0wCrmbYmE5Q9afbrmG6yT70Smtbea
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Three platforms in arch/powerpc/platforms/8xx/ include fs_enet_pd.h
but don't use anything from it.

Remove the includes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/8xx/adder875.c        | 1 -
 arch/powerpc/platforms/8xx/mpc885ads_setup.c | 1 -
 arch/powerpc/platforms/8xx/tqm8xx_setup.c    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 7e83eb6746f4..f6bd232f8323 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/init.h>
-#include <linux/fs_enet_pd.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
index 2fc7cacbcd96..c7c4f082b838 100644
--- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
@@ -21,7 +21,6 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 
-#include <linux/fs_enet_pd.h>
 #include <linux/fs_uart_pd.h>
 #include <linux/fsl_devices.h>
 #include <linux/mii.h>
diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
index 7d8eb50bb9cd..6e56be852b2c 100644
--- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
@@ -24,7 +24,6 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 
-#include <linux/fs_enet_pd.h>
 #include <linux/fs_uart_pd.h>
 #include <linux/fsl_devices.h>
 #include <linux/mii.h>
-- 
2.41.0

