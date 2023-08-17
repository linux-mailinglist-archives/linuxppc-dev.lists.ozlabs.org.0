Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5577F1C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 10:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRHf12sRlz3c1H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRHdX02vgz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:06:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRHdL6Ss9z9xdY;
	Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swgssWTPp0t3; Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRHdL5sC1z9xdP;
	Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C58DB8B76C;
	Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YFsI9s3G7F2V; Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D86C8B763;
	Thu, 17 Aug 2023 10:06:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37H861dw271412
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 10:06:01 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37H85v8A271408;
	Thu, 17 Aug 2023 10:05:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/82xx: Remove CONFIG_8260 and CONFIG_8272
Date: Thu, 17 Aug 2023 10:05:49 +0200
Message-ID: <80930252a5167f3cdaa7eb694074d75521a0bdf9.1692259495.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692259548; l=2641; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=bBQAUDFB8emqjWfemhB7A/6Y1IZAaNUK1OuI3o1EfMg=; b=v1JDOIosHLXFlWDCPY7GKQEcseWiyyI4tHS0o/5nYMgSZ+zm1rLBSvsgDjqXHmgUYJAHwFVzM G5do/Bf+8hZDcFGkJh9vVKrlGwDtaufvR5nRULusHIzczhSu91sFA97
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_8272 is never used, remove it.

CONFIG_8260 is redundant with CONFIG_PPC_82xx, remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h |  2 +-
 arch/powerpc/platforms/82xx/Kconfig | 25 ++++---------------------
 arch/powerpc/platforms/Kconfig      |  2 +-
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 443a9d482b15..8765d5158324 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -252,7 +252,7 @@ static inline void cpu_feature_keys_init(void) { }
  * This is also required by 52xx family.
  */
 #if defined(CONFIG_SMP) || defined(CONFIG_MPC10X_BRIDGE) \
-	|| defined(CONFIG_PPC_83xx) || defined(CONFIG_8260) \
+	|| defined(CONFIG_PPC_83xx) || defined(CONFIG_PPC_82xx) \
 	|| defined(CONFIG_PPC_MPC52xx)
 #define CPU_FTR_COMMON                  CPU_FTR_NEED_COHERENT
 #else
diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
index 58e58b4f6a12..d9f1a2a83158 100644
--- a/arch/powerpc/platforms/82xx/Kconfig
+++ b/arch/powerpc/platforms/82xx/Kconfig
@@ -7,8 +7,8 @@ if PPC_82xx
 
 config EP8248E
 	bool "Embedded Planet EP8248E (a.k.a. CWH-PPC-8248N-VE)"
-	select 8272
-	select 8260
+	select CPM2
+	select PPC_INDIRECT_PCI if PCI
 	select FSL_SOC
 	select PHYLIB if NETDEVICES
 	select MDIO_BITBANG if PHYLIB
@@ -20,27 +20,10 @@ config EP8248E
 
 config MGCOGE
 	bool "Keymile MGCOGE"
-	select 8272
-	select 8260
+	select CPM2
+	select PPC_INDIRECT_PCI if PCI
 	select FSL_SOC
 	help
 	  This enables support for the Keymile MGCOGE board.
 
 endif
-
-config 8260
-	bool
-	depends on PPC_BOOK3S_32
-	select CPM2
-	select PPC_INDIRECT_PCI if PCI
-	help
-	  The MPC8260 is a typical embedded CPU made by Freescale.  Selecting
-	  this option means that you wish to build a kernel for a machine with
-	  an 8260 class CPU.
-
-config 8272
-	bool
-	select 8260
-	help
-	  The MPC8272 CPM has a different internal dpram setup than other CPM2
-	  devices
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 3e2e252016f7..1fd253f92a77 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -251,7 +251,7 @@ config QE_GPIO
 
 config CPM2
 	bool "Enable support for the CPM2 (Communications Processor Module)"
-	depends on (FSL_SOC_BOOKE && PPC32) || 8260
+	depends on (FSL_SOC_BOOKE && PPC32) || PPC_82xx
 	select CPM
 	select HAVE_PCI
 	select GPIOLIB
-- 
2.41.0

