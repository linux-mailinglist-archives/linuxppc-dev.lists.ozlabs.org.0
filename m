Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD27A0903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 17:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmh2M3CYXz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmh1p4Lplz3c60
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 01:24:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rmh1f3PRDz9shm;
	Thu, 14 Sep 2023 17:24:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_ZzYUqoefDC; Thu, 14 Sep 2023 17:24:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rmh1c6d3bz9snc;
	Thu, 14 Sep 2023 17:24:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DFB5E8B76D;
	Thu, 14 Sep 2023 17:24:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0Z7Ngs57m-B9; Thu, 14 Sep 2023 17:24:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.98])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB7758B763;
	Thu, 14 Sep 2023 17:24:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38EFNw0n4149656
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:23:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38EFNqfM4149609;
	Thu, 14 Sep 2023 17:23:52 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/82xx: Select FSL_SOC
Date: Thu, 14 Sep 2023 17:23:45 +0200
Message-ID: <7ab513546148ebe33ddd4b0ea92c7bfd3cce3ad7.1694705016.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694705024; l=1598; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Jj9Alu0MLKuxX1QkULA4mmw2y3s6Ft2LhGs+pStHEUg=; b=SNWNtDClXy5jZEeACZJaXaRluk3WX4/sTp0u0Vv0lJxZzknMOPycHIumK3gyjZ94p206zRJ1j 1SZ/qqvie89BCnXc54aoGMvtTN5szKzHAiC5C/YXC/kQJzKlVFBYyRp
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It used to be impossible to select CONFIG_CPM2 without selecting
CONFIG_FSL_SOC at the same time because CONFIG_CPM2 was dependent
on CONFIG_8260 and CONFIG_8260 was selecting CONFIG_FSL_SOC.

But after commit eb5aa2137275 ("powerpc/82xx: Remove CONFIG_8260
and CONFIG_8272") CONFIG_CPM2 depends on CONFIG_MPC82xx instead
but CONFIG_MPC82xx doesn't directly selects CONFIG_FSL_SOC.

Fix it by forcing CONFIG_MPC82xx to select CONFIG_FSL_SOC just
like already done by MPC8xx, MPC512x, MPC83xx, PPC_86xx.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: eb5aa2137275 ("powerpc/82xx: Remove CONFIG_8260 and CONFIG_8272")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/82xx/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
index d9f1a2a83158..1824536cf6f2 100644
--- a/arch/powerpc/platforms/82xx/Kconfig
+++ b/arch/powerpc/platforms/82xx/Kconfig
@@ -2,6 +2,7 @@
 menuconfig PPC_82xx
 	bool "82xx-based boards (PQ II)"
 	depends on PPC_BOOK3S_32
+	select FSL_SOC
 
 if PPC_82xx
 
@@ -9,7 +10,6 @@ config EP8248E
 	bool "Embedded Planet EP8248E (a.k.a. CWH-PPC-8248N-VE)"
 	select CPM2
 	select PPC_INDIRECT_PCI if PCI
-	select FSL_SOC
 	select PHYLIB if NETDEVICES
 	select MDIO_BITBANG if PHYLIB
 	help
@@ -22,7 +22,6 @@ config MGCOGE
 	bool "Keymile MGCOGE"
 	select CPM2
 	select PPC_INDIRECT_PCI if PCI
-	select FSL_SOC
 	help
 	  This enables support for the Keymile MGCOGE board.
 
-- 
2.41.0

