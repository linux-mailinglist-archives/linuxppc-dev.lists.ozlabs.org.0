Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102159A637
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Wm92VV9z3f9k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 05:19:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBqtss7l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBqtss7l;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Why0pxpz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:17:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E46C61530;
	Fri, 19 Aug 2022 19:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38254C433C1;
	Fri, 19 Aug 2022 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660936623;
	bh=FunJVKQSfy3ipKaxhp/fmwSG564pofyswuXNHKDIGX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gBqtss7lMKUrZnALSK7L1enBXFMdQzo+Ne+N2zmcqN5b68LDIZxPRVJ5xwoP8vowR
	 9dzWlCg89mxHbXdnxU+593VLBFP5eug5fc5imlCM1jSNIs25X/tugUSRFOupt6DTbe
	 gu7n9Y9E8xKwxwbIfTxfrt26B1o53eMWhIZ3DihnUaCGzhmL0ik6FviGE4vQ4KIKAf
	 ijsoc9oOJU28dRAunJgR/wsOeyxCXWlUoxYMXjZmonNQZE8OP+Pa6GeFqpQFenHFqH
	 7QpXEZoVEJMC8qjWuJzFiodSZuvwjpYFHZnvH+Cbrzz2VOwMifrfQ78vKwtv/YNBrl
	 7HW63a52i5jMw==
Received: by pali.im (Postfix)
	id E4DB1761; Fri, 19 Aug 2022 21:17:02 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: [PATCH 6/7] powerpc/85xx: p2020: Enable boards by new config option CONFIG_P2020
Date: Fri, 19 Aug 2022 21:15:56 +0200
Message-Id: <20220819191557.28116-7-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220819191557.28116-1-pali@kernel.org>
References: <20220819191557.28116-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Generic unified P2020 machine description which supports all P2020-based
boards is now in separate file p2020.c. So create a separate config option
CONFIG_P2020 for it.

Previously machine descriptions for P2020 boards were enabled by
CONFIG_MPC85xx_DS or CONFIG_MPC85xx_RDB option. So set CONFIG_P2020 to be
enabled by default when one of those option is enabled.

This allows to compile support for P2020 boards without need to have
enabled support for older mpc85xx boards. And to compile kernel for old
mpc85xx boards without having enabled support for new P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/Kconfig  | 22 ++++++++++++++++++----
 arch/powerpc/platforms/85xx/Makefile |  3 +--
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index be16eba0f704..2cb4e9248b42 100644
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
+config P2020
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
index 1ad261b4eeb6..021e168442d7 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -23,8 +23,7 @@ obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
 obj-$(CONFIG_P1022_DS)    += p1022_ds.o
 obj-$(CONFIG_P1022_RDK)   += p1022_rdk.o
 obj-$(CONFIG_P1023_RDB)   += p1023_rdb.o
-obj-$(CONFIG_MPC85xx_DS)  += p2020.o
-obj-$(CONFIG_MPC85xx_RDB) += p2020.o
+obj-$(CONFIG_P2020)       += p2020.o
 obj-$(CONFIG_TWR_P102x)   += twr_p102x.o
 obj-$(CONFIG_CORENET_GENERIC)   += corenet_generic.o
 obj-$(CONFIG_FB_FSL_DIU)	+= t1042rdb_diu.o
-- 
2.20.1

