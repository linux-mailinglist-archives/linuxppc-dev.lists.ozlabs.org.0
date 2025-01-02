Return-Path: <linuxppc-dev+bounces-4576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9E9FFE58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgL4995z308V;
	Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842749;
	cv=none; b=Bzk7scACEZNXKrJrSIRGRW4vSras4KzEAegNsgi7qwUxCTGPM/oUz7e+ww8ml1dGS3dfcqqIjtsiTu8RXUyLlfc+7ivo5oekg9damVc9hZ0k5vVzP8OzQFj801Z3UPO9g7a5FhjgQLpQe3K5MDU711/nBz6tqi6rdZXFxbrq/jzVtkKVJ/Kc9HwCPy9AAn6I/1b+6Vw/FvLo4q/6vHEWlZTDk17er7NkCvfxPnq7I7lkXKRu/l8cH0OPAXCiPEJ9bG/bNhrp6lJ7jj+zVdF17zVhgrmBYnm9KTnmfhCY4Aj8kKrmUYBRRGIJIU9+x0Y/wYVV2Ghh0rf7g8kJE2R1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842749; c=relaxed/relaxed;
	bh=1NQK7SjQwMATZ3qb9dxH/obmMpRlRXgFQrQoHXBIMF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eoGKjJCJbTvqYXdsDpPcUUngog7SH94aUIaLt2HENl4e88lis8UkJQjbdPmDowhiTA63GoJFpvuQ02ho5J8Pt6IVhltwM1yR+MNTZmf/e+QCLkrxe9kPxgNmeqkB+B9NsdYo+NzXNBC8m0RRdfg6Z7pcTIJc+iDBDC+PQD7fhZPusWS+fvkBWAXeP1WjPfZz93zu3iPlFGYmCaTl30ondl+TwJ02mNcnQhVsJ9t92m+8hILuqg+ZB1V0DyaGyouGLtJhtKmmmpmQBtIOMiFQb6adtGwmkS0EvkWG1MiN6QIsAjyZr+5SWN47lxzlZrLx5Yi2A1Ju6McEE8kicOgE+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opQmjpo0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opQmjpo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgG2b5Lz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFED65C5D74;
	Thu,  2 Jan 2025 18:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7A66C4CEDC;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=iXEKfMZLPG1LksbWhM4v2lw0fm4m5xLanyUbnOMBf3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=opQmjpo07S4Rn++saRB7U2Oux+6AbK2WkHGmLMP6XRu/RCtCjviuJ/ebXrbtI8beH
	 xeJWpppwHD0uk8rEVh8zdjNYkHTlN8kojEDncqLa49KF0UW7kvk47t6tpUDeSRUd0x
	 DFVxWZ7iokVyZ4CoecqMMgz6wFHTg8v2MH1dF8n0hg4WOszV2OSX7A2A+7hbGbFC7l
	 JX7jm4waojlDLx45qoxCZ829Psvfi7qzkqysK6py0AxKyZ56UnB/b2Tc5rmiV1m3v4
	 TsOlCraG6CvqGlUjuqXHzE9NV/WecIpkDbGLmRdWbr/YU4chAEPZP3WU9dk+TNsMEw
	 13zukVeKliXYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944F9E77194;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:42 +0100
Subject: [PATCH 01/19] powerpc: Generalize MPC831x platform support
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=6164;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=RIPGsNtRW50K3E4tftXP6LldK+TxlhvB+Y3BnDoaHb0=;
 b=S1HDm+U7HAgFAMYdFK1sGW5heveyGGuVt/bXnOqJRnKzc8lb3SZrRfo7dZbPGf35gYi+2oOU+
 WHSlyHLVF8qDaTcaoRJxeDgcmAFHC41G2zWKnsXqTwnXkEt+cm8SWLU
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Reference Design Boards (RDB) don't have the same relevance they had
then the MPC831x platform was new; if any work is done today, then
likely based on used production boards, which are more readily available
than NXP's discontinued devboards.

To further reduce the focus on RDBs, add DT compatible strings for all
four MPC8314/5 variants.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig     |  2 +-
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig     |  2 +-
 arch/powerpc/configs/mpc83xx_defconfig              |  2 +-
 arch/powerpc/configs/ppc6xx_defconfig               |  2 +-
 arch/powerpc/platforms/83xx/Kconfig                 |  6 +++---
 arch/powerpc/platforms/83xx/Makefile                |  2 +-
 .../platforms/83xx/{mpc831x_rdb.c => mpc831x.c}     | 21 ++++++++++++++-------
 7 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
index 16a42e2267fbe092ea2344f50548101bc1e344ce..38a4d1ceff6a9ea75d9d8a313adbd2e5e5c9ac67 100644
--- a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
@@ -12,7 +12,7 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
-CONFIG_MPC831x_RDB=y
+CONFIG_MPC831x=y
 CONFIG_PCI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
index 80d40ae668eb6f1ae10bc0c1100d904946496112..788189a182458c92a62235c10fb3d21a87f4296b 100644
--- a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
@@ -12,7 +12,7 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
-CONFIG_MPC831x_RDB=y
+CONFIG_MPC831x=y
 CONFIG_PCI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 83c4710017e949c358f3ba8b73f5c1873cfd10f8..4af5e3e8c5a7f44f5e97b8fb4cdf691686f8967b 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -9,7 +9,7 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
-CONFIG_MPC831x_RDB=y
+CONFIG_MPC831x=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ca0c90e9583790cbca15ba956b371b8b0cb63c47..7e56dc497a48289614c8d01cc51be6d1edad7846 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -40,7 +40,7 @@ CONFIG_PPC_82xx=y
 CONFIG_EP8248E=y
 CONFIG_MGCOGE=y
 CONFIG_PPC_83xx=y
-CONFIG_MPC831x_RDB=y
+CONFIG_MPC831x=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
index d355ad40995fdc0fc3b4355126c65c761c21c296..944ec44a1fa6044b03ac71c295e891cd411ce444 100644
--- a/arch/powerpc/platforms/83xx/Kconfig
+++ b/arch/powerpc/platforms/83xx/Kconfig
@@ -18,12 +18,12 @@ config MPC830x_RDB
 	help
 	  This option enables support for the MPC8308 RDB and MPC8308 P1M boards.
 
-config MPC831x_RDB
-	bool "Freescale MPC831x RDB"
+config MPC831x
+	bool "Freescale MPC831x boards"
 	select DEFAULT_UIMAGE
 	select PPC_MPC831x
 	help
-	  This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
+	  This option enables support for all MPC831x-based boards.
 
 config MPC832x_RDB
 	bool "Freescale MPC832x RDB"
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 6fc3dba943dade4f63da090b520b0c35bb46a091..92fb0b34913e1113d3e6eac49acbb1c32fb06ab7 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -6,7 +6,7 @@ obj-y				:= misc.o
 obj-$(CONFIG_SUSPEND)		+= suspend.o suspend-asm.o
 obj-$(CONFIG_MCU_MPC8349EMITX)	+= mcu_mpc8349emitx.o
 obj-$(CONFIG_MPC830x_RDB)	+= mpc830x_rdb.o
-obj-$(CONFIG_MPC831x_RDB)	+= mpc831x_rdb.o
+obj-$(CONFIG_MPC831x)		+= mpc831x.o
 obj-$(CONFIG_MPC832x_RDB)	+= mpc832x_rdb.o
 obj-$(CONFIG_MPC834x_ITX)	+= mpc834x_itx.o
 obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x.c
similarity index 65%
rename from arch/powerpc/platforms/83xx/mpc831x_rdb.c
rename to arch/powerpc/platforms/83xx/mpc831x.c
index 5c39966762e4264d2ef91b2c4ef75fdf2c2c5d65..7250fc11c7ee80b266f39d0b3aebb0deb777c129 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * arch/powerpc/platforms/83xx/mpc831x_rdb.c
+ * arch/powerpc/platforms/83xx/mpc831x.c
  *
- * Description: MPC831x RDB board specific routines.
+ * Description: MPC831x board specific routines.
  * This file is based on mpc834x_sys.c
  * Author: Lo Wlison <r43300@freescale.com>
  *
@@ -22,24 +22,31 @@
 /*
  * Setup the architecture
  */
-static void __init mpc831x_rdb_setup_arch(void)
+static void __init mpc831x_setup_arch(void)
 {
 	mpc83xx_setup_arch();
 	mpc831x_usb_cfg();
 }
 
 static const char *board[] __initdata = {
+	/* Reference design boards */
 	"MPC8313ERDB",
 	"fsl,mpc8315erdb",
+
+	/* Generic chip compatibles */
+	"fsl,mpc8315e",
+	"fsl,mpc8315",
+	"fsl,mpc8314e",
+	"fsl,mpc8314",
 	NULL
 };
 
-machine_device_initcall(mpc831x_rdb, mpc83xx_declare_of_platform_devices);
+machine_device_initcall(mpc831x, mpc83xx_declare_of_platform_devices);
 
-define_machine(mpc831x_rdb) {
-	.name			= "MPC831x RDB",
+define_machine(mpc831x) {
+	.name			= "MPC831x",
 	.compatibles		= board,
-	.setup_arch		= mpc831x_rdb_setup_arch,
+	.setup_arch		= mpc831x_setup_arch,
 	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,

-- 
2.45.2



