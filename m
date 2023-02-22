Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8569F6EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJpf5lWTz3cjC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJn41z50z3cJq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:43:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJmy4y4Yz9sTs;
	Wed, 22 Feb 2023 15:43:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUlg6-EnXv2G; Wed, 22 Feb 2023 15:43:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmw6p45z9sTL;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D6E638B763;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GK2RkwgZnQLQ; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 887C38B786;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhNOh1187149
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:23 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhNqe1187148;
	Wed, 22 Feb 2023 15:43:23 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 16/17] powerpc/85xx: p2020: Enable boards by new config option CONFIG_PPC_P2020
Date: Wed, 22 Feb 2023 15:43:03 +0100
Message-Id: <d517c922e8b6177132dd4172e5714c9641897b62.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=3571; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VJynZgkJe+0PtJlCckWYiI+qUklGW/wOyMpT2M56Xp0=; b=K7t3cvOqXCBxUN01KQg0RoicRZVbN5lUmkyhc1po+Zq9biGxcOctwR3Ku7ZX+igODMeUCwaatArb EAX8pTIjDU7quIlzzgf924JVPIvTvjsov4wtG0xN7kSv4lwZrTSJ
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

From: Pali Rohár <pali@kernel.org>

Generic unified P2020 machine description which supports all P2020-based
boards is now in separate file p2020.c. So create a separate config option
CONFIG_PPC_P2020 for it.

Previously machine descriptions for P2020 boards were enabled by
CONFIG_MPC85xx_DS or CONFIG_MPC85xx_RDB option. So set CONFIG_PPC_P2020 to
be enabled by default when one of those option is enabled.

This allows to compile support for P2020 boards without need to have
enabled support for older mpc85xx boards. And to compile kernel for old
mpc85xx boards without having enabled support for new P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/Kconfig  | 22 ++++++++++++++++++----
 arch/powerpc/platforms/85xx/Makefile |  5 +++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index b92cb2b4d54d..90665882143b 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -78,16 +78,16 @@ config MPC8536_DS
 	  This option enables support for the MPC8536 DS board
 
 config MPC85xx_DS
-	bool "Freescale MPC8544 DS / MPC8572 DS / P2020 DS"
+	bool "Freescale MPC8544 DS / MPC8572 DS"
 	select PPC_I8259
 	select DEFAULT_UIMAGE
 	select FSL_ULI1575 if PCI
 	select SWIOTLB
 	help
-	  This option enables support for the MPC8544 DS, MPC8572 DS and P2020 DS boards
+	  This option enables support for the MPC8544 DS and MPC8572 DS boards
 
 config MPC85xx_RDB
-	bool "Freescale P102x MBG/UTM/RDB and P2020 RDB"
+	bool "Freescale P102x MBG/UTM/RDB"
 	select PPC_I8259
 	select DEFAULT_UIMAGE
 	select FSL_ULI1575 if PCI
@@ -95,7 +95,21 @@ config MPC85xx_RDB
 	help
 	  This option enables support for the P1020 MBG PC, P1020 UTM PC,
 	  P1020 RDB PC, P1020 RDB PD, P1020 RDB, P1021 RDB PC, P1024 RDB,
-	  P1025 RDB, P2020 RDB and P2020 RDB PC boards
+	  and P1025 RDB boards
+
+config PPC_P2020
+	bool "Freescale P2020"
+	default y if MPC85xx_DS || MPC85xx_RDB
+	select DEFAULT_UIMAGE
+	select SWIOTLB
+	imply PPC_I8259
+	imply FSL_ULI1575 if PCI
+	help
+	  This option enables generic unified support for any board with the
+	  Freescale P2020 processor.
+
+	  For example: P2020 DS board, P2020 RDB board, P2020 RDB PC board or
+	  CZ.NIC Turris 1.x boards.
 
 config P1010_RDB
 	bool "Freescale P1010 RDB"
diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 65abd5a161c0..82cf7d5b4913 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -18,13 +18,14 @@ obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
 obj8259-$(CONFIG_PPC_I8259)   += mpc85xx_8259.o
 objpci-$(CONFIG_PCI)   += mpc85xx_uli.o
-obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o $(obj8259-y) $(objpci-y)
+obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o $(obj8259-y) $(objpci-y)
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
-obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o p2020.o
+obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
 obj-$(CONFIG_P1022_DS)    += p1022_ds.o
 obj-$(CONFIG_P1022_RDK)   += p1022_rdk.o
 obj-$(CONFIG_P1023_RDB)   += p1023_rdb.o
+obj-$(CONFIG_PPC_P2020)   += p2020.o $(obj8259-y) $(objpci-y)
 obj-$(CONFIG_TWR_P102x)   += twr_p102x.o
 obj-$(CONFIG_CORENET_GENERIC)   += corenet_generic.o
 obj-$(CONFIG_FB_FSL_DIU)	+= t1042rdb_diu.o
-- 
2.39.1

